package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.BookUListService;
//import svc.BookUListService;
import svc.BookUSearchService;
import vo.ActionForward;
import vo.BookInfoVO;
import vo.PageInfoVO;

public class BookUSearchAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();

		ArrayList<BookInfoVO> bookSearchList = new ArrayList<BookInfoVO>();
		
		int page=1;
		int limit=10;
		
		if(request.getParameter("page")!=null) {
			page=Integer.parseInt(request.getParameter("page"));
			System.out.println("action 2");
		}
		
		System.out.println("action 1");
		BookUSearchService bookUSearchService = new BookUSearchService();
		System.out.println("action 3");
		String bookSearch = request.getParameter("book_search");			
		int listCount=bookUSearchService.getListCount(bookSearch);
		bookSearchList = bookUSearchService.getBookUSearch(page,limit,bookSearch);
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
		request.setAttribute("bookUList", bookSearchList);
		
		forward.setPath("./book_u_search_list.jsp");
		
		System.out.println("action 7");
		
		return forward;
	}

}
