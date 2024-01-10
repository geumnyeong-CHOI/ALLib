package action;

import static db.JdbcUtil.getConnection;

import java.io.PrintWriter;
import java.sql.Connection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.JoinDAO;
import vo.ActionForward;
import vo.JoinVO;

public class IdCheckAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String uid = request.getParameter("USER_ID");
		System.out.println("짱구@@ 아약스id : " + uid);
		PrintWriter out = response.getWriter();
		
		JoinVO vo = new JoinVO();
		vo.setUSER_ID(uid);
		
		JoinDAO dao = JoinDAO.getInstance();
		Connection con = getConnection();
		dao.setConnection(con);
		
		boolean result = dao.idCheck(vo);
		
		if(result) {
			System.out.println("이미 존재하는 아이디");
		} else {
			System.out.println("사용 가능한 아이디");
		}
		
		out.write(result+"");
		
		return null;
	}

}
