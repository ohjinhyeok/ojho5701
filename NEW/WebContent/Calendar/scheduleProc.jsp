<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.sql.*, javax.sql.*, javax.naming.*, java.util.*"
    import="hyeok.dao.DbConnect"
    import="hyeok.vo.MemberVO"
    import="java.util.Date"
    import="java.text.*"
	import="java.text.SimpleDateFormat"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% response.setContentType("text/html;charset=UTF-8");
	request.setCharacterEncoding("UTF-8"); %>
<%  
	Connection con = null;
	Statement st = null;
	ResultSet rs = null;
	PreparedStatement stmt = null;
	InitialContext ctx = new InitialContext();
	DataSource ds =(DataSource)ctx.lookup("java:comp/env/jdbc/oracle");
	con = ds.getConnection();
	String T = (String)session.getAttribute("userId");
	String datepicker = request.getParameter("datepicker");
	String memo = request.getParameter("memo");
	System.out.println("데이"+datepicker+memo);
	
	stmt = con.prepareStatement("INSERT INTO T_"+T.toUpperCase()+"(NO, MEMO, REG_DATE) "+ 
		  "VALUES(T_ADMIN_SEQ.NEXTVAL,?,?)");
	
	 stmt.setString(1, memo); 
	 stmt.setString(2, datepicker);
	
	int result = stmt.executeUpdate(); 
	
	if(result == 1){
		session.setAttribute("msg", "일정 등록 완료");
	}else{
		session.setAttribute("msg", "일정 등록 실패");
	}
	%>
	<script>
	
		opener.document.location.reload();
		window.close();
		
	</script>
	
	<%DbConnect.close(rs, st, stmt, con);%>