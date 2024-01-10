package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.BookMListService;
import vo.ActionForward;
import vo.BookInfoVO;
import vo.PageInfoVO;

public class BookMListAction implements Action{
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("USER_ID");
		ActionForward forward= new ActionForward();
		System.out.println("action 1");
		System.out.println("id: " + id);
		if(id == null) {
			System.out.println("action 2");

			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("./userLogin.us");
		}else if (id.equals("admin")) {
			System.out.println("action 3");

			ArrayList<BookInfoVO> bookList = new ArrayList<BookInfoVO>();
			int page=1;
			int limit=10;
			System.out.println("action 4");

			if(request.getParameter("page")!=null) {
				page=Integer.parseInt(request.getParameter("page"));
				System.out.println("action 5");
			}
			
			BookMListService bookMListService = new BookMListService();
			int listCount=bookMListService.getListCount();
			bookList = bookMListService.getBooklistM(page,limit);
	   		int maxPage=(int)((double)listCount/limit+0.95);
	   		int startPage = (((int) ((double)page / 10 + 0.9)) - 1) * 10 + 1;
	   	        int endPage = startPage+10-1;
	   	 	System.out.println("action 6");
	   		if (endPage> maxPage) endPage= maxPage;

	   		PageInfoVO pageInfo = new PageInfoVO();
	   		pageInfo.setEndPage(endPage);
	   		pageInfo.setListCount(listCount);
			pageInfo.setMaxPage(maxPage);
			pageInfo.setPage(page);
			pageInfo.setStartPage(startPage);	
			System.out.println("action 7");
			request.setAttribute("pageInfo", pageInfo);
			request.setAttribute("bookList", bookList);
			
			forward.setPath("./book_m_list.jsp");
		}
		System.out.println("action 8");
		return forward;
	}

}
