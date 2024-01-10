package controller;

import java.io.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.*;
import vo.*;

@WebServlet("*.me")
public class SeatController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);	
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doProcess(req, res);
	}
	protected void doProcess(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		// 가상주소 가져오기
		String RequestURI=req.getRequestURI();
		String contextPath=req.getContextPath();
		String command=RequestURI.substring(contextPath.length());
		
		ActionForward forward=null;
		Action action = null;
		
		// 로그인체크해서 로그인된 ID받아오기
		if (command.equals("/userLoginAction.us")) {
			action = new UserLoginAction();
			try { forward = action.execute(req, res);
			} catch (Exception e) {	e.printStackTrace(); }
		}
		
		// admin계정인지 회원계정인지 check하는 컨트롤러
		else if (command.equals("/userTypeCheckAction.us")) {
			action = new UserTypeCheckAction();
			
			try {
				forward = action.execute(req, res);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		// 좌석 선택 
		else if(command.equals("/SeatSelcAction.me")) {
			action = new SeatSelcAction();
			
			System.out.println("좌석선택 controller");
			try { forward = action.execute(req, res);			
			}catch(Exception e) { e.printStackTrace();}
		}		
		
		// 좌석 확인 
		else if(command.equals("/SeatMyChkAction.me")) {
			action = new SeatChkAction();
			
			System.out.println("좌석 확인 controller");
			try { forward = action.execute(req, res);			
			}catch(Exception e) { e.printStackTrace();}
		}
		
		// 좌석 취소
		else if (command.equals("/SeatCancelAction.me")) {
			action = new SeatCancelAction();

			try {
				forward = action.execute(req, res);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		// 관리자 좌석 확인 
		else if(command.equals("/SeatAdminChkAction.me")) {
			action = new SeatAdminChkAction();
					
			System.out.println("관리자 좌석 전체 확인 controller");
			try { forward = action.execute(req, res);			
			}catch(Exception e) { e.printStackTrace();}
		}
		
		if(forward != null){
			if(forward.isRedirect()){
			res.sendRedirect(forward.getPath());
			}else{
				RequestDispatcher dispatcher = req.getRequestDispatcher(forward.getPath());
				dispatcher.forward(req, res);
			}			
		}		
	}
}
