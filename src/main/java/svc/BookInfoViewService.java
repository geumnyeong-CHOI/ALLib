package svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.commit;
import static db.JdbcUtil.getConnection;
import static db.JdbcUtil.rollback;

import java.sql.Connection;

import dao.BookDAO;
import vo.BookInfoVO;

public class BookInfoViewService {
	public BookInfoVO getBookInfo(String book_code) {
		System.out.println("service 1");
		Connection con = getConnection();
		BookDAO bookDAO = BookDAO.getInstance();
		bookDAO.setConnection(con);
		System.out.println("service 2");
		
		BookInfoVO bookinfo = bookDAO.bookInfoView(book_code);
		System.out.println("service 3");
		close(con);
		
		return bookinfo;
	}
}
