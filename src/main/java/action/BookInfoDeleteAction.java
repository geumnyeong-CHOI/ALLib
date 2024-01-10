package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.BookInfoDeleteService;
import vo.ActionForward;
import vo.BookInfoVO;

public class BookInfoDeleteAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("USER_ID");
		
		System.out.println("ac 1");
		
		ActionForward forward = null;
		
		if(id == null || !id.equals("admin")) {
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("./userLogin.us");
		}else if(id.equals("admin")) {
			System.out.println("ac 2");
			response.setContentType("text/html; charset=UTF-8");
			forward = new ActionForward();
			boolean deleteResult = false;
			String deleteCode = request.getParameter("book_code");
			System.out.println("도서코드 : "+deleteCode);
			BookInfoDeleteService bookInfoDeleteService = new BookInfoDeleteService();
			deleteResult = bookInfoDeleteService.deleteBookInfo(deleteCode);
			System.out.println("ac 3");
			
			if(deleteResult) {
				System.out.println("ac 4");
				forward = new ActionForward();
				forward.setRedirect(true);
				forward.setPath("./BookMListAction.book");
			}else {
				System.out.println("ac 5");
				response.setContentType("text/html; charset=utf-8");
				PrintWriter out = response.getWriter();
				
				out.println("<script>");
				out.println("alert('도서 삭제 실패');");
				out.println("location.href='./bookMListAction.book';");
				out.println("</script>");
			}
		}
		System.out.println("ac 6");
		return forward;
	}

}
