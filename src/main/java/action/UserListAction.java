package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.UserListService;
import vo.ActionForward;
import vo.PageInfoVO;
import vo.JoinVO;

public class UserListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		HttpSession session = request.getSession();
		ActionForward forward = null;
		forward = new ActionForward();
		
		int page=1;
		int limit=20;
		
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		UserListService userListService = new UserListService();
		int userCount = userListService.getUserCount();
		ArrayList<JoinVO> userList = userListService.getUserList(page, limit);
		int maxPage = (int)((double)userCount/limit+0.95);
		int startPage = (((int) ((double)page / 10 + 0.9)) - 1) * 10 + 1;
		int endPage = startPage + 10 - 1;
		
		if(endPage > maxPage) endPage = maxPage;
		
		PageInfoVO userpage = new PageInfoVO();
		userpage.setEndPage(endPage);
		userpage.setUserCount(userCount);
		userpage.setMaxPage(maxPage);
		userpage.setPage(page);
		userpage.setStartPage(startPage);
		
		request.setAttribute("userpage", userpage);
		request.setAttribute("userList", userList);
		forward.setPath("./user_list.jsp");
		response.setContentType("text/html;charset=UTF-8");

		return forward;
	}
}