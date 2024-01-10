package svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.commit;
import static db.JdbcUtil.getConnection;
import static db.JdbcUtil.rollback;

import java.sql.Connection;

import dao.QnaDAO;
import vo.QnaVO;

public class QnaBoardService {
	public boolean qnaInsertSV(QnaVO users) {
		boolean qnaSuccess = false;
		QnaDAO qnaDAO = QnaDAO.getInstance();
		Connection con = getConnection();
		qnaDAO.setConnection(con);
		
		int insertCount = qnaDAO.insertQna(users);
		
		if(insertCount > 0) {
			qnaSuccess = true;
			commit(con);
		}else {
			rollback(con);
		}
		close(con);
		
		return qnaSuccess;
	}
		
	}

