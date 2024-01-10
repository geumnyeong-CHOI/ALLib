package svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.commit;
import static db.JdbcUtil.getConnection;
import static db.JdbcUtil.rollback;

import java.sql.Connection;

import dao.BookDAO;
import vo.BookInfoVO;

public class BookInfoUpdateService {
	// 관리자 도서 정보 수정
	public boolean updateBookInfo(BookInfoVO bookinfo) {
		System.out.println("svc 1");
		boolean updateResult = false;
		Connection con = getConnection();
		BookDAO bookDAO = BookDAO.getInstance();
		
		System.out.println("svc 2");
		bookDAO.setConnection(con);
		int updateCount = bookDAO.updateBookInfo(bookinfo);
		if(updateCount > 0) {
			System.out.println("svc 3");
			commit(con);
			updateResult = true;
		}else {
			rollback(con);
		}
		close(con);
		return updateResult;
	}
}
