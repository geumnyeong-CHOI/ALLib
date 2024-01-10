package vo;

public class BookRentVO {
	private String BOOK_CODE;
	private String USER_ID;
	private String OVERDUE;
	
	public String getBOOK_CODE() {
		return BOOK_CODE;
	}
	public void setBOOK_CODE(String bOOK_CODE) {
		BOOK_CODE = bOOK_CODE;
	}
	public String getUSER_ID() {
		return USER_ID;
	}
	public void setUSER_ID(String uid) {
		USER_ID = uid;
	}
	public String getOVERDUE() {
		return OVERDUE;
	}
	public void setOVERDUE(String oVERDUE) {
		OVERDUE = oVERDUE;
	}

	
}