package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import svc.BookInfoViewService;
import vo.ActionForward;
import vo.BookInfoVO;

public class BookInfoViewAction implements Action{
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("action 1");
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("USER_ID");
		
		ActionForward forward = null;
		
		if(id == null) {
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("./userLogin.us");
		}
		else if (id.equals("admin")) {
			System.out.println("action 2");
			response.setContentType("text/html; charset=UTF-8");
			forward = new ActionForward();
			String book_code = request.getParameter("book_code");
			System.out.println("도서코드 : "+book_code);
			String page = (String) session.getAttribute("page");
			BookInfoViewService bookInfoViewService = new BookInfoViewService();
			BookInfoVO bookView = bookInfoViewService.getBookInfo(book_code);
			request.setAttribute("page", page);
			request.setAttribute("bookView", bookView);
			forward.setPath("./book_m_updatedelete.jsp");
		}			
		System.out.println("action 3");
		return forward;
	}

}
