<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ page import="hyeok.vo.MemberVO " %>
<%@ page import="java.text.Normalizer.Form " %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="LoginInfo.jsp" %> 
	<% MemberVO mvo = (MemberVO)request.getAttribute("user"); 
   		String ph = mvo.getPhoto();
		if(mvo!=null){%>
			<%String msgmo = (String)request.getAttribute("msgmo");%>
		<%if(msgmo!=null){%>
			<script>
				alert("<%=msgmo%>");
			</script>
		<%}%>
<h2>회원 정보 보기</h2>
<form name="frm" action="/NEW/BatMember.do">
	<ul>
		<li>아이디 : <%=mvo.getUserId()%></li>
		<li>이름 :  <%=mvo.getUserNm()%></li>
		<li>이메일 : <%=mvo.getEmail()%></li>
		<li>가입일자 : <%=mvo.getReg_date()%></li>
		<li>성별: <c:choose>
					<c:when test="${mvo.getGender=='M' }">
						남
					</c:when>
					<c:otherwise>
						여
					</c:otherwise>
				</c:choose>
	   </li>
	   
		<li>사진 : <img width="200" height="200" alt="회원사진"
					src="/NEW/BatMember/photo/<%=ph!=null?ph:"member.jpg"%>"></li>
	</ul>
<input type="hidden" name="flag" value="4">
<input type="hidden" name="userId" value="<%=mvo.getUserId()%>">
<input type="button" value="수정 하기" onclick="location.replace('/NEW/BatMember/modify.jsp?&userId=<%=mvo.getUserId()%>')">
<input type="button" value="회원 삭제" onclick="del()">
<input type="button" value="목록 보기" onclick="location.replace('/NEW/BatMember.do?flag=3')">
	<%}%>
</form>

<script>
 function del(){
		 if(confirm("삭제하시겠습니까?")){
			 document.frm.submit();
		 }else{
			 alert("삭제 취소");
		 }
 }
</script>
</body>
</html>
<% request.removeAttribute("msgmo");%>
