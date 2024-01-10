package svc;

import static db.JdbcUtil.*;
import java.util.ArrayList;
import java.sql.Connection;
import dao.BookDAO;
import vo.BookInfoVO;
import vo.BookRentalYNVO;

public class BookMyRentalService {
//마이페이지 대여확인
	public ArrayList<BookRentalYNVO> getBookRentalM(String uid){
		System.out.println("svc 1");
		Connection con = getConnection();
		BookDAO bookDAO = BookDAO.getInstance();
		bookDAO.setConnection(con);
		
		System.out.println("svc 2");
		ArrayList<BookRentalYNVO> bookRental = new ArrayList<BookRentalYNVO>();
		bookRental = null;
		bookRental = bookDAO.selectMyBookList(uid);
		close(con);
		
		System.out.println("svc 3");
		return bookRental;
	}
	
}
