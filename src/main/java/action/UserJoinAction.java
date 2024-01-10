package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.UserJoinService;
import vo.ActionForward;
import vo.JoinVO;

public class UserJoinAction implements Action{

	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		JoinVO users = new JoinVO();
		boolean joinResult = false;
		
		users.setUSER_ID(request.getParameter("USER_ID"));
		users.setUSER_PASSWD(request.getParameter("USER_PASSWD"));
		users.setUSER_NAME(request.getParameter("USER_NAME"));
		users.setUSER_BIRTH(request.getParameter("USER_BIRTH"));
		users.setUSER_PHONE(request.getParameter("USER_PHONE"));
		users.setUSER_EMAIL(request.getParameter("USER_EMAIL"));
		
		UserJoinService UserJoinService = new UserJoinService();
		joinResult = UserJoinService.joinUser(users);
		
		ActionForward forward = null;
		if(joinResult == false) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			
			out.println("<script>");
			out.println("alert('회원등록실패')");
			out.println("history.back()");
			out.println("</script>");
		}else {
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("./userLogin.us");
		}
		
		return forward;
	}

}
