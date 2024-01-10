package svc;
import static db.JdbcUtil.*;
import java.sql.Connection;
import java.util.ArrayList;
import dao.JoinDAO;
import vo.JoinVO;


public class UserListService {
	
	public int getUserCount() {
		int userCount = 0;
		Connection con = getConnection();
		JoinDAO dao = JoinDAO.getInstance();
		dao.setConnection(con);
		
		userCount = dao.selectUserCount();
		close(con);
		return userCount;
	}

	public ArrayList<JoinVO> getUserList(int page, int limit) {
		Connection con = getConnection();
		JoinDAO joinDAO = JoinDAO.getInstance();
		joinDAO.setConnection(con);
		
		ArrayList<JoinVO> userList = joinDAO.selectUserList(page, limit);
		close(con);

		return userList;
	}
}
