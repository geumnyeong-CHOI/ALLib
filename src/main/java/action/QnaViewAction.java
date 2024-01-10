package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.QnaViewService;
import vo.ActionForward;
import vo.QnaVO;

public class QnaViewAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		HttpSession session = request.getSession();
		String uid = (String) session.getAttribute("USER_ID");
		ActionForward forward = new ActionForward();
		
		if( uid == null || !uid.equals("admin")) {
			System.out.println(uid + "짱구@@@@@@");
			System.out.println(request.getParameter("QNA_NO") + "짱구@@@@@@");
			String qnaNo = request.getParameter("QNA_NO");
			QnaViewService qnaViewService = new QnaViewService();
			QnaVO qvo = qnaViewService.getQna(qnaNo);

			request.setAttribute("qvo", qvo);
			forward.setPath("./qna.jsp");
		}else if (uid.equals("admin")) {
			String qnaNo = request.getParameter("QNA_NO");
			QnaViewService qnaViewService = new QnaViewService();
			QnaVO qvo = qnaViewService.getQna(qnaNo);

			request.setAttribute("qvo", qvo);
			forward.setPath("./qnaAdmin.jsp");
		} 

		return forward;
	}

}
