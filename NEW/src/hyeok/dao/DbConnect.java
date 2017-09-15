package hyeok.dao;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

public class DbConnect {
	private static Connection goCon ;
	private DbConnect () {} // 생성자에 제한자 private 바깥에서 new로 객체 생성 할수없음 
	public static Connection getConn () { // 연결시키는 getCon 메소드  static이므로 공유가능 이제 커넥션객체는 getConn으로 불러올것 
		
		
			// Properties 객체생성하여 드라이버 url, 사용자명, 비번 넣기 
		Properties prp =new Properties();
		prp.put("driver", "oracle.jdbc.driver.OracleDriver");
		prp.put("url",	"jdbc:oracle:thin:@localhost:1521:xe");
		prp.setProperty("username", "dev"); 
		prp.setProperty("password", "1111");
		
		String url = prp.getProperty("url"); 
		String driver = prp.getProperty("driver");
		String username = prp.getProperty("username"); 
		String password = prp.getProperty("password");
		
		// 싱글톤 커넥션 객체 goCon로 디비 연결  
		try {
			Class.forName(driver);
			goCon=DriverManager.getConnection(url,username,password);
			System.out.println("작업 완료");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		
		return goCon; // 이 메소드는 드라이버와 연결하는 커넥션 객체 goCon을 반환 
	}
	
	public static void getClose () { // 커넥션 단절 메소드 
		
		  if (goCon != null)
			try {
				goCon.close();
				System.out.println("쿼리 완료");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	}
	
	public static void close(ResultSet rs, PreparedStatement stmt,
							Connection con){
		try {
			if(rs != null) rs.close();
			if(stmt != null) stmt.close();
			if(con != null) con.close();
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
	}
	
	public static void close(ResultSet rs,Statement st, PreparedStatement stmt,
		Connection con){
		try {
			if(rs != null) rs.close();
			if(st != null) st.close();
			if(stmt != null) stmt.close();
			if(con != null) con.close();
		} catch (SQLException e) {

			e.printStackTrace();
		}
	
		}
	
	public static void close2(ResultSet rs,Statement st, PreparedStatement stmt,
			Connection con){
			try {
				if(rs != null) rs.close();
				if(st != null) st.close();
				if(stmt != null) stmt.close();
				if(con != null) con.close();
			} catch (SQLException e) {

				e.printStackTrace();
			}
		
			}
	public static void close(ResultSet rs,Statement st,Connection con){
			try {
				if(rs != null) rs.close();
				if(st != null) st.close();
				if(con != null) con.close();
			} catch (SQLException e) {

				e.printStackTrace();
			}
		
			}
}
	
	