package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.QnaListService;
import vo.ActionForward;
import vo.PageInfoVO;
import vo.QnaVO;

public class QnaListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		HttpSession session = request.getSession();
		String uid = (String) session.getAttribute("USER_ID");
		ActionForward forward = null;

		if (uid == null || !uid.equals("admin")) {
			ArrayList<QnaVO> qnaList = new ArrayList<QnaVO>();
			int page = 1;
			int limit = 10;

			System.out.println("@@@@@@@@@오류확인용");
			
			if (request.getParameter("page") != null) {
				page = Integer.parseInt(request.getParameter("page"));
			}

			QnaListService qnaListService = new QnaListService();
			int listCount = qnaListService.getListCount();
			qnaList = qnaListService.getQnaList(page, limit);

			int maxPage = (int) ((double) listCount / limit + 0.95);
			int startPage = (((int) ((double) page / 10 + 0.9)) - 1) * 10 + 1;
			int endPage = startPage + 10 - 1;

			if (endPage > maxPage)
				endPage = maxPage;

			PageInfoVO pageInfo = new PageInfoVO();
			pageInfo.setEndPage(endPage);
			pageInfo.setListCount(listCount);
			pageInfo.setMaxPage(maxPage);
			pageInfo.setPage(page);
			pageInfo.setStartPage(startPage);

			request.setAttribute("pageInfo", pageInfo);
			request.setAttribute("qnaList", qnaList);

			forward = new ActionForward();
			forward.setPath("./qnaList.jsp");
		} else if (uid.equals("admin")) {
			ArrayList<QnaVO> qnaList = new ArrayList<QnaVO>();
			int page = 1;
			int limit = 10;

			if (request.getParameter("page") != null) {
				page = Integer.parseInt(request.getParameter("page"));
			}

			QnaListService qnaListService = new QnaListService();
			int listCount = qnaListService.getListCount();
			qnaList = qnaListService.getQnaList(page, limit);

			int maxPage = (int) ((double) listCount / limit + 0.95);
			int startPage = (((int) ((double) page / 10 + 0.9)) - 1) * 10 + 1;
			int endPage = startPage + 10 - 1;

			if (endPage > maxPage)
				endPage = maxPage;

			PageInfoVO pageInfo = new PageInfoVO();
			pageInfo.setEndPage(endPage);
			pageInfo.setListCount(listCount);
			pageInfo.setMaxPage(maxPage);
			pageInfo.setPage(page);
			pageInfo.setStartPage(startPage);

			request.setAttribute("pageInfo", pageInfo);
			request.setAttribute("qnaList", qnaList);

			forward = new ActionForward();
			forward.setPath("./qnaAdminList.jsp");

		}
		return forward;

	}

}
