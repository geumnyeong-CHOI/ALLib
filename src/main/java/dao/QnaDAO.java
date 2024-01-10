package dao;


import java.sql.*;
import java.util.ArrayList;

import vo.QnaVO;
import static db.JdbcUtil.*;

public class QnaDAO {

	public static QnaDAO instance;
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;

	private QnaDAO() {
	}

	public static QnaDAO getInstance() {
		if (instance == null) {
			instance = new QnaDAO();
		}
		return instance;
	}

	public void setConnection(Connection con) {
		this.con = con;
	}
	
	public int insertQna(QnaVO users) {
		String sql = "INSERT INTO QNA(QNA_NO,QNA_TITLE,USER_ID,QNA_PASSWD,QNA_CONTENT) VALUES (QNANO_SEQ.nextval,?, ?, ?, ?)";
		int insertCount = 0;

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, users.getQNA_TITLE());
			pstmt.setString(2, users.getUSER_ID());
			pstmt.setString(3, users.getQNA_PASSWD());
			pstmt.setString(4, users.getQNA_CONTENT());
			insertCount = pstmt.executeUpdate();

		} catch (Exception ex) {
			System.out.println("qna 에러: " + ex);
		} finally {
			close(pstmt);
		}
		return insertCount;
	}
	
	public int selectListCount() {
		String sql = "select count(*) from qna";
		int result = 0;
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				result = rs.getInt(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return result;
	}

	public ArrayList<QnaVO> selectQnaList(int page, int limit) {
		ArrayList<QnaVO> qnaList = new ArrayList<QnaVO>();
		QnaVO vo = null;
		int startrow=(page-1)*10+1;
		int endrow=(page-1)*10+10;
		
		try {
			String sql = "select B.qna_no, B.qna_title, B.user_id, B.qna_date, B.qna_passwd, B.qna_comment from (select rownum rnum, A.* from(select * from qna order by qna_no desc) A) B where rnum between ? and ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startrow);
			pstmt.setInt(2, endrow);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				vo = new QnaVO();
				vo.setQNA_NO(rs.getInt("QNA_NO"));
				vo.setQNA_TITLE(rs.getString("QNA_TITLE"));
				vo.setUSER_ID(rs.getString("USER_ID"));
				vo.setQNA_DATE(rs.getString("QNA_DATE"));
				vo.setQNA_PASSWD(rs.getString("QNA_PASSWD"));
				vo.setQNA_COMMENT(rs.getString("QNA_COMMENT"));
				qnaList.add(vo);
			}
			
		} catch(SQLException ex) {
			System.out.println("sql문 잘못됨");
			ex.printStackTrace();
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println(e);
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return qnaList;
	}

	public QnaVO getQna(String qnaNo) {
		String sql = "select * from qna where qna_no = ?";
		QnaVO qnaVo = null;
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(qnaNo));
			rs = pstmt.executeQuery();
			while(rs.next()) {
				qnaVo = new QnaVO();
				qnaVo.setQNA_NO(rs.getInt("QNA_NO"));
				qnaVo.setQNA_TITLE(rs.getString("QNA_TITLE"));
				qnaVo.setUSER_ID(rs.getString("USER_ID"));
				qnaVo.setQNA_CONTENT(rs.getString("QNA_CONTENT"));
				qnaVo.setQNA_DATE(rs.getString("QNA_DATE"));
				qnaVo.setQNA_COMMENT(rs.getString("QNA_COMMENT"));
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			
		}
		return qnaVo;
	}

	//댓글달기
	public int comment(QnaVO vo) {
		String sql = "update qna set qna_comment=? where qna_no=?";
		int result = -1;
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, vo.getQNA_COMMENT());
			pstmt.setInt(2, vo.getQNA_NO());
			pstmt.executeUpdate();
			
			result = 1;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

		//내 qna 총갯수불러오기
	public int selectMyListCount(String uid) {
		
		String sql = "select count(*) from qna where user_id = ?";
		int result = 0;
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, uid);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				result = rs.getInt(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return result;
	}

	//내 qna 리스트 불러오기
	public ArrayList<QnaVO> selectMyQnaList(int page, int limit, String uid) {
		ArrayList<QnaVO> qnaList = new ArrayList<QnaVO>();
		QnaVO vo = null;
		int startrow=(page-1)*10+1;
		int endrow=(page-1)*10+10;
		
		try {
			String sql = "select B.qna_no, B.qna_title, B.user_id, B.qna_date, B.qna_passwd, B.qna_comment from (select rownum rnum, A.* from(select * from qna where user_id = ? order by qna_no desc) A) B where rnum between ? and ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, uid);
			pstmt.setInt(2, startrow);
			pstmt.setInt(3, endrow);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				vo = new QnaVO();
				vo.setQNA_NO(rs.getInt("QNA_NO"));
				vo.setQNA_TITLE(rs.getString("QNA_TITLE"));
				vo.setUSER_ID(rs.getString("USER_ID"));
				vo.setQNA_DATE(rs.getString("QNA_DATE"));
				vo.setQNA_PASSWD(rs.getString("QNA_PASSWD"));
				vo.setQNA_COMMENT(rs.getString("QNA_COMMENT"));
				qnaList.add(vo);
			}
			
		} catch(SQLException ex) {
			System.out.println("sql문 잘못됨");
			ex.printStackTrace();
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println(e);
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return qnaList;
	}

	public int deleteMyQna(int deleteQna) {
		String sql = "delete qna where QNA_NO=?";
		int deleteCount = 0;

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, deleteQna);
			deleteCount = pstmt.executeUpdate();
			
		} catch (Exception ex) {
			System.out.println("deleteMember 에러: " + ex);
		} finally {
			close(pstmt);
		}
		return deleteCount;
	}
	
	
}
