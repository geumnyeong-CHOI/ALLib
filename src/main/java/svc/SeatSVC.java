package svc;

import static db.JdbcUtil.*;
import java.sql.*;
import dao.Seat_DAO;
import vo.SeatVO;

public class SeatSVC {

	// 좌석선택
		public boolean selectSeat(SeatVO seatVo) {
			boolean seatInsertResult = false;
			Connection con = getConnection();
			Seat_DAO seatDao = Seat_DAO.getInstance();
			System.out.println("좌석선택 svc 연결");
			
			seatDao.setConnection(con);
			int SeatInsertCount = seatDao.selectSeat(seatVo);
			if (SeatInsertCount > 0) {
				seatInsertResult = true;
				commit(con);
			System.out.println("좌석선택 svc 커밋");	
			} else {
				rollback(con);
			}
			close(con);
			return seatInsertResult;
		}
//
//		public SeatVO seatChk(String id) {
//		      Seat_DAO seatDao = Seat_DAO.getInstance();
//		      Connection con = getConnection();
//
//		      seatDao.setConnection(con);
//
//			 return seatDao.seatChk(id);
//			}
}
