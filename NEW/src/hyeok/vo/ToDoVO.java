package hyeok.vo;

import java.util.Date;

public class ToDoVO {
	private int NO;
	private int todoNo;
	private String menu;
	private String userId;
	private String userPw;
	private String userNm;
	private String email;
	private String gender;
	private String photo;
	private String todo;
	private Date regDate;
	private String todoTime;
	private String TOHYO;
	
	
	public String getTodoTime() {
		return todoTime;
	}
	public void setTodoTime(String todoTime) {
		this.todoTime = todoTime;
	}
	public String getTOHYO() {
		return TOHYO;
	}
	public void setTOHYO(String tOHYO) {
		TOHYO = tOHYO;
	}
	public int getTodoNo() {
		return todoNo;
	}
	public void setTodoNo(int todoNo) {
		this.todoNo = todoNo;
	}
	public String getTodo() {
		return todo;
	}
	public void setTodo(String todo) {
		this.todo = todo;
	}
	public String getUserPw() {
		return userPw;
	}
	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}
	public String getUserNm() {
		return userNm;
	}
	public void setUserNm(String userNm) {
		this.userNm = userNm;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public int getNO() {
		return NO;
	}
	public void setNO(int nO) {
		NO = nO;
	}
	
	public String getMenu() {
		return menu;
	}
	public void setMenu(String menu) {
		this.menu = menu;
	}
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	
}
	
	
	
	