<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="r" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

</head>
<body>
<form action="" name="frm">
<table>
	<tr>
		<th>No.</th>
		<th>제목</th>
		<th>작성자</th>
	</tr>
<c:choose>
	<c:when test="${empty slist }">
		<tr>
			<td colspan=3>등록된 댓글이 없습니다</td>
		</tr>
	</c:when>

	<c:otherwise>
		<c:forEach items="${slist }" var="j" varStatus="t">
			<tr>
				<td>${j.rnum }</td>
				<td>${j.mid }</td>
				<td>${j.pmemoId }</td>
				<td>${j.userId } </td>
 				<td>${j.subject }</td>
 				<td><fmt:formatDate value="${j.regDate }" pattern="yyyy-MM-dd HH:mm:ss" /></td>
 				<td><c:if test="${j.pmemoId==0 }"><a href="#" onclick="view()"><i class="fa fa-plus-square-o"></i></a></c:if>
 					<c:if test="${j.pmemoId!=0 }">　</c:if>
 					<a href="#" onclick="modi(${j.mid})"><i class="fa fa-check-square-o"></i></a> 
					<a href="#" onclick="del(${j.mid})"><i class="fa fa-minus-square-o"></i></a></td>
				<td>
				<div id="hire" style="display: none;"><input type="text" name="re">　<a href="#" onclick="cyu(${j.mid})">
				<i class="fa fa-hand-o-left"></i></a></div>
				</td>
					
			</tr>
		</c:forEach>
	</c:otherwise>
</c:choose>
</table>
<%-- ${count } --%>

<input type="hidden" name="mid" value="">

<input type="submit" onclick="cli()" value="1" name="page">
<input type="submit" onclick="cli()" value="2" name="page">
<input type="submit" onclick="cli()" value="3" name="page">

</form>

<script type="text/javascript">

function cli(){
	document.frm.action="/jsp/boardProc.jsp";
	document.frm.submit();
}
function modi(we){
	alert(we);
	 document.frm.mid.value=we;
	 document.frm.action="/jsp/boardModProc.jsp";
	 document.frm.submit();
}
function del(we){
	document.frm.mid.value=we;
	document.frm.action="/jsp/boardDelProc.jsp";
	document.frm.submit();
	
}
function view(){
	var i = document.getElementById("hire");
	i.style.display="inline";
}
function cyu(we){
	document.frm.mid.value=we;
	document.frm.action="/jsp/boardAddProc.jsp";
	document.frm.submit();
}
</script>
	
	<%-- <c:forEach items="${list }" var="i" varStatus="t">
		<tr>
			<td>${i.memoId }</td>
			<td>${i.pmemoId }</td>
			<td>${i.userId } </td>
 			<td>${i.subject }</td>
		</tr>
	</c:forEach> --%>

</body>
</html>