<%@ page import="javax.swing.text.Document"%>
<%@ page import="hyeok.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%-- 이거는 jsp 주석문 --%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

</head>
<body link="black" alink="black" vlink="black">
	
	<%@ include file="LoginInfo.jsp" %>
	
	<% if(userId!=null && userId.equals("admin")){%>
	<%@ include file="/BatMember/adminMenu.jsp" %>	
	<%}else{%>
<ul>
	<li><a href="/NEW/BatMember.do?flag=1&userId=<%=userId%>">내 정보 보기</a></li>
	<li><a href="/NEW/BatCalendar/calendarListProc.jsp?userId=<%=userId%>">일정 게시판 가기</a></li>
	<li><a href="/NEW/BatList/BatListProc.jsp?flag=1&userId=<%=userId%>">배틀 게시판 가기</a></li>
</ul>
<%}%>


</body>
</html>
