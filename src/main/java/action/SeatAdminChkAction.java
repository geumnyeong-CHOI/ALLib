package action;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.*;
import vo.*;

public class SeatAdminChkAction implements Action {

	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		HttpSession session = request.getSession();
		String uid = (String) session.getAttribute("USER_ID");
		ActionForward forward = null;

		if (uid == null) {
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("./userLogin.us");
		} else if (uid.equals("admin")) {

			forward = new ActionForward();
			
			SeatAdminChkService seatACsvc = new SeatAdminChkService();
			int adminCount = seatACsvc.getAdminCount();
			
			ArrayList<SeatselcYNVO> adminAllSchkList = seatACsvc.getAdminSchklist();
			adminAllSchkList = seatACsvc.getAdminSchklist();
			System.out.println("관리자 좌석확인 전체 체크 ");
			
			PageInfoVO adminPage = new PageInfoVO();
			adminPage.setAdminCount(adminCount);

			request.setAttribute("adminPage", adminPage);
			request.setAttribute("adminAllSchkList", adminAllSchkList);

			forward.setPath("./seatAdmin.jsp");
			response.setContentType("text/html;charset=UTF-8");
			
		} else {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();

			forward = null;
			out.println("<script>");
			out.println("location.href='./mainLog.jsp';");
			out.println("</script>");

		}

		return forward;
	}

	
	
	
	
}
