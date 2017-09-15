package hyeok.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import hyeok.vo.MemberVO;

public class BatLoginDAO {
	Connection con = null;
	Statement st = null;
	PreparedStatement stmt = null;
	ResultSet rs =null;
	String sql = null;
	
	public boolean login(MemberVO mvo) throws SQLException, ClassNotFoundException{
		
		boolean result = false ;
		
		String userId = mvo.getUserId();
		String userPw = mvo.getUserPw();
		
		sql = "select * from bat_member "+
					 "where user_id = ? and user_pw = ? ";
		con =  DbConnect.getConn();
		
		try {
		stmt = con.prepareStatement(sql);
		stmt.setString(1, userId);
		stmt.setString(2, userPw);
		rs = stmt.executeQuery();
		
		while(rs.next()){
			userId = rs.getString("user_Id");
			userPw = rs.getString("user_Pw");
				if(userId.equals(userId) && userPw.equals(userPw)){
				 result=true;
				}
		 }
		}finally{
			DbConnect.close(rs, stmt, con);
		}
		return result;
	}

	public ArrayList <MemberVO> getAllMember() {
		con =  DbConnect.getConn(); 
		ArrayList<MemberVO> list = new ArrayList<>();
		sql = "select * from bat_member ";
		try {
			st = con.createStatement();
			rs = st.executeQuery(sql);
			while(rs.next()){
				MemberVO mvo = new MemberVO(
				rs.getString("user_Id"),
				rs.getString("USER_NM"),
				rs.getString("Email"),
				rs.getDate("REG_DATE"));
				list.add(mvo);
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}finally{
			DbConnect.close(rs,st, stmt, con);
		}
		return list;
	}
	
	public MemberVO getOneMember(String userId){
		con =  DbConnect.getConn(); 
		sql = "select * from bat_member "
				+"where user_id = ?";
		MemberVO mvo = new MemberVO();
		try {
			stmt = con.prepareStatement(sql);
			stmt.setString(1, userId);
			rs = stmt.executeQuery();
			
			while(rs.next()){
				mvo.setUserId(rs.getString("user_Id"));
				mvo.setUserNm(rs.getString("USER_NM"));
				mvo.setUserPw(rs.getString("user_Pw"));
				mvo.setEmail(rs.getString("email"));
				mvo.setGender(rs.getString("gender"));
				mvo.setReg_date(rs.getDate("REG_DATE"));
			}
	
		}catch (SQLException e) {
			e.printStackTrace();
		}finally{
			DbConnect.close2(rs,st, stmt, con);
		}
		return mvo;
	}
	
	public int modify(String userId, String userPw, String email){
		int res = 0;
		con =  DbConnect.getConn(); 
		sql = "UPDATE bat_member "+
			  "set user_pw = ? , email = ? "+ 
			  "where user_id = ? " ;
		try {
		stmt = con.prepareStatement(sql);
		stmt.setString(1, userPw);
		stmt.setString(2, email);
		stmt.setString(3, userId);
		res = stmt.executeUpdate();
	}catch (SQLException e) {
		e.printStackTrace();
	}finally{
		DbConnect.close(rs, st, stmt, con);
	}
	  return res;
	}
	
	public int delete(String userId) {
		int res = 0;
		con =  DbConnect.getConn(); 
		sql = "delete from bat_member  "+
			  "where user_id = ? ";
		try {
		stmt = con.prepareStatement(sql);
		stmt.setString(1, userId);
		res = stmt.executeUpdate();
		}catch (SQLException e) {
			e.printStackTrace();
		}finally{
			DbConnect.close(rs, st, stmt, con);
		}
		  return res;
	}
	
	public int join(String userId,String userPw,String userNm,
			String email,String gender,String photo){//硫ㅻ쾭媛믪쑝濡쒕컺湲�.
		System.out.println(userId);
		int res = 0;
		con =  DbConnect.getConn(); 
		sql = "INSERT INTO "+
			"bat_member(user_id, user_pw, user_nm, email, gender, photo, reg_date) "+
			"VALUES(?,?,?,?,?,?,SYSDATE)";
		try{
		stmt = con.prepareStatement(sql);
		stmt.setString(1, userId);
		stmt.setString(2, userPw);
		stmt.setString(3, userNm);
		stmt.setString(4, email);
		stmt.setString(5, gender);
		stmt.setString(6, photo);
		res = stmt.executeUpdate();
		
		}catch (SQLException e) {
			e.printStackTrace();
		}finally{
		DbConnect.close(rs, st, stmt, con);
	 }
	  return res;
	}

	public int crate(String userId){//硫ㅻ쾭媛믪쑝濡쒕컺湲�.
		int res = 0;
		con =  DbConnect.getConn(); 
		String T = userId;
		sql = "CREATE TABLE T_"+T.toUpperCase()+
				"(NO NUMBER PRIMARY KEY NOT NULL,"+
					"MEMO VARCHAR2 (100) NOT NULL,"+
				"REG_DATE DATE NOT NULL) ";
		try{
		stmt = con.prepareStatement(sql);
		
		res = stmt.executeUpdate();
		
		}catch (SQLException e) {
			e.printStackTrace();
		}finally{
		DbConnect.close(rs, st, stmt, con);
	}
	  return res;
	}
	
	

}	
