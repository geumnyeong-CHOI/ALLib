package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.MyInfoService;
import svc.UpdateUserService;
import vo.ActionForward;
import vo.JoinVO;

public class UpdateUserAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		
		HttpSession session = request.getSession();
		String uid = (String) session.getAttribute("USER_ID");

		ActionForward forward = null;

		if (uid == null) {
			forward = new ActionForward();
			forward.setRedirect(true); //redirect 방식으로 페이지 이동처리 forward
			forward.setPath("./userLogin.us");
		} else if (uid.equals("admin")) {
			response.setContentType("text/html;charset=UTF-8");
			
			forward = new ActionForward();
			String viewId = request.getParameter("USER_ID");
			UpdateUserService updateUserService = new UpdateUserService();
			JoinVO users = updateUserService.getUsers(viewId);

			request.setAttribute("users", users);
			forward.setPath("./user_modify_info.jsp");
		} else {
			response.setContentType("text/html;charset=UTF-8");
			forward = new ActionForward();

			MyInfoService myInfoService = new MyInfoService();
			JoinVO users = myInfoService.getUsers(uid);

			request.setAttribute("users", users);
			forward.setPath("./myInfo.jsp");
		}
		return forward;
	}

}
