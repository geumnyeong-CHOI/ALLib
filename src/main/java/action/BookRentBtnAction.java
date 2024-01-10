package action;

import static db.JdbcUtil.close;
import static db.JdbcUtil.commit;
import static db.JdbcUtil.rollback;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.BookInsertService;
import svc.BookRentBtnService;
import vo.ActionForward;
import vo.BookInfoVO;
import vo.BookRentBtnVO;

public class BookRentBtnAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		// session값 제어 : 로그인 유무
		HttpSession session = request.getSession();
		String uid = (String) session.getAttribute("USER_ID");
//		ActionForward forward = new ActionForward();
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		ActionForward forward = null;
		
		if(uid == null) {
			out.println("<script>");
			out.println("alert('로그인이 필요합니다.');");
			out.println("location.href='./userLogin.us';");
			out.println("</script>");
			out.close();
		}else {
			BookRentBtnVO bookrentbtn = new BookRentBtnVO();
			boolean insertResult = false;
			bookrentbtn.setBOOK_CODE(request.getParameter("book_code"));
			bookrentbtn.setUSER_ID(uid);
//		bookrentbtn.setBOOK_YN(request.getParameter("book_yn"));
			System.out.println(bookrentbtn.getBOOK_CODE()+":"+bookrentbtn.getUSER_ID());
			BookRentBtnService bookRentBtnService = new BookRentBtnService();
			insertResult = bookRentBtnService.rentalbtn(bookrentbtn);
			
			System.out.println("ac 3" + insertResult);
			
			if(insertResult == false) {
				out.println("<script>");
				out.println("alert('도서대여실패');");
				out.println("history.back();");//이전페이지로 돌아가기
				out.println("</script>");
				out.close();
			}else {
				
				boolean updateResult = false;
				
				BookRentBtnService bookRentBtnUpdateService = new BookRentBtnService();
				updateResult = bookRentBtnUpdateService.rentalbtnupdate(bookrentbtn);
				
				if(updateResult == true) {
					out.println("<script>");
					out.println("alert('도서대여성공');");
					out.println("location.href='./bookUListAction.book';");
					out.println("</script>");
					out.close();
				}
			}
		}
		
		return forward;
	}
	
}
