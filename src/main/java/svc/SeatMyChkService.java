package svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import dao.Seat_DAO;
import vo.SeatVO;

public class SeatMyChkService {

	// 마이페이지 좌석 확인
	public ArrayList<SeatVO> getSeatMyList(String USER_ID) throws Exception {
		System.out.println("마이페이지 좌석확인 svc 연결 ");
		Connection con = getConnection();
		Seat_DAO seatDao = Seat_DAO.getInstance();
		seatDao.setConnection(con);
		
		ArrayList<SeatVO> seatMyChk = new ArrayList<SeatVO>();
		seatMyChk = null;
		seatMyChk = seatDao.selcMySeat(USER_ID);
		close(con);
		
	System.out.println("관리자 좌석 svc 연결 2");
	return seatMyChk;		
		}
}
