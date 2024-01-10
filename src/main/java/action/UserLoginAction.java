package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import svc.UserLoginService;
import vo.ActionForward;
import vo.JoinVO;

public class UserLoginAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		HttpSession session = request.getSession();
		JoinVO users = new JoinVO();

		users.setUSER_ID(request.getParameter("USER_ID"));
		users.setUSER_PASSWD(request.getParameter("USER_PASSWD"));

		UserLoginService userLoginService = new UserLoginService();
		boolean loginResult = userLoginService.login(users);
		ActionForward forward = null;

		if (loginResult) {
			forward = new ActionForward();
			session.setAttribute("USER_ID", users.getUSER_ID());
			forward.setRedirect(true);
			forward.setPath("./userTypeCheckAction.us");
		} else {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();

			out.println("<script>");
			out.println("alert('로그인 실패')");
			out.println("location.href='./userLogin.us';");
			out.println("</script>");
		}
		return forward;
	}

}
