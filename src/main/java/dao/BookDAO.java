package dao;

import static db.JdbcUtil.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import vo.BookInfoVO;
import vo.BookRentBtnVO;
import vo.BookRentVO;
import vo.BookRentalYNVO; 

public class BookDAO {

	public static BookDAO instance;
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	
	private BookDAO() {}
	
	public static BookDAO getInstance() {
		if(instance == null) {
			instance = new BookDAO();
		}
		return instance;
	}
	
	public void setConnection(Connection con) {
		this.con = con;
	}
	
//	관리자
//	insert > 등록 
//	목록(select)>수정(update), 삭제(delete)
//	
//
//	회원
//	select > 검색, 대여확인
//	update, insert> 대여

	//유저
	
	// 유저 도서 전체 목록(select - 전체)
	public ArrayList<BookInfoVO> selectBookUList(int page, int limit) {
		System.out.println("dao 1");
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String book_list_sql = "select * from(select rownum rnum, A.* from(select*from book_info order by book_code) A) where rnum between ? and ?";
		ArrayList<BookInfoVO> bookUList = new ArrayList<BookInfoVO>();
		int startrow=(page-1)*10+1;
		int endrow=(page-1)*10+10;
		
		try {
			System.out.println("dao 2");
			pstmt = con.prepareStatement(book_list_sql);
			System.out.println("dao 2-1");
			pstmt.setInt(1, startrow);
			System.out.println("dao 2-2");
			pstmt.setInt(2, endrow);
			System.out.println("dao 2-3");
			rs = pstmt.executeQuery();
			System.out.println("dao 2-4");

			System.out.println("dao 3");
			while(rs.next()) {
				BookInfoVO bookUL = new BookInfoVO();
				bookUL.setBOOK_NAME(rs.getString("BOOK_NAME"));
				bookUL.setBOOK_CODE(rs.getString("BOOK_CODE"));
				bookUL.setBOOK_WRITER(rs.getString("BOOK_WRITER"));
				bookUL.setBOOK_COMPANY(rs.getString("BOOK_COMPANY"));
				bookUL.setBOOK_DESCRIPTION(rs.getString("BOOK_DESCRIPTION"));
				bookUL.setBOOK_YN(rs.getString("BOOK_YN"));
				bookUList.add(bookUL);
				System.out.println("dao 4");
			}
			
		} catch(Exception e) {
			System.out.println("getBookUList 에러 : " + e);
		} finally {
			close(rs);
			close(pstmt);
		}
		System.out.println("dao 5");
		return bookUList;
	}

	// 유저 도서 검색 목록(select - 제목, 작가로 검색)
	public ArrayList<BookInfoVO> selectBookUSearch(int page, int limit, String bookSearch) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<BookInfoVO> bookUSearchList = new ArrayList<BookInfoVO>();
		int startrow=(page-1)*10+1;
		int endrow=(page-1)*10+10;
//		String sql = "select * FROM BOOK_INFO WHERE BOOK_NAME LIKE '%'||?||'%' OR BOOK_WRITER LIKE '%'||?||'%' "; //Statement문
		String sql = "select * from(select rownum rnum, A.* from(select * from book_info where (BOOK_NAME LIKE '%'||?||'%' OR BOOK_WRITER LIKE '%'||?||'%') order by book_code) A) where (rnum between ? and ?)";

		//String sql = "select * FROM BOOK_INFO WHERE BOOK_NAME LIKE '%"+bookSearch+"%' OR BOOK_WRITER LIKE '%"+bookSearch+"%' "; //Prepared문
		
