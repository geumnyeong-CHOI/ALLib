package vo;

public class BookRentalYNVO {
//memberbean과 같음
	private String BOOK_CODE;
	private String BOOK_NAME;
	private String RDATE;
	private String OVERDUE;
	private String USER_ID;

	public String getBOOK_CODE() {
		return BOOK_CODE;
	}
	public void setBOOK_CODE(String bOOK_CODE) {
		BOOK_CODE = bOOK_CODE;
	}
	public String getBOOK_NAME() {
		return BOOK_NAME;
	}
	public void setBOOK_NAME(String bOOK_NAME) {
		BOOK_NAME = bOOK_NAME;
	}
	public String getRDATE() {
		return RDATE;
	}
	public void setRDATE(String rDATE) {
		RDATE = rDATE;
	}
	public String getOVERDUE() {
		return OVERDUE;
	}
	public void setOVERDUE(String oVERDUE) {
		OVERDUE = oVERDUE;
	}
	public String getUSER_ID() {
		return USER_ID;
	}
	public void setUSER_ID(String USER_ID) {
		USER_ID = USER_ID;
	}
}
