package svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;

import java.sql.Connection;

import dao.JoinDAO;
import vo.JoinVO;

public class MyInfoService {

	public JoinVO getUsers(String viewId) {
		Connection con = getConnection();
		JoinDAO joinDAO = JoinDAO.getInstance();
		joinDAO.setConnection(con);
		
		System.out.println("짱구@@@ MyinfoService" + viewId);
		JoinVO users = joinDAO.selectUser(viewId);
		close(con);
		
		return users;
	}

}
