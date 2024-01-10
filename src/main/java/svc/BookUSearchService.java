package svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import dao.BookDAO;
import vo.BookInfoVO;

public class BookUSearchService {
	
	// 도서 전체 목록
	public int getListCount(String bookSearch) throws Exception{
		System.out.println("svc 1");
		int listCount = 0;
		Connection con = getConnection();
		BookDAO bookDAO = BookDAO.getInstance();
		bookDAO.setConnection(con);
		System.out.println("svc 2");
		listCount = bookDAO.BookSearchCount(bookSearch);
		close(con);
		return listCount;
	}
	
	public ArrayList<BookInfoVO> getBookUSearch(int page, int limit, String bookSearch) throws Exception{
		System.out.println("svc 3");
		ArrayList<BookInfoVO> bookUSearch = null;
		Connection con = getConnection();
		BookDAO bookDAO = BookDAO.getInstance();
		bookDAO.setConnection(con);
		bookUSearch = bookDAO.selectBookUSearch(page, limit, bookSearch);
		close(con);
		System.out.println("svc 4");
		
		return bookUSearch;
	}
}
