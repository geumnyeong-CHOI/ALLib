package svc;

import static db.JdbcUtil.*;

import java.sql.Connection;

import dao.*;
import vo.*;

public class SeatCancelService {

	// 좌석 예약 취소 
	public boolean xxSeat(SeatVO seatVo) {
		System.out.println("3333: "+seatVo.getSEAT_NUM());
		System.out.println("좌석취소 svc 시작");
		boolean cancelResult = false;
		Connection con = getConnection();
		Seat_DAO seatDao = Seat_DAO.getInstance();
		
		System.out.println("좌석취소 svc 연결");
		seatDao.setConnection(con);
		int seatxInsertCount = seatDao.xxSeat(seatVo);
		if(seatxInsertCount > 0) {
			commit(con);
			cancelResult = true;
		} else {
			rollback(con);
		}
		close(con);
		return cancelResult;		
	}
}