		BookInfoVO bookUL = null;
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bookSearch);
			pstmt.setString(2, bookSearch);
			pstmt.setInt(3, startrow);
			pstmt.setInt(4, endrow);
			rs = pstmt.executeQuery(); //Prepared문
			
			//stmt = con.createStatement();
			//rs = stmt.executeQuery(sql); //Statement문

			if(rs.next()) {
				System.out.println("11");
				bookUSearchList = new ArrayList<BookInfoVO>();
				do {
					System.out.println("22");
					bookUL = new BookInfoVO();
					bookUL.setBOOK_NAME(rs.getString("BOOK_NAME"));
					bookUL.setBOOK_CODE(rs.getString("BOOK_CODE"));
					bookUL.setBOOK_WRITER(rs.getString("BOOK_WRITER"));
					bookUL.setBOOK_DESCRIPTION(rs.getString("BOOK_DESCRIPTION"));
					bookUL.setBOOK_COMPANY(rs.getString("BOOK_COMPANY"));
					bookUL.setBOOK_YN(rs.getString("BOOK_YN"));
					bookUSearchList.add(bookUL);
				}while(rs.next());
				System.out.println("33");
			}
		} catch(Exception e) {
			System.out.println("getBookUSearch 에러 : " + e);
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return bookUSearchList;
	}	
	
	// 유저 검색 도서 권수
		public int BookSearchCount(String bookSearch) {
			
			int listCount= 0;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			try {
				System.out.println("getConnection");
//				pstmt=con.prepareStatement("select count(*) from BOOK_INFO");
				pstmt=con.prepareStatement("select count(*) from book_info where BOOK_NAME LIKE '%'||?||'%' OR BOOK_WRITER LIKE '%'||?||'%' order by book_code");
				pstmt.setString(1, bookSearch);
				pstmt.setString(2, bookSearch);
				rs = pstmt.executeQuery();
				
				if(rs.next()){
					listCount = rs.getInt(1);
				}
			}catch(Exception ex){
				System.out.println("getListCount 에러: " + ex);			
			}finally{
				close(rs);
				close(pstmt);
			}
			return listCount;
		}
		
	// 대여하기(update, insert)
	// 대여정보 저장 insert
	   public int rentalbtn(BookRentBtnVO bookrentbtn) {

	      String sql = "INSERT INTO BOOK_RENT VALUES(?, ?, sysdate, sysdate+7)";
	      int insertCount = 0;
	      String bookcode = bookrentbtn.getBOOK_CODE();
	      System.out.println(bookcode);
	      try{
	         pstmt = con.prepareStatement(sql);
	         pstmt.setString(1, bookrentbtn.getBOOK_CODE());
	         pstmt.setString(2, bookrentbtn.getUSER_ID());
	         insertCount = pstmt.executeUpdate();
	         System.out.println("dao 대여정보저장 3" + insertCount);
	      }catch(Exception e) {
	         System.out.println("rentalbtn error : " + e);
	      }finally {
	         close(pstmt);
	      }
	      return insertCount;
	   }
	   
	// 대여정보 저장 update
	   public int rentalbtnupdate(BookRentBtnVO bookrentbtn) {
	      System.out.println("dao up 1");
	      
	      String sql = "UPDATE book_info SET BOOK_YN='y' WHERE book_code = ?";
	      
	      int updateCount = 0;
	      
	      try{
	         System.out.println("dao up 2");
	         pstmt = con.prepareStatement(sql);
	         pstmt.setString(1, bookrentbtn.getBOOK_CODE());
	         updateCount = pstmt.executeUpdate();
	         System.out.println("dao up 3 + book_code : " + bookrentbtn.getBOOK_CODE());
	      }catch(Exception e) {
	         System.out.println("bookrentbtnupdate error : " + e);
	      }finally {
	         close(pstmt);
	      }
	      
	      return updateCount;
	   }

	// 마이페이지 대여확인(select)
	public ArrayList<BookRentalYNVO> selectMyBookList(String uid) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<BookRentalYNVO> mybookList = new ArrayList<BookRentalYNVO>();
		String sql = "SELECT i.BOOK_CODE, BOOK_NAME, RDATE, OVERDUE FROM BOOK_INFO i, BOOK_RENT r WHERE i.BOOK_CODE = r.BOOK_CODE and user_id=?";
		System.out.println("dao1");
		BookRentalYNVO br = null;
		System.out.println(uid);
		try {
			System.out.println("dao2");
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, uid);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				System.out.println("dao3");
				mybookList = new ArrayList<BookRentalYNVO>();
				do {
					System.out.println("dao4");
					br = new BookRentalYNVO();
					br.setBOOK_CODE(rs.getString("BOOK_CODE"));
					br.setBOOK_NAME(rs.getString("BOOK_NAME"));
					br.setRDATE(rs.getString("RDATE"));
					br.setOVERDUE(rs.getString("OVERDUE"));
					System.out.println("dao5");
					mybookList.add(br);
				} while (rs.next());
			}
		} catch (Exception ex) {
			System.out.println("selectMyBookList 에러: " + ex);
		} finally {
			close(rs);
			close(pstmt);
		}
		System.out.println("dao6");
		return mybookList;
	}
	
	//관리자
	
	// 도서 등록(insert)
	public int insertBookInfo(BookInfoVO bookinfo) {
		String sql = "insert into book_info (book_name, book_code, book_writer, book_description, book_company) values(?, ?, ?, ?, ?)";
		int insertCount = 0;
		
		try{
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bookinfo.getBOOK_NAME());
			pstmt.setString(2, bookinfo.getBOOK_CODE());
			pstmt.setString(3, bookinfo.getBOOK_WRITER());
			pstmt.setString(4, bookinfo.getBOOK_DESCRIPTION());
			pstmt.setString(5, bookinfo.getBOOK_COMPANY());
			insertCount = pstmt.executeUpdate();
		}catch(Exception e) {
			System.out.println("insertBookInfo error : " + e);
		}finally {
			close(pstmt);
		}
		return insertCount;
	}
	
	// 도서 전체 목록
	public ArrayList<BookInfoVO> selectBookMList(int page, int limit){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String book_list_sql = "select book_name, book_yn, book_code from(select rownum rnum, A.* from(select*from book_info order by book_code) A) where rnum between ? and ?";
		ArrayList<BookInfoVO> bookList = new ArrayList<BookInfoVO>();
		int startrow=(page-1)*10+1;
		int endrow=(page-1)*10+10;
		
		try {
			pstmt = con.prepareStatement(book_list_sql);
			pstmt.setInt(1, startrow);
			pstmt.setInt(2, endrow);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				BookInfoVO bi = new BookInfoVO();
				bi.setBOOK_NAME(rs.getString("BOOK_NAME"));
				bi.setBOOK_CODE(rs.getString("BOOK_CODE"));
				bi.setBOOK_YN(rs.getString("BOOK_YN"));
				bookList.add(bi);
			}
		}catch(Exception e) {
			System.out.println("selectBookMList 에러 : " + e);
		}finally {
			close(rs);
			close(pstmt);
		}
		return bookList;
	}
	
	// 도서 총 권수
	public int selectListCount() {
		
		int listCount= 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			System.out.println("getConnection");
			pstmt=con.prepareStatement("select count(*) from BOOK_INFO");
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				listCount = rs.getInt(1);
			}
		}catch(Exception ex){
			System.out.println("getListCount 에러: " + ex);			
		}finally{
			close(rs);
			close(pstmt);
		}
		return listCount;
	}

	
	// 도서 상세정보(select)
	public BookInfoVO bookInfoView(String book_code) {
		System.out.println("dao 1");
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		BookInfoVO bookList = null;
		
		try {
			String sql = "SELECT * FROM BOOK_INFO WHERE BOOK_CODE = ?";
			System.out.println("dao 2");
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, book_code);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				System.out.println("dao 3");
				bookList = new BookInfoVO();
				bookList.setBOOK_NAME(rs.getString("BOOK_NAME"));
				bookList.setBOOK_CODE(rs.getString("BOOK_CODE"));
				bookList.setBOOK_WRITER(rs.getString("BOOK_WRITER"));
				bookList.setBOOK_COMPANY(rs.getString("BOOK_COMPANY"));
				bookList.setBOOK_DESCRIPTION(rs.getString("BOOK_DESCRIPTION"));
				bookList.setBOOK_YN(rs.getString("BOOK_YN"));
			}
		}catch(Exception ex) {
			System.out.println("bookInfoView 에러 : " + ex);
		}finally {
			close(rs);
			close(pstmt);
		}
		return bookList;
	}
	
	// 도서정보 수정(update)
	public int updateBookInfo(BookInfoVO bookinfo) {
		String sql = "UPDATE BOOK_INFO SET BOOK_NAME=?, BOOK_WRITER=?, BOOK_DESCRIPTION=?, BOOK_COMPANY=?, BOOK_YN=? WHERE BOOK_CODE=?";
		int updateCount = 0;
		System.out.println("dao 1");
		try {
			System.out.println("dao 2");
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bookinfo.getBOOK_NAME());
			pstmt.setString(2, bookinfo.getBOOK_WRITER());
			pstmt.setString(3, bookinfo.getBOOK_DESCRIPTION());
			pstmt.setString(4, bookinfo.getBOOK_COMPANY());
			pstmt.setString(5, bookinfo.getBOOK_YN());
			pstmt.setString(6, bookinfo.getBOOK_CODE());
			
			System.out.println("dao 3"+bookinfo.getBOOK_CODE());
			updateCount = pstmt.executeUpdate();
			System.out.println(updateCount+"12");
		}catch(Exception ex) {
			System.out.println("updateBookInfo 에러 : " + ex);
		}finally {
			close(pstmt);
		}
		return updateCount;
	}
	
	
	// 도서 삭제(delete)
	public int deleteBookInfo(String code) {
		System.out.println("dao 1");
		String sql = "DELETE FROM BOOK_INFO WHERE BOOK_CODE = ?";
		int deleteCount = 0;
		System.out.println("dao 2");
		
		try {
			System.out.println("dao 3");
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, code);
			deleteCount = pstmt.executeUpdate();
			System.out.println("dao 4");
		}catch(Exception ex) {
			System.out.println("deleteBookInfo 에러 : " + ex);
		}finally {
			close(pstmt);
		}
		System.out.println("dao 5");
		return deleteCount;
	}
	
}