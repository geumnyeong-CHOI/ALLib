package svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.commit;
import static db.JdbcUtil.getConnection;
import static db.JdbcUtil.rollback;

import java.sql.Connection;

import dao.QnaDAO;
import vo.QnaVO;

public class CommentService {

	public int insertComment(QnaVO vo) {
		
		Connection con = getConnection();
		QnaDAO dao = QnaDAO.getInstance();
		dao.setConnection(con);
		
		int updateCount = dao.comment(vo);
		
		if (updateCount == 1) {
			commit(con);
		}
		rollback(con);
		close(con);
		
		return updateCount;
	}
	

}
