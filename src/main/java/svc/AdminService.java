package svc;

import static db.JdbcUtil.*;

import java.sql.Connection;
import java.util.ArrayList;

import dao.AdminDAO;
import dao.BookDAO;
import dao.JoinDAO;
import vo.*;

public class AdminService {
	
	public int getAdminCount() {
		int adminCount = 0;
		Connection con = getConnection();
		AdminDAO adminDao = AdminDAO.getInstance();
		adminDao.setConnection(con);
		
		adminCount = adminDao.adminBRCount();
		close(con);
		return adminCount;
	}
	
	// 관리자 메인 도서 대여 현황
	public ArrayList<BookRentalYNVO> getAdminBlist () throws Exception {
		ArrayList<BookRentalYNVO> adminBookList = null;
		Connection con = getConnection();
		System.out.println("관리자 svc 연결 ");
		AdminDAO adminDao = AdminDAO.getInstance();
		adminDao.setConnection(con);
		adminBookList = adminDao.adminBookrentAll();
		close(con);
		System.out.println("관리자 svc 연결 2");
		return adminBookList;		
	}
	
	// 관리자 메인 좌석 대여 현황
		public ArrayList<SeatselcYNVO> getAdminSlist () throws Exception {
			ArrayList<SeatselcYNVO> adminSeatList = null;
			Connection con = getConnection();
			System.out.println("관리자 좌석 svc 연결 ");
			AdminDAO adminDao = AdminDAO.getInstance();
			adminDao.setConnection(con);
			adminSeatList = adminDao.adminSeatAll();
			close(con);
			System.out.println("관리자 좌석 svc 연결 2");
			return adminSeatList;		
		}
		
	// 관리자 메인 회원 목록 현황
		public ArrayList<JoinVO> getAdminUlist () throws Exception {
			ArrayList<JoinVO> adminUserList = null;
			Connection con = getConnection();
			System.out.println("관리자 회원 svc 연결 ");
			AdminDAO adminDao = AdminDAO.getInstance();
			adminDao.setConnection(con);
			adminUserList = adminDao.adminUserAll();
			close(con);
			System.out.println("관리자 회원 svc 연결 2");
			return adminUserList;		
		}
		
		// 관리자 메인 Q&A 목록 현황
		public ArrayList<QnaVO> getAdminQlist () throws Exception {
			ArrayList<QnaVO> adminQnaList = null;
			Connection con = getConnection();
			System.out.println("관리자 질문 svc 연결 ");
			AdminDAO adminDao = AdminDAO.getInstance();
			adminDao.setConnection(con);
			adminQnaList = adminDao.adminQnaAll();
			close(con);
			System.out.println("관리자 질문 svc 연결 2");
			return adminQnaList;		
		}
}