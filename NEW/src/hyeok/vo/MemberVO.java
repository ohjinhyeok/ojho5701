package hyeok.vo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Date;

import javax.servlet.http.HttpSession;

public class MemberVO {
	private String  userId;
	private String 	userPw;
	private String userNm;
	private String email;
	private String gender;
	private String photo;
	private Date reg_date;
	

	public MemberVO(String userId, String userPw) {
		this.userId=userId;
		this.userPw=userPw;
	}
	public MemberVO(String userId,String userPw,String userNm,
							String email,String gender,String photo, Date reg_date){
		this.userId=userId;
		this.userPw=userPw;
		this.userNm=userNm;
		this.email=email;
		this.gender=gender;
		this.photo=photo;
		this.reg_date=reg_date;			
	}
	
	public MemberVO(String userId, String userNm, Date reg_date) {
		this.userId=userId;
		this.userNm=userNm;
		this.reg_date=reg_date;		
		
	}
	public MemberVO(String userId, String userPw, String email) {
		this.userId=userId;
		this.userPw=userPw;
		this.email=email;		
		
	}
	public MemberVO(String userId) {
		this.userId=userId;
	}
	public MemberVO(String userId,String userNm,
			String email,String gender,Date reg_date) {
		this.userId=userId;
		this.userNm=userNm;
		this.email=email;
		this.gender=gender;
		this.reg_date=reg_date;	
	}
	public MemberVO() {
		
	}
	public MemberVO(String userId,String userNm,
			String email,Date reg_date) {
		this.userId=userId;
		this.userNm=userNm;
		this.email=email;
		this.reg_date=reg_date;	
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
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
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	


}


