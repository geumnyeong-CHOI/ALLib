package action;

import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.AdminService;
import svc.UserListService;
import vo.*;

public class UserTypeCheckAction implements Action {

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

			forward = new ActionForward();
//			forward.setRedirect(true);
			
			AdminService adminService = new AdminService();
			int adminCount = adminService.getAdminCount();
			ArrayList<BookRentalYNVO> adminBookList = adminService.getAdminBlist();
			adminBookList = adminService.getAdminBlist();
			System.out.println("ABL 체크 ");
			ArrayList<SeatselcYNVO> adminSeatList = adminService.getAdminSlist();
			adminSeatList = adminService.getAdminSlist();
			System.out.println("ASL 체크 ");
			ArrayList<JoinVO> adminUserList = adminService.getAdminUlist();
			adminUserList = adminService.getAdminUlist();
			System.out.println("AUL 체크 ");
			ArrayList<QnaVO> adminQnaList = adminService.getAdminQlist();
			adminQnaList = adminService.getAdminQlist();
			System.out.println("AQL 체크 ");
			
			PageInfoVO adminPage = new PageInfoVO();
			adminPage.setAdminCount(adminCount);

			request.setAttribute("adminPage", adminPage);
			request.setAttribute("adminBookList", adminBookList);
			request.setAttribute("adminSeatList", adminSeatList);
			request.setAttribute("adminUserList", adminUserList);
			request.setAttribute("adminQnaList", adminQnaList);
			forward.setPath("./MainAdmin.jsp");
			response.setContentType("text/html;charset=UTF-8");
			
			forward.setPath("/MainAdmin.us");
		} else {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();

			forward = null;
			out.println("<script>");
			out.println("location.href='./main.jsp';");
			out.println("</script>");

		}

		return forward;
	}

}
