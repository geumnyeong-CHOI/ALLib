package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.CommentInsertAction;
import action.MyQnaDelAction;
import action.MyQnaListAction;
import action.QnaInsertAction;
import action.QnaListAction;
import action.QnaViewAction;
import vo.ActionForward;

@WebServlet("*.qna")
public class QnaController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// 가상주소 가져오기
		String RequestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = RequestURI.substring(contextPath.length());
		System.out.println("짱구@@@ command 제대로 짤라오는지?" + command);

		// ActionForward 객체 사용, 여러번 쓸수있게 처리
		ActionForward forward = null;
		Action action = null;

		// qna등록
		if (command.equals("/QnaInsertAction.qna")) {
			action = new QnaInsertAction();

			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}

			// qna리스트
		} else if (command.equals("/qnaList.qna")) {
			action = new QnaListAction();

			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}

			// qna 글 보기
		} else if (command.equals("/QnaView.qna")) {
			action = new QnaViewAction();

			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}

			// qna 댓글등록
		} else if (command.equals("/qnaComment.qna")) {
			action = new CommentInsertAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}

			// 내 qna 리스트 가져오기
		} else if (command.equals("/myQnaList.qna")) {
			action = new MyQnaListAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}

			// 내 qna 수정하기
		} else if (command.equals("/QnaDel.qna")) {
			action = new MyQnaDelAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		if (forward != null) {
			if (forward.isRedirect()) {
				response.sendRedirect(forward.getPath());
			} else {
				RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());
				dispatcher.forward(request, response);
			}
		}
	}
}