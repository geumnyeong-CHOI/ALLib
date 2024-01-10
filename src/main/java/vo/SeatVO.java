package vo;

public class SeatVO {
private String SEAT_NUM;
private String USER_ID;
private String SEAT_NO;
private String SEAT_DAY;
private String SEAT_SELC;

public String getSEAT_NUM() {
	return SEAT_NUM;
}
public void setSEAT_NUM(String sEAT_NUM) {
	SEAT_NUM = sEAT_NUM;
}
public String getUSER_ID() {
	return USER_ID;
}
public void setUSER_ID(String uSER_ID) {
	USER_ID = uSER_ID;
}
public String getSEAT_NO() {
	return SEAT_NO;
}
public void setSEAT_NO(String sEAT_NO) {
	SEAT_NO = sEAT_NO;
}
public String getSEAT_DAY() {
	return SEAT_DAY;
}
public void setSEAT_DAY(String sEAT_DAY) {
	SEAT_DAY = sEAT_DAY;
}
public String getSEAT_SELC() {
	return SEAT_SELC;
}
public void setSEAT_SELC(String sEAT_SELC) {
	SEAT_SELC = sEAT_SELC;
}
@Override
public String toString() {
	return "SeatVO [SEAT_NUM=" + SEAT_NUM + ", USER_ID=" + USER_ID + ", SEAT_NO=" + SEAT_NO + ", SEAT_DAY=" + SEAT_DAY
			+ ", SEAT_SELC=" + SEAT_SELC + "]";
}





}
