package svc;
import static db.JdbcUtil.*;
import java.sql.Connection;
import dao.JoinDAO;
import vo.JoinVO;

public class UserJoinService {

	public boolean joinUser(JoinVO users) {
		boolean joinSuccess = false;
		JoinDAO joinDAO = JoinDAO.getInstance();
		Connection con = getConnection();
		
		joinDAO.setConnection(con);
		int insertCount = joinDAO.insertUser(users);
		
		if(insertCount > 0) {
			joinSuccess = true;
			commit(con);
		}else {
			rollback(con);
		}
		close(con);
		
		return joinSuccess;
	}
		
	}

