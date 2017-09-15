package hyeok.vo;

import java.util.Date;

public class CalVO {
	private int no;
	private String memo;
	private Date regDate;
	private String userId;
	private String ui;
	
	public String getUi() {
		return ui;
	}
	public void setUi(String ui) {
		this.ui = ui;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	
}
