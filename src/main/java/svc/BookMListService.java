package svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import dao.BookDAO;
import vo.BookInfoVO;

public class BookMListService {
	
	// 관리자 도서 전체 목록
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
	public ArrayList<BookInfoVO> getBooklistM(int page, int limit) throws Exception{
		ArrayList<BookInfoVO> bookList = null;
		Connection con = getConnection();
		BookDAO bookDAO = BookDAO.getInstance();
		bookDAO.setConnection(con);
		bookList = bookDAO.selectBookMList(page, limit);
		close(con);
		return bookList;
	}
		
}

