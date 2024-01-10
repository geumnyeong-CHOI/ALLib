package action;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.BookMyRentalService;
import vo.ActionForward;
import vo.BookRentVO;
import vo.BookRentalYNVO;

public class BookRentalAction implements Action {

	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("USER_ID");
		ActionForward forward = new ActionForward();
		ArrayList<BookRentalYNVO> bookRentalList = new ArrayList<BookRentalYNVO>();
		
		System.out.println("ac 1");
		System.out.println("id : " + id);
		
		if(id == null) {
			System.out.println("ac 2");
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("./loginForm.jsp");
		}else {
			System.out.println("ac 3");
			BookMyRentalService bookRentalService = new BookMyRentalService();
			BookRentVO bookRentVO = new BookRentVO();
			bookRentVO.setUSER_ID(id); 
			String uid = bookRentVO.getUSER_ID();
			System.out.println("ac 4");
			System.out.println("uid : " + uid);
			bookRentalList = bookRentalService.getBookRentalM(uid);
			
			request.setAttribute("bookRentalList", bookRentalList);
			System.out.println("ac 5");
			forward.setPath("./book_u_rent.jsp");
		}
		System.out.println("ac 6");
		return forward;
	}
		
}
