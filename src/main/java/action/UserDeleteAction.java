package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.UserDeleteService;
import vo.ActionForward;

public class UserDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		HttpSession session = request.getSession();
		String uid = (String) session.getAttribute("USER_ID");

		ActionForward forward = null;
		if (uid == null) {
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("./userLogin.us");
		} else if (uid.equals("admin")) {
			String deleteId = request.getParameter("USER_ID");
			UserDeleteService userDeleteService = new UserDeleteService();
			boolean deleteResult = userDeleteService.deleteUser(deleteId);

			if (deleteResult) {
				forward = new ActionForward();
				forward.setRedirect(true);
				forward.setPath("./userListAction.us");
			} else {
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out = response.getWriter();

				out.println("<script>");
				out.println("alert('회원정보삭제 실패.');");
				out.println("location.href='./userLogin.us';");
				out.println("</script>");
				} 
		} else {
			UserDeleteService userDeleteService = new UserDeleteService();
			boolean deleteResult = userDeleteService.deleteUser(uid);
			
			if(deleteResult) {
			session.invalidate();
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();

			out.println("<script>");
			out.println("alert('탈퇴 되었습니다.');");
			out.println("location.href='./main.jsp';");
			out.println("</script>");
			
			}
		}
		return forward;
		}
	}
