<%@page import="java.text.Normalizer.Form"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="hyeok.vo.MemberVO"%>
<%@ page import="hyeok.dao.BatLoginDAO"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="/BatMember/LoginInfo.jsp" %>
<%String muserId = request.getParameter("userId");
	BatLoginDAO dao = new BatLoginDAO();
	MemberVO user = dao.getOneMember(muserId);
	String userPw = null;
	String email = null;
	String photo = user.getPhoto(); %>
<h2>회원 정보 수정</h2>
<form name="frm" action="/NEW/BatMember.do" method="post">
<ul>
	<li>아이디 : <%= user.getUserId() %></li>
	<li>비밀번호 : <input type="text" name="userPw" value="<%=user.getUserPw()%>" ></li>
	<li>이름 :  <%= user.getUserNm() %></li>
	<li>이메일 : <input type="text" name="email" value="<%=user.getEmail()%>"></li>
	<li>가입일자 : <%= user.getReg_date() %></li>
	<li>성별: <%= user.getGender() %></li>
	<li>사진 : <input type="file" name="photo"><br><img width="200" height="200" alt="회원사진"
				src="/NEW/BatMember/photo/<%=photo!=null?photo:"member.jpg"%>" ></li>
</ul>
<input type="hidden" name="flag" value="2">
<input type="hidden" name="userId" value="<%=user.getUserId()%>">
<input type="button" value="완료" onclick="fok()">
<input type="button" value="목록 보기" onclick="history.back()">
</form>
<script>
 function fok(){
	 if(confirm("수정하시겠습니까?")){
		 document.frm.submit();
	 }else{
		 alert("수정 취소");
		 return false;
	 }
 }
</script>
</body>
</html>









