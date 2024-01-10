package svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.commit;
import static db.JdbcUtil.getConnection;
import static db.JdbcUtil.rollback;

import java.sql.Connection;

import dao.BookDAO;
import vo.BookRentBtnVO;

public class BookRentBtnService {
	//도서대여버튼
	public boolean rentalbtn(BookRentBtnVO bookrentbtn) {
		boolean joinSuccess = false;
		BookDAO bookDAO = BookDAO.getInstance();
		Connection con = getConnection();
		
		bookDAO.setConnection(con);
		int insertCount = bookDAO.rentalbtn(bookrentbtn);
		if(insertCount > 0) {
			joinSuccess = true;
			commit(con);
		}else {
			rollback(con);
		}
		close(con);
		return joinSuccess;
	}
	
	public boolean rentalbtnupdate(BookRentBtnVO bookrentbtn) {
		System.out.println("svc 1");
		boolean updateResult = false;
		BookDAO bookDAO = BookDAO.getInstance();
		Connection con = getConnection();
		
		System.out.println("svc 2");
		bookDAO.setConnection(con);
		int updateCount = bookDAO.rentalbtnupdate(bookrentbtn);
				
		System.out.println("svc 3");
		System.out.println(updateCount);
		if(updateCount > 0) {
			updateResult = true;
			commit(con);
		}else {
			rollback(con);
		}
		close(con);
		return updateResult;
	}
	
}
