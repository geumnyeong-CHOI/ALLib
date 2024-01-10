package svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import dao.QnaDAO;
import vo.QnaVO;


public class QnaListService {

	public int getListCount() throws Exception{
		
		int listCount = 0;
		Connection con = getConnection();
		QnaDAO dao = QnaDAO.getInstance();
		dao.setConnection(con);
		listCount = dao.selectListCount();
		close(con);
		return listCount;
		
	}

	public ArrayList<QnaVO> getQnaList(int page, int limit) throws Exception{
		
		ArrayList<QnaVO> qnaList = null;
		Connection con = getConnection();
		QnaDAO dao = QnaDAO.getInstance();
		dao.setConnection(con);
		qnaList = dao.selectQnaList(page,limit);
		close(con);
		return qnaList;
		
	}
}
