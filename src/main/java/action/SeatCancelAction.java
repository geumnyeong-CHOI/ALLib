package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.SeatCancelService;
import vo.ActionForward;
import vo.SeatVO;


public class SeatCancelAction implements Action {
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("USER_ID");
		
		SeatVO seatVo = new SeatVO();
		boolean cancelResult = false;
		seatVo.setSEAT_NUM(request.getParameter("seatNum"));
		System.out.println("좌석 취소 svc 작동중");
		
		SeatCancelService seatxxService = new SeatCancelService();
		cancelResult = seatxxService.xxSeat(seatVo);
		ActionForward forward = null;
		
		if(cancelResult) {
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("./SeatMyChkAction.me");
		} else {
			System.out.println("좌석 취소 svc 실패 ");
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			
			out.println("<script>");
			out.println("alert('좌석 취소 실패');");
			out.println("location.href='./SeatMyChkAction.me';");
			out.println("</script>");
		}
		return forward;
}
}
