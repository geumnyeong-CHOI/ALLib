package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.BookInfoUpdateService;
import vo.ActionForward;
import vo.BookInfoVO;

public class BookInfoUpdateAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("USER_ID");
		
		System.out.println("ac 1");
		
		BookInfoVO bookinfo = new BookInfoVO();
		System.out.println("ac 2");
		boolean updateResult = false;
		bookinfo.setBOOK_NAME(request.getParameter("BOOK_NAME"));
		bookinfo.setBOOK_CODE(request.getParameter("BOOK_CODE"));
		bookinfo.setBOOK_WRITER(request.getParameter("BOOK_WRITER"));
		bookinfo.setBOOK_DESCRIPTION(request.getParameter("BOOK_DESCRIPTION"));
		bookinfo.setBOOK_COMPANY(request.getParameter("BOOK_COMPANY"));
		bookinfo.setBOOK_YN(request.getParameter("BOOK_YN"));
		System.out.println("ac 3");
		BookInfoUpdateService bookInfoUpdateService = new BookInfoUpdateService();
		updateResult = bookInfoUpdateService.updateBookInfo(bookinfo);
		ActionForward forward = null;
		System.out.println("ac 4");
		if(updateResult) {
			System.out.println("ac 5");
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("./BookMListAction.book");
		}else {
			System.out.println("ac 6");
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			
			out.println("<script>");
			out.println("alert('도서정보 수정 실패');");
			out.println("location.href='./BookMListAction.book';");
			out.println("</script>");
		}
		return forward;
	}

	
	
	
	
	
	
}
