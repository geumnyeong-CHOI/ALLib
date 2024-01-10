package svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import dao.QnaDAO;
import vo.QnaVO;

public class MyQnaListService {

	public int getListCount(String uid) {
		
		int listCount = 0;
		Connection con = getConnection();
		QnaDAO dao = QnaDAO.getInstance();
		dao.setConnection(con);
		listCount = dao.selectMyListCount(uid);
		close(con);
		
		return listCount;
	}

	public ArrayList<QnaVO> getQnaList(int page, int limit, String uid) {
		
		ArrayList<QnaVO> myQnaList = null;
		Connection con = getConnection();
		QnaDAO dao = QnaDAO.getInstance();
		dao.setConnection(con);
		myQnaList = dao.selectMyQnaList(page,limit,uid);
		close(con);
		return myQnaList;
	}

}
