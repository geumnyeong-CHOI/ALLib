package svc;

import java.sql.Connection;
import static db.JdbcUtil.*;
import dao.BookDAO;

public class BookInfoDeleteService {
	// 관리자 도서정보 삭제
	public boolean deleteBookInfo(String deleteBook) {
		boolean deleteResult = false;
		BookDAO bookDAO = BookDAO.getInstance();
		Connection con = getConnection();
		
		System.out.println("svc 1");
		
		bookDAO.setConnection(con);
		int deleteCount = bookDAO.deleteBookInfo(deleteBook);
		System.out.println("svc 2");
		
		if(deleteCount > 0) {
			System.out.println("svc 3");
			commit(con);
			deleteResult = true;
		}else {
			System.out.println("svc 4");
			rollback(con);
		}
		close(con);
		System.out.println("svc 5");
		return deleteResult;
	}
}
