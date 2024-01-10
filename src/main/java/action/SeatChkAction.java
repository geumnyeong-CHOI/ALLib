package action;

import java.util.ArrayList;
import java.io.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.SeatChkService;
import vo.ActionForward;
import vo.SeatVO;

public class SeatChkAction implements Action{
	
public ActionForward execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
			
		HttpSession session = req.getSession();
		String id = (String) session.getAttribute("USER_ID");
		ActionForward forward = new ActionForward();
		ArrayList<SeatVO> seatChk = new ArrayList<SeatVO>();
		System.out.println("좌석확인 ac 1 ");
		System.out.println("id : "+id);
		
		if(id == null) {
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("./loginForm.jsp");
		} else {			
		SeatChkService seatChkservice = new SeatChkService();
		SeatVO seatVo = new SeatVO();
		seatVo.setUSER_ID(id);
		String USER_ID = seatVo.getUSER_ID();
		seatChk = seatChkservice.getSeatSelcChk(USER_ID);
//		
		req.setAttribute("seatChk", seatChk);
		System.out.println("seatChk action:2 " + seatChk);
		forward.setPath("./SeatSelcChk.jsp");
		}
		return forward;
		}
}
