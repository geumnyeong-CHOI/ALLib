package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.BookUListService;
import vo.ActionForward;
import vo.BookInfoVO;
import vo.PageInfoVO;

public class BookUListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		
		ArrayList<BookInfoVO> bookUList = new ArrayList<BookInfoVO>();
		System.out.println("action 1");

		int page=1;
		int limit=10;

		if(request.getParameter("page")!=null) {
			page=Integer.parseInt(request.getParameter("page"));
			System.out.println("action 2");
		}
		
		BookUListService bookUListService = new BookUListService();
   	 	System.out.println("action 3");
		int listCount=bookUListService.getListCount();
		bookUList = bookUListService.getBookUList(page,limit);
   		int maxPage=(int)((double)listCount/limit+0.95);
   		int startPage = (((int) ((double)page / 10 + 0.9)) - 1) * 10 + 1;
   	        int endPage = startPage+10-1;
   	 	System.out.println("action 4");
   		if (endPage> maxPage) endPage= maxPage;

   		PageInfoVO pageInfo = new PageInfoVO();
   		System.out.println("action 5");
   		pageInfo.setEndPage(endPage);
   		pageInfo.setListCount(listCount);
		pageInfo.setMaxPage(maxPage);
		pageInfo.setPage(page);
		pageInfo.setStartPage(startPage);	
		System.out.println("action 6");
		request.setAttribute("pageInfo", pageInfo);
		request.setAttribute("bookUList", bookUList);
		
		forward.setPath("./book_u_list.jsp");
		
		System.out.println("action 7");
		return forward;
	}

}
