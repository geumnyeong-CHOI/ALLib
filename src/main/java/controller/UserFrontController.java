package controller;

import static db.JdbcUtil.getConnection;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.*;
import dao.JoinDAO;
import db.JdbcUtil;
import vo.ActionForward;
import vo.JoinVO;

@WebServlet("*.us")
public class UserFrontController extends HttpServlet {
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
		System.out.println("회원정보 command 제대로 짤라오는지?" + command);

		// ActionForward 객체 사용, 여러번 쓸수있게 처리
		ActionForward forward = null;
		Action action = null;

		// loginForm 창으로 돌아가는 컨트롤러
		if (command.equals("/userLogin.us")) {
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("./loginForm.jsp");

			// joinForm으로 들어가는 컨트롤러
		} else if (command.equals("/userJoin.us")) {
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./joinForm.jsp");

			// 아이디 중복체크
		} else if (command.equals("/idCheck.us")) {

			String uid = request.getParameter("USER_ID");
			System.out.println("짱구@@ 아약스id : " + uid);
			PrintWriter out = response.getWriter();

			JoinVO vo = new JoinVO();
			vo.setUSER_ID(uid);

			JoinDAO dao = JoinDAO.getInstance();
			Connection con = getConnection();
			dao.setConnection(con);

			boolean result = dao.idCheck(vo);

			if (uid == "" || result) {
				System.out.println("이미 존재하는 아이디");
				result = true;
			} else if (result){
				System.out.println("사용 가능한 아이디");
			}

			out.write(result + "");

			// 관리자용 main페이지로 돌아가는 컨트롤러
		} else if (command.equals("/MainAdmin.us")) {
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./MainAdmin.jsp");

		} else if (command.equals("/userLoginAction.us")) {
			action = new UserLoginAction();

			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		// 회원 로그아웃 기능 (완료시 Main.jsp이동)
		else if (command.equals("/userLogout.us")) {
			action = new UserLogoutAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		else if (command.equals("/userSearchAction.us")) {
			action = new UserSearchAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();

			}
		}
		// 회원가입 컨트롤러
		else if (command.equals("/userJoinAction.us")) {
			action = new UserJoinAction();

			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		// admin계정인지 회원계정인지 check하는 컨트롤러
		else if (command.equals("/userTypeCheckAction.us")) {
			action = new UserTypeCheckAction();

			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		// 회원전체목록 불러오기
		else if (command.equals("/userListAction.us")) {
			action = new UserListAction();

			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		// 수정가능한 회원상세정보 불러오기 admin계정이면 관리자수정페이지, 다른 계정이면 회원수정페이지
		else if (command.equals("/updateUserAction.us")) {
			action = new UpdateUserAction();

			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		// 관리자가 회원정보수정하는 컨트롤러
		else if (command.equals("/updateUserProAction.us")) {
			action = new UpdateUserProAction();

			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		// 회원탈퇴컨트롤러
		else if (command.equals("/userDeleteAction.us")) {
			action = new UserDeleteAction();

			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		// 이메일로 아이디찾기
		else if (command.equals("/findID.us")) {

			try {
				response.setContentType("text/html; charset=utf-8");
				PrintWriter out = response.getWriter();

				String name = request.getParameter("USER_NAME");
				String email = request.getParameter("USER_EMAIL");
				Connection con = JdbcUtil.getConnection();
				JoinDAO joinDAO = JoinDAO.getInstance();
				joinDAO.setConnection(con);
				JoinVO mv = null;
				mv = joinDAO.findID(name, email);

				if (mv != null) {
					String uid = mv.getUSER_ID().replaceAll("(?<=.{4}).", "*");
					out.println("<script>");
					out.println("alert('" + name + " 님의 아이디는 " + uid + "입니다')");
					out.println("history.back()");
					out.println("</script>");
				} else {
					out.println("<script>");
					out.println("alert('아이디가 존재하지 않습니다.')");
					out.println("history.back()");
					out.println("</script>");

				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		// 핸드폰번호로 아이디찾기
		else if (command.equals("/findIDPhone.us")) {

			try {
				response.setContentType("text/html; charset=utf-8");
				PrintWriter out = response.getWriter();

				String name = request.getParameter("USER_NAME");
				String phone = request.getParameter("USER_PHONE");
				Connection con = JdbcUtil.getConnection();
				JoinDAO joinDAO = JoinDAO.getInstance();
				joinDAO.setConnection(con);
				JoinVO mv = null;
				mv = joinDAO.findIDPhone(name, phone);
				if (mv != null) {
					String uid = mv.getUSER_ID().replaceAll("(?<=.{4}).", "*");
					out.println("<script>");
					out.println("alert('" + name + " 님의 아이디는 " + uid + "입니다')");
					out.println("history.back()");
					out.println("</script>");
				} else {
					out.println("<script>");
					out.println("alert('아이디가 존재하지 않습니다.')");
					out.println("history.back()");
					out.println("</script>");

				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		// 이메일로 비밀번호찾기
		else if (command.equals("/findPwd.us")) {

			try {
				response.setContentType("text/html; charset=utf-8");
				PrintWriter out = response.getWriter();

				String id = request.getParameter("USER_ID");
				String name = request.getParameter("USER_NAME");
				String email = request.getParameter("USER_EMAIL");
				Connection con = JdbcUtil.getConnection();
				JoinDAO joinDAO = JoinDAO.getInstance();
				joinDAO.setConnection(con);
				JoinVO mv = null;
				mv = joinDAO.findPwd(id, name, email);
				if (mv != null) {
					String upw = mv.getUSER_PASSWD().replaceAll("(?<=.{4}).", "*");
					out.println("<script>");
					out.println("alert('" + name + " 님의 비밀번호는 " + upw + "입니다')");
					out.println("history.back()");
					out.println("</script>");
				} else {
					out.println("<script>");
					out.println("alert('입력하신 정보가 일치하지 않습니다.')");
					out.println("history.back()");
					out.println("</script>");

				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		// 핸드폰번호로 비밀번호찾기
		else if (command.equals("/findPwdPhone.us")) {

			try {
				response.setContentType("text/html; charset=utf-8");
				PrintWriter out = response.getWriter();

				String id = request.getParameter("USER_ID");
				String name = request.getParameter("USER_NAME");
				String phone = request.getParameter("USER_PHONE");
				Connection con = JdbcUtil.getConnection();
				JoinDAO joinDAO = JoinDAO.getInstance();
				joinDAO.setConnection(con);
				JoinVO mv = null;
				mv = joinDAO.findPwdPhone(id, name, phone);
				if (mv != null) {
					String upw = mv.getUSER_PASSWD().replaceAll("(?<=.{4}).", "*");
					out.println("<script>");
					out.println("alert('" + name + " 님의 비밀번호는 " + upw + "입니다')");
					out.println("history.back()");
					out.println("</script>");
				} else {
					out.println("<script>");
					out.println("alert('입력하신 정보가 일치하지 않습니다.')");
					out.println("history.back()");
					out.println("</script>");

				}
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