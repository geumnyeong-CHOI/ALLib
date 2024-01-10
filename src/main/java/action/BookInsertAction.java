package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.BookInsertService;
import vo.ActionForward;
import vo.BookInfoVO;

public class BookInsertAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("USER_ID");
		ActionForward forward = null;
		if(id == null) {
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("./userLogin.us");
		}
		else if (id.equals("admin")) {
			BookInfoVO bookinfo = new BookInfoVO();
			boolean insertResult = false;
			bookinfo.setBOOK_NAME(request.getParameter("BOOK_NAME"));
			bookinfo.setBOOK_CODE(request.getParameter("BOOK_CODE"));
			bookinfo.setBOOK_WRITER(request.getParameter("BOOK_WRITER"));
			bookinfo.setBOOK_DESCRIPTION(request.getParameter("BOOK_DESCRIPTION"));
			bookinfo.setBOOK_COMPANY(request.getParameter("BOOK_COMPANY"));
			BookInsertService bookInsertService = new BookInsertService();
			insertResult = bookInsertService.insertBookInfo(bookinfo);
		
			if(insertResult == false) {
				response.setContentType("text/html; charset=utf-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('도서등록실패');");
				out.println("history.back();");
				out.println("</script>");
				out.close();
			}else {
				forward = new ActionForward();
				forward.setRedirect(true);
//				forward.setPath("./MainAdmin.jsp");
				forward.setPath("./BookMListAction.book");
			}
		}
		return forward;
	}

}
