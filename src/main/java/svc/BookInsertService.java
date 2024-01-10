package svc;

import java.sql.Connection;
import static db.JdbcUtil.*;
import dao.BookDAO;
import vo.BookInfoVO;

public class BookInsertService {
	// 관리자 도서 등록
	public boolean insertBookInfo(BookInfoVO bookinfo) {
		boolean insertSuccess = false;
		BookDAO bookDAO = BookDAO.getInstance();
		Connection con = getConnection();
		System.out.println("service 1 ");
		bookDAO.setConnection(con);
		int insertCount = bookDAO.insertBookInfo(bookinfo);
		System.out.println("service 2 ");
		if(insertCount > 0) {
			System.out.println("service 3 ");
			insertSuccess = true;
			commit(con);
		}else {
			System.out.println("service 4 ");
			rollback(con);
		}
		System.out.println("service 5 ");
		close(con);
		return insertSuccess;
	}
}
