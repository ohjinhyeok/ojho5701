<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>todoModify</h2>
		<form action="todoModifyProc.jsp" method="post">
			날짜 : <input type="text" name="todoYear" value="${tvo.todoYear}" size="4">
	 			  <input type="text" name="todoMonth" value="${tvo.todoMonth}" size="2">
	  			  <input type="text" name="todoDay" value="${tvo.todoDay}" size="2"><br>
			시간 : <input type="text" name="todoTime" value="${tvo.todoTime}" size="5"><br>
			일정 : <input type="text" name="todo" value="${tvo.todo}" size="10"> <br>
			<input type="hidden" name="todoNo" value="${tvo.todoNo}">
			<input type="submit" value="변경">
		</form>
		<input type="button" value="돌아가기" onclick="javascript:history.back()">
</body>
</html>