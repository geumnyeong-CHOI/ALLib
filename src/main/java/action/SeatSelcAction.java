package action;

import java.io.PrintWriter;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Seat_DAO;
import svc.SeatSVC;
import vo.*;

public class SeatSelcAction implements Action{
	
	public ActionForward execute (HttpServletRequest req, HttpServletResponse res) throws Exception {
		
		HttpSession session = req.getSession();
		String id = (String) session.getAttribute("USER_ID");			
		System.out.println("ss action 시작 ");
		
		SeatVO seatVo = new SeatVO();
		boolean seatInsertResult = false;
		seatVo.setUSER_ID(id);
		seatVo.setSEAT_DAY(req.getParameter("SEAT_DAY"));
		seatVo.setSEAT_NO(req.getParameter("SEAT_NO"));
		System.out.println("좌석선택 action 1 ");			
		SeatSVC seatSvc = new SeatSVC();
		seatInsertResult = seatSvc.selectSeat(seatVo);
		
		ActionForward forward = null;
		res.setContentType("text/html; charset=utf-8");
		PrintWriter out = res.getWriter();
		
		if(id == null) {
			out.println("<script>");
			out.println("alert('로그인이 필요합니다.');");
			out.println("location.href='./userLogin.us';");
			out.println("</script>");
			out.close();			
		}else if(seatVo.getSEAT_NO() == null) {
	         out.println("<script>");
	         out.println("alert('좌석을 선택해 주세요.');");
	         out.println("location.href='./SeatSelc.jsp';");
	         out.println("</script>");
	         out.close();
	    }else {			
				out.println("<script>");
				out.println("alert('좌석 예약 성공');");
				out.println("location.href='./SeatMyChkAction.me';");
				out.println("</script>");
				out.close();
//				
//				forward = new ActionForward();
//				forward.setRedirect(true);
//				forward.setPath("./SeatSelcChk.jsp");
//				
				System.out.println("좌석선택 action 3 입력");
		}		
	    return forward;
	}
}