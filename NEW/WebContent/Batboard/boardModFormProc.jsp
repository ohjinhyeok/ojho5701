<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>건의 수정</h2>
<form action="boardModProc.jsp" method="post">
			내용 : <input type="text" name="subject" value="${bvo.subject}" size="50"> <br>
				  <input type="hidden" name="mid" value="${bvo.mid}">
				   <input type="hidden" name="mid" value="${bvo.pmemoId}">
				  
				   
			      <input type="submit" value="변경">
		</form>
		<input type="button" value="돌아가기" onclick="javascript:history.back()">
</body>
</html>