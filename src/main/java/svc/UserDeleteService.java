package svc;
import static db.JdbcUtil.*;
import java.sql.Connection;
import dao.JoinDAO;

public class UserDeleteService {

	public boolean deleteUser(String deleteId) {
		boolean deleteResult = false;
		Connection con = getConnection();
		JoinDAO joinDAO = JoinDAO.getInstance();
		
		joinDAO.setConnection(con);
		int deleteCount = joinDAO.deleteUser(deleteId);
		
		if(deleteCount > 0) {
			commit(con);
			deleteResult = true;
		}else {
			rollback(con);
		}
		
		close(con);
		return deleteResult;
	}
}
