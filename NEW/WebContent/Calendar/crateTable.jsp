<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="hyeok.dao.DbConnect"
    import="java.sql.*, javax.sql.*, javax.naming.*"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%  System.out.print(session.getAttribute("userId"));%>
<%  Connection con = null;
	Statement st = null;
	ResultSet rs = null;
	PreparedStatement stmt = null;
	InitialContext ctx = new InitialContext();
	DataSource ds =(DataSource)ctx.lookup("java:comp/env/jdbc/oracle");
	con = ds.getConnection();
	String T = "uuu";/* (String)session.getAttribute("userId"); */
	stmt = con.prepareStatement("CREATE TABLE T_"+T.toUpperCase()+
								"(NO NUMBER PRIMARY KEY NOT NULL,"+
		  						"MEMO VARCHAR2 (100) NOT NULL,"+
								"REG_DATE DATE NOT NULL) "+
								"CREATE SEQUENCE T_"+T.toUpperCase()+"_SEQ" + 
								"START WITH 11 "+
								"INCREMENT BY 1 "+
								"MAXVALUE 9999999999999999999999999999 "+
								"NOMINVALUE "+
								"NOORDER "+
								"NOCYCLE "+
								"CACHE 20 ");
	int result = stmt.executeUpdate();
	
	
	DbConnect.close(rs, st, stmt, con);
	
%>
<%System.out.print("완료");%>
