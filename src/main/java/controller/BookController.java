package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.BookInfoDeleteAction;
import action.BookInfoUpdateAction;
import action.BookInfoViewAction;
import action.BookInsertAction;
import action.BookMListAction;
import action.BookRentBtnAction;
import action.BookRentalAction;
import action.BookUListAction;
import action.BookUSearchAction;
import vo.ActionForward;


@WebServlet("*.book")
public class BookController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}
	
	public void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		String RequestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = RequestURI.substring(contextPath.length());
		
		ActionForward forward = null;
		Action action = null;
		
		// 관리자 / 도서 등록
		if(command.equals("/BookInsertAction.book")) {
			System.out.println("controller");
			action = new BookInsertAction();
			try {
				forward = action.execute(request, response);
			}catch(Exception e) {
				e.printStackTrace();
			}
		// 관리자 / 전체 목록
		}else if(command.equals("/BookMListAction.book")) {
			System.out.println("controller");
			action = new BookMListAction();
			try {
				forward = action.execute(request, response);
			}catch(Exception e) {
				e.printStackTrace();
			}
		// 관리자 / 도서 상세 정보(수정, 삭제)
		}else if(command.equals("/BookInfoViewAction.book")) {
			System.out.println("controller view");
			action = new BookInfoViewAction();
			try {
				forward = action.execute(request, response);
			}catch(Exception e) {
				e.printStackTrace();
			}
		// 관리자 / 도서정보 수정
		}else if(command.equals("/BookInfoUpdateAction.book")) {
			System.out.println("controller update");
			action = new BookInfoUpdateAction();
			try {
				forward = action.execute(request, response);
			}catch(Exception e) {
				e.printStackTrace();
			}
		// 관리자 / 도서정보 삭제
		}else if(command.equals("/BookInfoDeleteAction.book")) {
			System.out.println("controller deletes");
			action = new BookInfoDeleteAction();
			try {
				forward = action.execute(request, response);
			}catch(Exception e) {
				e.printStackTrace();
			}
		// 사용자 / 대여하기(대여정보 insert/update)
		}else if(command.equals("/BookRentBtnAction.book")) {
	         System.out.println("controller rent");
	         action = new BookRentBtnAction();
	         try {
	            forward = action.execute(request, response);
	         }catch(Exception e) {
	            e.printStackTrace();
	         }
		// 사용자 / 대여목록 확인/마이페이지에서 (select)
		// 마이페이지 대여목록 확인 클릭 시 발동
		}else if(command.equals("/BookRentalAction.book")) {
			action = new BookRentalAction();
			try {
				forward = action.execute(request, response);
			}catch(Exception e) {
				e.printStackTrace();
			}
		// 사용자 / 도서 전체목록
		}else if(command.equals("/bookUListAction.book")) {
			System.out.println("controller bookListUser");
			action = new BookUListAction();
			try {
				forward = action.execute(request, response);
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
		// 사용자 / 도서 검색(제목, 작가로 검색 가능)
		else if(command.equals("/bookUSearchAction.book")) {
			action = new BookUSearchAction();
			
			try {
				forward = action.execute(request, response);
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
		
		if(forward != null) {
			if(forward.isRedirect()) {
				response.sendRedirect(forward.getPath());
			}else {
				RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());
				dispatcher.forward(request, response);
			}
		}
	}
}
