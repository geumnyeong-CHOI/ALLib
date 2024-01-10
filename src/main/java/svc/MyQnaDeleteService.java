package svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.commit;
import static db.JdbcUtil.getConnection;
import static db.JdbcUtil.rollback;

import java.sql.Connection;

import dao.QnaDAO;

public class MyQnaDeleteService {

	public boolean deleteQna(int deleteQna) {
		
		boolean deleteResult = false;
		Connection con = getConnection();
		QnaDAO qnaDAO = QnaDAO.getInstance();
		
		qnaDAO.setConnection(con);
		int deleteCount = qnaDAO.deleteMyQna(deleteQna);
		
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
