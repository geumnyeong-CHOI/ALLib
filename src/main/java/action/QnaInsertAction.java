package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.QnaBoardService;
import vo.ActionForward;
import vo.QnaVO;

public class QnaInsertAction implements Action{

	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		HttpSession session = request.getSession();
		String uid = (String) session.getAttribute("USER_ID");
		ActionForward forward = null;
		
		QnaVO users = new QnaVO();
		boolean qnaInsertResult = false;
		
		users.setUSER_ID(request.getParameter("USER_ID"));
		users.setQNA_PASSWD(request.getParameter("QNA_PASSWD"));
		users.setQNA_TITLE(request.getParameter("QNA_TITLE"));
		users.setQNA_CONTENT(request.getParameter("QNA_CONTENT"));
		
		QnaBoardService QnaBoardService = new QnaBoardService();
		qnaInsertResult = QnaBoardService.qnaInsertSV(users);
		
		if(qnaInsertResult == false) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			
			out.println("<script>");
			out.println("alert('작성 실패했습니다.')");
			out.println("history.back()");
			out.println("</script>");
		}else {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			
			out.println("<script>");
			out.println("alert('질문이 정상 등록되었습니다.')");
			out.println("location.href='./qnaMain.jsp'");
			out.println("</script>");
		}
		
		return forward;
	}

}