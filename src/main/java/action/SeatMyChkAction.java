package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.SeatMyChkService;
import vo.ActionForward;
import vo.SeatVO;

public class SeatMyChkAction {
	
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		HttpSession session = request.getSession();
		String uid = (String) session.getAttribute("USER_ID");
		ActionForward forward = null;
		
		if (uid == null) {
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("./userLogin.us");
		} else {
			forward = new ActionForward();
			SeatMyChkService seatMyChkSvc = new SeatMyChkService();

			ArrayList<SeatVO> seatMyChk = new ArrayList<SeatVO>();
			seatMyChk = seatMyChkSvc.getSeatMyList(uid);
			System.out.println("마이페이지 좌석확인 action 체크 ");
			
			request.setAttribute("seatMyChk", seatMyChk);
			forward.setPath("./SeatChkAction.me");
			response.setContentType("text/html;charset=UTF-8");
					
			} 
			return forward;
	}

}
