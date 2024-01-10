package svc;

import static db.JdbcUtil.*;
import java.sql.Connection;
import java.util.ArrayList;
import dao.Seat_DAO;
import vo.BookRentalYNVO;
import vo.SeatVO;

public class SeatChkService {
	
	public ArrayList<SeatVO> getSeatSelcChk(String USER_ID){
		Connection con = getConnection();
		Seat_DAO seatDao = Seat_DAO.getInstance();
		seatDao.setConnection(con);
		System.out.println("좌석 확인 svc1 ");
		
		ArrayList<SeatVO> seatChk = new ArrayList<SeatVO>();
		seatChk = null;
		seatChk = seatDao.selcMySeat(USER_ID);
		close(con);
		System.out.println("좌석 확인 svc2 ");
		
		return seatChk;
	}

}
