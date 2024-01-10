package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.UpdateUserProService;
import vo.ActionForward;
import vo.JoinVO;

public class UpdateUserProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		// session값 제어 : 로그인 유무
		HttpSession session = request.getSession();
		String uid = (String) session.getAttribute("USER_ID");

		ActionForward forward = new ActionForward();

		// 전달되는 정보 JoinVO에 저장
		JoinVO users = new JoinVO();
		users.setUSER_ID(request.getParameter("USER_ID"));
		users.setUSER_PASSWD(request.getParameter("USER_PASSWD"));
		users.setUSER_NAME(request.getParameter("USER_NAME"));
		users.setUSER_PHONE(request.getParameter("USER_PHONE"));
		users.setUSER_BIRTH(request.getParameter("USER_BIRTH"));
		users.setUSER_EMAIL(request.getParameter("USER_EMAIL"));
		System.out.println("짱구@@@ 전달받은 정보 users객체 확인" + users);

		UpdateUserProService updateUserProService = new UpdateUserProService();
		
		// service 객체 생성 후 메소드 호출
		int updateCount = updateUserProService.modifyUsers(users);

		// 받아온 값이 1이면 실행
		if (updateCount == 1) {
			if (uid.equals("admin")) {
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();

				// alert창 띄우고 MainAdmin으로 이동하는 컨트롤러 실행
				out.println("<script>");
				out.println("alert('회원정보 수정이 정상 처리되었습니다');");
				out.println("location.href='./userTypeCheckAction.us'");
				out.println("</script>");
				out.close();
			} else {
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				
				out.println("<script>");
				out.println("alert('회원정보 수정이 정상 처리되었습니다');");
				out.println("location.href='./MyPage.jsp'");
				out.println("</script>");
				out.close();
			}
		}

		return null;
	}

}
