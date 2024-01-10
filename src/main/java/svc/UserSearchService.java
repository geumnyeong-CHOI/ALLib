package svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import dao.JoinDAO;
import vo.JoinVO;

public class UserSearchService {
	
	public ArrayList<JoinVO> getUserSearch(String userSearch) {
		ArrayList<JoinVO> userLookup = null;
		Connection con = getConnection();
		JoinDAO dao = JoinDAO.getInstance();
		dao.setConnection(con);
		userLookup = dao.selectUserSearch(userSearch);
		close(con);
		return userLookup;
	}
	
}
