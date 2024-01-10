package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.AdminService;
import vo.*;

public class AdminBookAction implements Action{
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("USER_ID");
		ActionForward forward= new ActionForward();
		
		AdminService adminService = new AdminService();
		int adminCount = adminService.getAdminCount();
		ArrayList<BookRentalYNVO> adminBookList = adminService.getAdminBlist();
		adminBookList = adminService.getAdminBlist();
		
		ArrayList<SeatselcYNVO> adminSeatList = adminService.getAdminSlist();
		adminSeatList = adminService.getAdminSlist();
		
		ArrayList<JoinVO> adminUserList = adminService.getAdminUlist();
		adminUserList = adminService.getAdminUlist();
		
		ArrayList<QnaVO> adminQnaList = adminService.getAdminQlist();
		adminQnaList = adminService.getAdminQlist();
		
		PageInfoVO adminPage = new PageInfoVO();
		adminPage.setAdminCount(adminCount);

		request.setAttribute("adminPage", adminPage);
		request.setAttribute("adminBookList", adminBookList);
		request.setAttribute("adminSeatList", adminSeatList);
		request.setAttribute("adminUserList", adminUserList);
		request.setAttribute("adminQnaList", adminQnaList);
		
		forward.setPath("./MainAdmin.jsp");
		response.setContentType("text/html;charset=UTF-8");

		return forward;
	}
}
