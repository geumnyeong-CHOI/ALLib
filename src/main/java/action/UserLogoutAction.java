package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import vo.ActionForward;

public class UserLogoutAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("짱구 @@@@ Action execute() 실행됨");

		HttpSession session = request.getSession();
		session.invalidate();

		System.out.println("짱구 @@@@ 로그아웃 성공");

		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.print("<script>");
		out.print("alert('정상적으로 로그아웃 되었습니다');");
		out.print("location.href='./main.jsp';");
		out.print("</script>");

		out.close();

		return null;
	}
}
