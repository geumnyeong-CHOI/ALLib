package svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import dao.BookDAO;
import vo.BookInfoVO;

public class BookUListService {
		
	// 도서 전체 목록
	public int getListCount() throws Exception{
		System.out.println("svc 1");
		int listCount = 0;
		Connection con = getConnection();
		BookDAO bookDAO = BookDAO.getInstance();
		bookDAO.setConnection(con);
		System.out.println("svc 2");
		listCount = bookDAO.selectListCount();
		close(con);
		return listCount;
	}
	
	// 도서 전체 페이지
	public ArrayList<BookInfoVO> getBookUList(int page, int limit) throws Exception{
		System.out.println("svc 3");
		ArrayList<BookInfoVO> bookUList = null;
		Connection con = getConnection();
		BookDAO bookDAO = BookDAO.getInstance();
		bookDAO.setConnection(con);
		bookUList = bookDAO.selectBookUList(page, limit);
		close(con);
		System.out.println("svc 4");
		return bookUList;
	}
}