package dao;

import static db.JdbcUtil.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import vo.*;

public class AdminDAO {
	
	public static AdminDAO instance;
	Connection con;
	PreparedStatement pstmt;
	Statement stmt;
	ResultSet rs;
	
	private AdminDAO() {}
	
	public static AdminDAO getInstance() {
		if(instance == null) {
			instance = new AdminDAO();
		}
		return instance;
	}

	public void setConnection(Connection con) {
		this.con = con;
	}
	
	// 도서 대여 현황 
	public ArrayList<BookRentalYNVO> adminBookrentAll(){
		ResultSet rs = null;
		String admin_book_sql = "SELECT * FROM (SELECT BOOK_CODE, I.BOOK_NAME, R.USER_ID, R.RDATE, R.OVERDUE "
				+ " FROM BOOK_INFO I INNER JOIN BOOK_RENT R USING (BOOK_CODE) "
				+ " WHERE I.BOOK_YN='y' ORDER BY R.RDATE) WHERE ROWNUM <= 3";
		ArrayList<BookRentalYNVO> adminBookList = new ArrayList<BookRentalYNVO>();
			
		try {
			Statement stmt = con.createStatement();
			rs = stmt.executeQuery(admin_book_sql);
			
			while(rs.next()) {
				BookRentalYNVO bry = new BookRentalYNVO();
				bry.setBOOK_CODE(rs.getString("BOOK_CODE"));
				bry.setBOOK_NAME(rs.getString("BOOK_NAME"));
				bry.setUSER_ID(rs.getString("USER_ID"));
				bry.setRDATE(rs.getString("RDATE"));
				bry.setOVERDUE(rs.getString("OVERDUE"));
				adminBookList.add(bry);
			}
		}catch(Exception e) {
			System.out.println("adminBookrentAll 에러 : " + e);
		}finally {
			close(rs);			
		}
		return adminBookList;
	}	
	
	// 좌석 예약 대여 현황 
		public ArrayList<SeatselcYNVO> adminSeatAll(){
			ResultSet rs = null;
			String admin_seat_sql = "SELECT * FROM (SELECT S.SEAT_NUM, U.USER_NAME, S.SEAT_NO, S.SEAT_DAY, USER_ID "
					+ "FROM SEAT S INNER JOIN USERS U USING (USER_ID) "
					+ "WHERE SEAT_SELC='예약' ORDER BY S.SEAT_NUM) WHERE ROWNUM <= 3";
			ArrayList<SeatselcYNVO> adminSeatList = new ArrayList<SeatselcYNVO>();
				
			try {
				Statement stmt = con.createStatement();
				rs = stmt.executeQuery(admin_seat_sql);
				
				while(rs.next()) {
					SeatselcYNVO sv = new SeatselcYNVO();
					sv.setSEAT_NUM(rs.getString("SEAT_NUM"));
					sv.setUSER_NAME(rs.getString("USER_NAME"));
					sv.setSEAT_NO(rs.getString("SEAT_NO"));
					sv.setSEAT_DAY(rs.getString("SEAT_DAY"));
					sv.setUSER_ID(rs.getString("USER_ID"));
					adminSeatList.add(sv);
				}
			}catch(Exception e) {
				System.out.println("adminSeatAll 에러 : " + e);
			}finally {
				close(rs);			
			}
			return adminSeatList;
		}	
	
	// 회원 가입 현황 
		public ArrayList<JoinVO> adminUserAll(){
			ResultSet rs = null;
			String admin_user_sql = "SELECT USER_NO, USER_NAME, USER_ID FROM USERS "
					+ "WHERE ROWNUM <= 3 ORDER BY USER_NO";
			ArrayList<JoinVO> adminUserList = new ArrayList<JoinVO>();
				
			try {
				Statement stmt = con.createStatement();
				rs = stmt.executeQuery(admin_user_sql);
				
				while(rs.next()) {
					JoinVO uv = new JoinVO();
					uv.setUSER_NO(rs.getString("USER_NO"));
					uv.setUSER_NAME(rs.getString("USER_NAME"));
					uv.setUSER_ID(rs.getString("USER_ID"));
					adminUserList.add(uv);
				}
			}catch(Exception e) {
				System.out.println("adminUserAll 에러 : " + e);
			}finally {
				close(rs);			
			}
			return adminUserList;
		}					

		// Q&A 현황 
		public ArrayList<QnaVO> adminQnaAll(){
			ResultSet rs = null;
			String admin_qna_sql = "SELECT qna_title, user_id, qna_date FROM qna "
					+ "WHERE ROWNUM <= 3 ORDER BY qna_no";
			ArrayList<QnaVO> adminQnaList = new ArrayList<QnaVO>();
				
			try {
				Statement stmt = con.createStatement();
				rs = stmt.executeQuery(admin_qna_sql);
				
				while(rs.next()) {
					QnaVO qv = new QnaVO();
					qv.setQNA_TITLE(rs.getString("QNA_TITLE"));
					qv.setUSER_ID(rs.getString("USER_ID"));
					qv.setQNA_DATE(rs.getString("QNA_DATE"));
					adminQnaList.add(qv);
				}
			}catch(Exception e) {
				System.out.println("adminQnaAll 에러 : " + e);
			}finally {
				close(rs);			
			}
			return adminQnaList;
			}
		
		
	// 리스트 갯수 
	public int adminBRCount() {

		int adminCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			pstmt = con.prepareStatement("select count(*) from BOOK_INFO ");
			rs = pstmt.executeQuery();

			if (rs.next()) {
				adminCount = rs.getInt(1);
			}
		} catch (Exception e) {
			System.out.println("관리자DAO adminBRCount 에러: "+ e);
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return adminCount;
	}

}
