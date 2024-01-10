package svc;

import static db.JdbcUtil.*;

import java.sql.Connection;

import dao.JoinDAO;
import vo.JoinVO;

public class UpdateUserProService {

	public int modifyUsers(JoinVO users) {
		//DB연결
		Connection con = getConnection();
		JoinDAO dao = JoinDAO.getInstance();
		dao.setConnection(con);
		
		// dao에서 메소드 호출하여 int값으로 받아오기
		int updateCount = dao.updateUser(users);
		
		// 받아온 값이 1이면 commit하고 1을 return
		if (updateCount == 1) {
			commit(con);
		}
		rollback(con);
		close(con);
		
		return updateCount;
	}

}
