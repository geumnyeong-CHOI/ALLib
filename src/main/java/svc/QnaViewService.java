package svc;

import static db.JdbcUtil.*;

import java.sql.Connection;

import dao.QnaDAO;
import vo.QnaVO;

public class QnaViewService {

	public QnaVO getQna(String qnaNo) {
		Connection con = getConnection();
		QnaDAO qnaDAO = QnaDAO.getInstance();
		qnaDAO.setConnection(con);
		
		QnaVO qna = qnaDAO.getQna(qnaNo);
		close(con);
		
		return qna;
	}
}
