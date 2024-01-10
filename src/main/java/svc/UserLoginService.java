package svc;
import static db.JdbcUtil.*;
import java.sql.Connection;
import dao.JoinDAO;
import vo.JoinVO;

public class UserLoginService {

	public boolean login(JoinVO users) {
		Connection con = getConnection();
		JoinDAO joinDAO = JoinDAO.getInstance();
		joinDAO.setConnection(con);
		
		boolean loginResult = false;
		String loginId = joinDAO.selectLoginId(users);

		if(loginId != null) {
			loginResult = true;
		}
		
		close(con);
		return loginResult;
	}
}
