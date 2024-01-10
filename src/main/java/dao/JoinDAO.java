package dao;

import java.sql.*;
import java.util.ArrayList;

import vo.JoinVO;
import static db.JdbcUtil.*;

public class JoinDAO {

	// DB연결
	public static JoinDAO instance;
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;

	private JoinDAO() {
	}

	public static JoinDAO getInstance() {
		if (instance == null) {
			instance = new JoinDAO();
		}
		return instance;
	}

	public void setConnection(Connection con) {
		this.con = con;
	}

	// 로그인
	public String selectLoginId(JoinVO users) {
		String loginId = null;
		String sql = "select user_id from users where user_id=? and user_passwd=?";

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, users.getUSER_ID());
			pstmt.setString(2, users.getUSER_PASSWD());
			rs = pstmt.executeQuery();

			if (rs.next()) {
				loginId = rs.getString("USER_ID");
				System.out.println("로그인된 짱구" + loginId);

			}
		} catch (Exception ex) {
			System.out.println("에러 : " + ex);
		} finally {
			close(rs);
			close(pstmt);
		}
		return loginId;
	}

	// 이메일로 아이디 찾기
	public JoinVO findID(String name, String email) {

		String sql = "select * from users where user_name = ? and user_email =?";
		JoinVO mv = null;

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, email);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				mv = new JoinVO();
				mv.setUSER_ID(rs.getString("USER_ID"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {

			close(rs);
			close(pstmt);
		}
		return mv;
	}

	// 폰번호로 아이디찾기
	public JoinVO findIDPhone(String name, String phone) {

		String sql = "select * from users where user_name = ? and user_phone =?";
		JoinVO mv = null;

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, phone);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				mv = new JoinVO();
				mv.setUSER_ID(rs.getString("USER_ID"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return mv;
	}

	public JoinVO findPwd(String id, String name, String email) {
		String sql = "select * from users where user_id =? and user_name =? and user_email =?";
		JoinVO jv = null;
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, name);
			pstmt.setString(3, email);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				jv = new JoinVO();
				jv.setUSER_PASSWD(rs.getString("USER_PASSWD"));
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return jv;
	}

	public JoinVO findPwdPhone(String id, String name, String phone) {
		String sql = "select * from users where user_id =? and user_name =? and user_phone =?";
		JoinVO jv = null;
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, name);
			pstmt.setString(3, phone);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				jv = new JoinVO();
				jv.setUSER_PASSWD(rs.getString("USER_PASSWD"));
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return jv;
	}

	// 회원가입
	public int insertUser(JoinVO users) {
		String sql = "INSERT INTO USERS VALUES (?, ?, ?, ?, ?, ?, lpad(USERNO_SEQ.nextval, '5', '0'))";
		int insertCount = 0;

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, users.getUSER_ID());
			pstmt.setString(2, users.getUSER_PASSWD());
			pstmt.setString(3, users.getUSER_NAME());
			pstmt.setString(4, users.getUSER_PHONE());
			pstmt.setString(5, users.getUSER_EMAIL());
			pstmt.setString(6, users.getUSER_BIRTH());
			insertCount = pstmt.executeUpdate();

		} catch (Exception ex) {
			System.out.println("joinMember 에러: " + ex);
		} finally {
			close(pstmt);
		}
		return insertCount;
	}

	// 회원목록
	public ArrayList<JoinVO> selectUserList(int page, int limit) {
		String sql = "select * from(select rownum rnum, A.* from(select*from users order by user_no) A) where rnum between ? and ?";
		ArrayList<JoinVO> userList = null;

		int startrow = (page - 1) * 10 + 1;
		int endrow = (page - 1) * 10 + 20;
		JoinVO users = null;
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startrow);
			pstmt.setInt(2, endrow);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				userList = new ArrayList<JoinVO>();
				do {
					users = new JoinVO();
					users.setUSER_ID(rs.getString("USER_ID"));
					users.setUSER_PASSWD(rs.getString("USER_PASSWD"));
					users.setUSER_NAME(rs.getString("USER_NAME"));
					users.setUSER_PHONE(rs.getString("USER_PHONE"));
					users.setUSER_EMAIL(rs.getString("USER_EMAIL"));
					users.setUSER_BIRTH(rs.getString("USER_BIRTH"));
					userList.add(users);
				} while (rs.next());
			}
		} catch (Exception ex) {
			System.out.println("getListUser 에러: " + ex);
			ex.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return userList;
	}

	// 회원조회
	public JoinVO selectUser(String id) {
		String sql = "select * from users where user_id=?";
		JoinVO users = null;
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				users = new JoinVO();
				users.setUSER_ID(rs.getString("USER_ID"));
				users.setUSER_PASSWD(rs.getString("USER_PASSWD"));
				users.setUSER_NAME(rs.getString("USER_NAME"));
				users.setUSER_PHONE(rs.getString("USER_PHONE"));
				users.setUSER_EMAIL(rs.getString("USER_EMAIL"));
				users.setUSER_BIRTH(rs.getString("USER_BIRTH"));

				System.out.println("짱구@@@ myinfo 잘받아오는지" + rs.getString("USER_BIRTH"));
			}
		} catch (Exception ex) {
			System.out.println("getDetailMember 에러: " + ex);
		} finally {
			close(rs);
			close(pstmt);
		}
		return users;
	}

	// 회원수정
	public int updateUser(JoinVO users) {
		// sql 구문 확인하기
		String sql = "update users set user_passwd=?, user_name=?, user_phone=?, user_email=? where user_id=?";
		int result = -1;

		try {
			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, users.getUSER_PASSWD());
			pstmt.setString(2, users.getUSER_NAME());
			pstmt.setString(3, users.getUSER_PHONE());
			pstmt.setString(4, users.getUSER_EMAIL());
			pstmt.setString(5, users.getUSER_ID());
			System.out.println("짱구@@ 받아온 USER_ID는? " + users.getUSER_ID());
			pstmt.executeUpdate();

			result = 1;
			System.out.println("짱구@@ 회원정보수정완료");
		} catch (SQLException ex) {
			System.out.println("짱구@@ sql구문이 잘못됨");
			ex.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	// 회원탈퇴
	public int deleteUser(String id) {
		String sql = "delete users where user_id=?";
		int deleteCount = 0;

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			deleteCount = pstmt.executeUpdate();
		} catch (Exception ex) {
			System.out.println("deleteMember 에러: " + ex);
		} finally {
			close(pstmt);
		}
		return deleteCount;
	}

	public int selectUserCount() {

		int userCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			pstmt = con.prepareStatement("select count(*) from users");
			rs = pstmt.executeQuery();

			if (rs.next()) {
				userCount = rs.getInt(1);
			}
		} catch (Exception ex) {
			System.out.println("selectUserCount 에러: " + ex);
		} finally {
			close(rs);
			close(pstmt);
		}
		return userCount;
	}

	public ArrayList<JoinVO> selectUserSearch(String userSearch) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<JoinVO> userSearchList = new ArrayList<JoinVO>();

		String sql = "select * from users where user_id like '%'||?||'%' or user_name like '%'||?||'%' order by user_no";

		JoinVO vo = null;
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, userSearch);
			pstmt.setString(2, userSearch);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				do {
					vo = new JoinVO();
					vo.setUSER_ID(rs.getString("USER_ID"));
					vo.setUSER_NAME(rs.getString("USER_NAME"));
					
					userSearchList.add(vo);
				}while(rs.next());
			}
			
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}

		return userSearchList;
	}

	public boolean idCheck(JoinVO vo) {
		boolean idchk = false;
		String sql = "select count(*) from users where user_id = ?";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, vo.getUSER_ID());
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int result = rs.getInt(1);
				if(result > 0) idchk = true;
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return idchk;
	}

}
