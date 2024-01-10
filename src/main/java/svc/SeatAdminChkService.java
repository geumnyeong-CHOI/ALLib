package svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import dao.*;
import vo.SeatselcYNVO;

public class SeatAdminChkService {

	public int getAdminCount() {
		int adminCount = 0;
		Connection con = getConnection();
		AdminDAO adminDao = AdminDAO.getInstance();
		adminDao.setConnection(con);
		
		adminCount = adminDao.adminBRCount();
		close(con);
		return adminCount;
	}

	// 관리자 전체 좌석 대여 확인
	public ArrayList<SeatselcYNVO> getAdminSchklist () throws Exception {
		ArrayList<SeatselcYNVO> adminAllSchkList = null;
		Connection con = getConnection();
		System.out.println("관리자 전체좌석 svc 연결 ");
		Seat_DAO seatDao = Seat_DAO.getInstance();
		seatDao.setConnection(con);
		adminAllSchkList = seatDao.adminAllChkSeat();
		close(con);
		System.out.println("관리자 전체좌석 svc 연결 2");
		return adminAllSchkList;		
	}
		
	
	
	
	
	
}
