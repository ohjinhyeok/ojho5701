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
<%String userId = request.getParameter("userId");

		Connection con = null;
		ResultSet rs = null;
		PreparedStatement stmt = null;
		Statement st = null;
		InitialContext ctx = new InitialContext();
		Date date = new Date();
		
		DateFormat dFf = new SimpleDateFormat("d");
		DateFormat dF = new SimpleDateFormat("YYYY-MM-dd");
		
		DataSource ds =(DataSource)ctx.lookup("java:comp/env/jdbc/oracle");
		con = ds.getConnection();
	
		st = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,
								  ResultSet.CONCUR_UPDATABLE);
		
		rs = st.executeQuery(" select * from T_"+userId.toUpperCase()+
							 " ORDER BY REG_DATE");
		
		rs.previous();
		
		
		boolean result = false ;
		
		while(rs.next()){
			 int NO = rs.getInt("NO");
			 String memo = rs.getString("MEMO");
			 Date regDate = rs.getDate("REG_DATE");
			if(dFf.format(regDate).toString().equals((String)request.getParameter("day"))){
				result=true; 
				request.setAttribute("today", null);
				request.setAttribute("memo", memo);
				request.setAttribute("regDate", dF.format(regDate));
				out.println(memo);
				out.println(dF.format(regDate));
					
			}			
		}
		
		response.sendRedirect("calendar.jsp");
	DbConnect.close(rs,stmt,con);
	
	
%>	
