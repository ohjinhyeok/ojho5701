<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<% 
	String userId = (String)session.getAttribute("userId");
	if(userId==(null)){
%>
	<script>
		alert("회원 전용 페이지\n로그인하신 후 이용해주세요");
		location.replace('login.jsp')
	</script>
<% 
	}
%>
<h2>HYEOK WORLD</h2>
<input type="button" value="로그아웃"
	onclick="location.replace('/NEW/BatLogout.do')">
<hr>
<!-- 로그인정보 -->