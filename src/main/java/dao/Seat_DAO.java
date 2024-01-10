package dao;
import static db.JdbcUtil.*;
import vo.SeatVO;
import vo.SeatselcYNVO;
import vo.BookRentalYNVO;
import vo.JoinVO;
import java.sql.*;
import java.util.ArrayList;

import javax.sql.DataSource;

public class Seat_DAO {
	
	DataSource ds;
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	
	private static Seat_DAO seat_dao;
	
	private Seat_DAO() {
	}

	public static Seat_DAO getInstance(){
		if(seat_dao == null){
			seat_dao = new Seat_DAO();
		}
		return seat_dao;
	}

	public void setConnection(Connection con){
		this.con = con;
	}

	// 로그인 처리
	public String selectLoginId(String USER_ID, String USER_PASSWD) {
		String loginId = null;
		String sql = "SELECT USER_ID FROM USERS WHERE USER_ID=? AND USER_PASSWD=?";

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, USER_ID);
			pstmt.setString(2, USER_PASSWD);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				loginId = rs.getString("USER_ID");
			}
		} catch (Exception ex) {
			System.out.println(" 에러: " + ex);
		} finally {
			close(rs);
			close(pstmt);
		}

		return loginId;
	}

	// 좌석 예약 선택
	 public int selectSeat(SeatVO seatVo) {	     
		       
	      String sql = "UPDATE SEAT SET SEAT_NUM = SEATNUM_SEQ.NEXTVAL , USER_ID=?, SEAT_DAY=?, SEAT_SELC='예약' WHERE SEAT_NO=?";
	      
	      int seatInsertCount = 0;	     
	      
	      try {
	      pstmt= con.prepareStatement(sql);
	      pstmt.setString(1,seatVo.getUSER_ID());
	      pstmt.setString(2,seatVo.getSEAT_DAY());	      
	      pstmt.setString(3,seatVo.getSEAT_NO());
	      seatInsertCount = pstmt.executeUpdate();
	      
	      System.out.println("seat Dao 좌석예약: ");
	   }catch(Exception e) {
		  System.out.println("selactSeat 좌석 예약 에러 "+ e);
	      e.printStackTrace();
	   }finally {
     	    	  close(pstmt);	
	   }
	   return seatInsertCount;	   
	}		 
	 
	// 좌석 취소
	 public int xxSeat(SeatVO seatVo) {	     
		       
	      String sql = "UPDATE SEAT SET SEAT_SELC='n' WHERE SEAT_NUM=? ";
	      int seatxInsertCount = 0;	     
	      System.out.println("77777777777: "+seatVo.getSEAT_NUM());
	      
	      try {
	      pstmt= con.prepareStatement(sql);
	      pstmt.setString(1,seatVo.getSEAT_NUM());      
	      seatxInsertCount = pstmt.executeUpdate();
	      
	      System.out.println("seat Dao 좌석취소: ");
	   }catch(Exception e) {
		  System.out.println("selactSeat 좌석 취소 에러 "+ e);
	      e.printStackTrace();
	   }finally {
     	  close(pstmt);	
	   }
	   return seatxInsertCount;	   
	}
	 
	// 마이페이지 좌석확인 
	public ArrayList<SeatVO> selcMySeat(String USER_ID) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<SeatVO> seatMyChk = new ArrayList<SeatVO>();
		String sql = "SELECT SEAT_NUM, SEAT_NO, SEAT_DAY, SEAT_SELC FROM SEAT WHERE USER_ID=? ORDER BY SEAT_SELC DESC";
		SeatVO svo = null;
		System.out.println("좌석확인 "+ USER_ID);
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, USER_ID);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				seatMyChk = new ArrayList<SeatVO>();
				do {
					svo = new SeatVO();
					svo.setSEAT_NUM(rs.getString("SEAT_NUM"));
					svo.setSEAT_DAY(rs.getString("SEAT_DAY"));
					svo.setSEAT_NO(rs.getString("SEAT_NO"));
					svo.setSEAT_SELC(rs.getString("SEAT_SELC"));
					seatMyChk.add(svo);
					System.out.println("seatnum" + rs.getString("SEAT_NUM") + "seatday"+rs.getString("SEAT_DAY") );
				} while (rs.next());
			}
		} catch (Exception ex) {
			System.out.println("좌석확인 selcMySeat 에러: " + ex);
		} finally {
			close(rs);
			close(pstmt);
		}
		return seatMyChk;
	}
	
	// 관리자메인페이지 좌석확인  
	public ArrayList<SeatselcYNVO> adminSeatAll(){
		ResultSet rs = null;
		String admin_seat_sql = "SELECT S.SEAT_NUM, U.USER_NAME, S.SEAT_NO, S.SEAT_DAY, S.SEAT_SELC "
				+ "FROM SEAT S INNER JOIN USERS U USING (USER_ID) WHERE SEAT_SELC='예약'";
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
				sv.setSEAT_SELC(rs.getString("SEAT_SELC"));
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
	
	// 관리자 좌석예약 전체확인  
		public ArrayList<SeatselcYNVO> adminAllChkSeat(){
			ResultSet rs = null;
			String admin_seat_sql = "SELECT S.SEAT_NUM, U.USER_NAME, S.SEAT_NO, S.SEAT_DAY, S.SEAT_SELC "
					+ " FROM SEAT S INNER JOIN USERS U ON U.USER_ID = S.USER_ID";
			ArrayList<SeatselcYNVO> adminAllSchkList = new ArrayList<SeatselcYNVO>();
				
			try {
				Statement stmt = con.createStatement();
				rs = stmt.executeQuery(admin_seat_sql);
				
				while(rs.next()) {
					SeatselcYNVO sv = new SeatselcYNVO();
					sv.setSEAT_NUM(rs.getString("SEAT_NUM"));
					sv.setUSER_NAME(rs.getString("USER_NAME"));
					sv.setSEAT_NO(rs.getString("SEAT_NO"));
					sv.setSEAT_DAY(rs.getString("SEAT_DAY"));
					sv.setSEAT_SELC(rs.getString("SEAT_SELC"));
//					sv.setUSER_ID(rs.getString("USER_ID"));
					adminAllSchkList.add(sv);
				}
			}catch(Exception e) {
				System.out.println("adminSeatAll 에러 : " + e);
			}finally {
				close(rs);			
			}
			return adminAllSchkList;
		}
		
		// 좌석예약 불러오기  
			public ArrayList<SeatVO> showSeat(){
				ResultSet rs = null;
				String showSeat_sql = "SELECT * FROM SEAT";
				ArrayList<SeatVO> showSeatview = new ArrayList<SeatVO>();
					
				try {
					Statement stmt = con.createStatement();
					rs = stmt.executeQuery(showSeat_sql);
					
					while(rs.next()) {
						SeatVO seatVo = new SeatVO();
						seatVo.setSEAT_NO(rs.getString("SEAT_NO"));
						seatVo.setSEAT_DAY(rs.getString("SEAT_DAY"));
						seatVo.setSEAT_SELC(rs.getString("SEAT_SELC"));
						showSeatview.add(seatVo);
					}
				}catch(Exception e) {
					System.out.println("showSeat 에러 : " + e);
				}finally {
					close(rs);			
				}
				return showSeatview;
			}	
	
	
}
