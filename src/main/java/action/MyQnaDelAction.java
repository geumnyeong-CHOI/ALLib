package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.MyQnaDeleteService;
import svc.UserDeleteService;
import vo.ActionForward;

public class MyQnaDelAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		String uid = (String) session.getAttribute("USER_ID");

		ActionForward forward = null;
		if (uid == null) {
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("./userLogin.us");
		} else {
			int deleteQna = Integer.parseInt(request.getParameter("QNA_NO"));
			MyQnaDeleteService myQnaDeleteService = new MyQnaDeleteService();
			boolean deleteResult = myQnaDeleteService.deleteQna(deleteQna);

			if(deleteResult) {
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("./myQnaList.qna");
			}
		}
		return forward;
		
	}

}
