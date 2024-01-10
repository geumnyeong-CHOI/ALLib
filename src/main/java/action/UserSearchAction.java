package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.UserListService;
import svc.UserSearchService;
import vo.ActionForward;
import vo.PageInfoVO;
import vo.JoinVO;

public class UserSearchAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		HttpSession session = request.getSession();
		ActionForward forward = new ActionForward();
		
		ArrayList<JoinVO> userSearchList = new ArrayList<JoinVO>(); 

		UserSearchService userListService = new UserSearchService();
		
		String userSearch = request.getParameter("USER_SEARCH");
		
		ArrayList<JoinVO> userLookupList = userListService.getUserSearch(userSearch);

		request.setAttribute("userLookupList", userLookupList);
		forward.setPath("./user_search_list.jsp");
		response.setContentType("text/html;charset=UTF-8");

		return forward;

	}

}
