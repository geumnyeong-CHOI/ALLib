package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import vo.BookInfoVO;
import vo.BookRentVO;

import static db.JdbcUtil.*;


public class BookInfoDAO {

	public static BookInfoDAO instance;
	Connection con;
	PreparedStatement pstmt;
	Statement stmt;
	ResultSet rs;
	
	private BookInfoDAO() {}
	
	public static BookInfoDAO getInstance() {
		if(instance == null) {
			instance = new BookInfoDAO();
		}
		return instance;
	}

	public void setConnection(Connection con) {
		this.con = con;
	}
	
	
	//전체 도서 목록 - 회원
	public ArrayList<BookInfoVO> selectBookUList() {
		String sql = "SELECT * FROM BOOK_INFO";
		ArrayList<BookInfoVO> bookUList = null;
		BookInfoVO bookUL = null;
		
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			if(rs.next()) {
				bookUList = new ArrayList<BookInfoVO>();
				do {
					bookUL = new BookInfoVO();
					bookUL.setBOOK_NAME(rs.getString("BOOK_NAME"));
					bookUL.setBOOK_CODE(rs.getString("BOOK_CODE"));
					bookUL.setBOOK_WRITER(rs.getString("BOOK_WRITER"));
					bookUL.setBOOK_DESCRIPTION(rs.getString("BOOK_DESCRIPTION"));
					bookUL.setBOOK_COMPANY(rs.getString("BOOK_COMPANY"));
					bookUL.setBOOK_YN(rs.getString("BOOK_YN"));
					bookUList.add(bookUL);
				}while(rs.next());
			}
		} catch(Exception e) {
			System.out.println("getBookUList 에러 : " + e);
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return bookUList;
	}

	//대여 도서 목록 - 회원 : old
	public ArrayList<BookInfoVO> selectBookUSearch(String bookSearch) {
/*
- 검색(SELECT)
select BOOK_NAME, BOOK_CODE, BOOK_WRITER, BOOK_DESCRIPTION, BOOK_COMPANY FROM BOOK_INFO WHERE BOOK_NAME LIKE '%?%' OR BOOK_WRITER LIKE '%?%'; 		
 */
		//String sql = "SELECT * FROM BOOK_INFO WHERE BOOK_NAME=? OR BOOK_WRITER=? ";
		//String sql = "select BOOK_NAME, BOOK_CODE, BOOK_WRITER, BOOK_DESCRIPTION, BOOK_COMPANY FROM BOOK_INFO WHERE BOOK_NAME LIKE '%?%' OR BOOK_WRITER LIKE '%?%' ";		
//		String sql = "select * FROM BOOK_INFO WHERE BOOK_NAME LIKE '%?%' OR BOOK_WRITER LIKE '%?%' ";		
		//String sql = "select * FROM BOOK_INFO WHERE BOOK_NAME LIKE '%부자%' OR BOOK_WRITER LIKE '%부자%' ";
		
		String sql = "select * FROM BOOK_INFO WHERE BOOK_NAME LIKE '%"+bookSearch+"%' OR BOOK_NAME LIKE '%"+bookSearch+"%' ";
		ArrayList<BookInfoVO> bookUList = null;
		BookInfoVO bookUL = null;
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bookSearch);
			pstmt.setString(2, bookSearch);
			rs = pstmt.executeQuery();
			
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);

			if(rs.next()) {
				bookUList = new ArrayList<BookInfoVO>();
				do {
					bookUL = new BookInfoVO();
					bookUL.setBOOK_NAME(rs.getString("BOOK_NAME"));
					bookUL.setBOOK_CODE(rs.getString("BOOK_CODE"));
					bookUL.setBOOK_WRITER(rs.getString("BOOK_WRITER"));
					bookUL.setBOOK_DESCRIPTION(rs.getString("BOOK_DESCRIPTION"));
					bookUL.setBOOK_COMPANY(rs.getString("BOOK_COMPANY"));
					bookUL.setBOOK_YN(rs.getString("BOOK_YN"));
					bookUList.add(bookUL);
				}while(rs.next());
			}
		} catch(Exception e) {
			System.out.println("[ getBookUSearch ] 에러 : " + e);
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return bookUList;
	}	

	//대여 도서 목록 - 회원 : new
	public ArrayList<BookInfoVO> selectBookURent(String sid) {
/*
- 로그인한 ID의 BOOK_CODE와 일치하는 BOOK_NAME 출력
select i.book_name, r.rdate, r.overdue
from book_info i, book_rent r
where r.user_id='haze5000' and i.book_code = r.book_code;
 */
		//String sql = "SELECT * FROM BOOK_INFO WHERE BOOK_NAME=? OR BOOK_WRITER=? ";
		//String sql = "select i.book_name, r.rdate, r.overdue from book_info i, book_rent r where r.user_id=? and i.book_code = r.book_code";
		String sql = "select book_name, rdate, overdue from book_info i, book_rent r where r.user_id=? and i.book_code = r.book_code";
		ArrayList<BookInfoVO> bookUList = null;
		BookInfoVO bookUL = null;
		ArrayList<BookRentVO> bookURent = null;		
		BookRentVO bookUR = null;
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, sid);
			rs = pstmt.executeQuery();

			if(rs.next()) {
				bookUList = new ArrayList<BookInfoVO>();
				bookURent = new ArrayList<BookRentVO>();				
				do {
					bookUL = new BookInfoVO();
					bookUL.setBOOK_NAME(rs.getString("BOOK_NAME"));
					bookUList.add(bookUL);

					//bookUR = new BookRentVO();
					//bookUR.setRDATE(rs.getString("RDATE"));
					//bookUR.setOVERDUE(rs.getString("OVERDUE"));
					
					//bookURent.add(bookUR);
				}while(rs.next());
			}
		} catch(Exception e) {
			System.out.println("getBookURent 에러 : " + e);
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return bookUList;
	}	

}
