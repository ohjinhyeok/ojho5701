
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="hyeok.dao.DbConnect"
    import="java.sql.*, javax.sql.*, javax.naming.*"
    %>
 	<%-- <jsp:useBean id="memovo" class="com.in.global.VO.MemoVO">
    	<jsp:setProperty name="memovo" property="*"/>
    </jsp:useBean> --%> 
   <% response.setContentType("text/html;charset=UTF-8");
	request.setCharacterEncoding("UTF-8"); %>
<% 	
	Connection con = null;
	Statement st = null;
	ResultSet rs = null;
	PreparedStatement stmt = null;
	InitialContext ctx = new InitialContext();
	DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/oracle");
	con = ds.getConnection();
	
	String T = (String)session.getAttribute("userId");
	
	stmt = con.prepareStatement("UPDATE T_"+T.toUpperCase()+
				  				" SET MEMO = ? " +
								"WHERE NO = ? " );
	
	stmt.setString(2, request.getParameter("NO"));
	stmt.setString(1, request.getParameter("memo"));
	int result = stmt.executeUpdate(); 
	if(result == 1){
		session.setAttribute("msg", "메모 수정 완료");
	}else{
		session.setAttribute("msg", "메모 수정 실패");
	}%>
	<script>
		opener.document.location.reload();
		window.close();
		
	</script>
	<%
	DbConnect.close(rs, st, stmt, con);	%>





