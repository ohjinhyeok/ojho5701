<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<html>
<head>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

function View() {

			var test = document.getElementById("nit");
		 	test.style.display="inline";
	}

</script>
</head>
<body >

<h2>adminList</h2>
<div style="color:red">${msg }</div>
<form name="frm"  method="post">

<hr>
<table>
<c:choose>
	<c:when test="${empty list }">
	<tr><td colspan=3>
			등록된 일정이 없습니다</td></tr>
	</c:when>

	<c:otherwise>
	<c:forEach items="${list }" var="i" varStatus="t">
	<tr>
		<td>시간 : <fmt:formatDate value="${i.regDate}" pattern="yyyy-MM-dd HH:mm:ss" /> </td>
		<td>내용 : ${i.todo } </td>
 		<td><a href="#" onclick="mod(${i.todoNo})"><i class="fa fa-check-square-o"></i></a> 
			<a href="#" onclick="del(${i.todoNo})"><i class="fa fa-minus-square-o"></i></a></td>
	</tr>
	</c:forEach>
	</c:otherwise>
</c:choose>
</table>
<input type="hidden" name="todoNo" value="">

</form>
<hr>
<%-- <c:forEach var="i"  items="${list}" >
	날짜 : ${i.todoYear}/${i.todoMonth}/${i.todoDay}/${i.todoTime}<br>
	일정 : ${i.todo} | <a href="#" onclick="todoModifyProc.jsp"><i class="fa fa-check-square-o"></i></a> 
				 	<a href="#" onclick="del(${i.todoNo})"><i class="fa fa-minus-square-o"></i></a><br>
				 	

</c:forEach> --%>

<input type="submit" value="일정 등록 하기" onclick="View()">
<input type="button" value="메인 돌아가기" onclick="location.replace('/NEW/BatMember/main.jsp')">
<div id="nit" style="display: none;">
	<h2>일정 추가</h2>
		<form action="todoAddProc.jsp" method="post">
			날짜 : <input type="text" name="todoYear" value="" size="4">
	 			  <input type="text" name="todoMonth" value="" size="2">
	  			  <input type="text" name="todoDay" value="" size="2"><br>
			시간 : <input type="text" name="todoTime" value="" size="5"><br>
			일정 : <input type="text" name="todo" value="" size="10"> <br>
			<input type="submit" value="등록">
		</form>
</div>
<script type="text/javascript">
	function del(data){
		if(confirm("삭제하시겠습니까?")){
			 document.frm.todoNo.value=data;
			 document.frm.action="/NEW/BatList/todoDelectProc.jsp"
			 document.frm.submit();
		}else{
			alert("삭제 취소");
			return false;
	 	}
	}
	function mod(data){
			 document.frm.todoNo.value=data;
			 document.frm.action="/NEW/BatList/todoModifyProc.jsp"
			 document.frm.submit();
	 }
	

</script>

<% session.removeAttribute("msg"); %>
</body>
</html>