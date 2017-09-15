<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.util.ArrayList"%>
<%@ page import="hyeok.vo.MemberVO"%>
<%@ page import="hyeok.dao.BatLoginDAO"%>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>

<style type="text/css">
a{text-decoration:none; color:#000000;}
         
a:hover{color:#ff0000;}   
    
</style>

<body link="black" alink="black" vlink="black">
	<ul>
		
			<h3>게시판</h3>
		
		<li>
			<form action="/NEW/BatList/BatListProc.jsp" method="post">
				<input type="hidden" name="userId" value="${userId}">
				<input type="submit"  value="배틀 게시판 가기">
			</form>
		</li>
		<li>
			<form action="/NEW/BatCalendar/calendar.jsp" method="post">
				<input type="submit"  value="일정 게시판 가기">
			</form>
		</li>	
	</ul>
<hr>

<h2>전 체 회 원 관 리 시 스 템 || <a href="/NEW/BatList/todoListProc.jsp">일 정 관 리 시 스 템</a></h2> </h2> 
<%	String msgr = (String)request.getAttribute("msgr"); %>
<div style="color:red">
	<%=(msgr != null) ? msgr : "" %>
</div>
<%	ArrayList<MemberVO> list = new BatLoginDAO().getAllMember();
	int cnt = 0;
	if(list == null || list.size() < 1) { %>
	<h3>등록된 회원이 없습니다.<%=list%></h3>
<%  } else { %>
<table border=1 width=400>
<tr><th>No.</th>
	<th>아이디</th>
	<th>이름</th>
	<th	>가입일자</th></tr>
<%		for(MemberVO mvo : list){ %>
<tr><td><%=++cnt %></td>
	<td><a href="/NEW/BatMember.do?flag=1&userId=<%=mvo.getUserId() %>" >
			<%=mvo.getUserId() %></a></td>
	<td><%=mvo.getUserNm() %></td>
	<td><%=mvo.getReg_date()%></td></tr>
<% 		}
	}%>
	
</table>
</body>
</html>




