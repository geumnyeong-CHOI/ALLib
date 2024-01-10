package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.CommentService;
import svc.UpdateUserProService;
import vo.ActionForward;
import vo.QnaVO;

public class CommentInsertAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		String uid = (String) session.getAttribute("USER_ID");

		ActionForward forward = new ActionForward();

		QnaVO vo = new QnaVO();
		vo.setQNA_TITLE(request.getParameter("QNA_TITLE"));
		vo.setUSER_ID(request.getParameter("USER_ID"));
		vo.setQNA_CONTENT(request.getParameter("QNA_CONTENT"));
		vo.setQNA_TITLE(request.getParameter("QNA_TITLE"));
		vo.setQNA_COMMENT(request.getParameter("QNA_COMMENT"));
		vo.setQNA_NO(Integer.parseInt(request.getParameter("QNA_NO")));
		
		System.out.println("잘되나?" +request.getParameter("QNA_NO") );

		CommentService commentService = new CommentService();
		
		int updateCount = commentService.insertComment(vo);

		if (updateCount == 1) {
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();

				out.println("<script>");
				out.println("alert('댓글이 등록되었습니다');");
				out.println("location.href='./qnaList.qna'");
				out.println("</script>");
				out.close();
		}

		return null;
	}

}
