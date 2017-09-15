<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<body>
<h2>BatModify ${tvo.userId}</h2>
		<form action="#" name="frm" method="post">
			댓글 : <input type="text" name="todo" size="50"> 
				  <input type="hidden" name="todoNo" value="${tvo.todoNo}">
			<input type="button" value="수정" onclick="su()">
		</form>
<script type="text/javascript">
function su(){
	if(confirm("수정하시겠습니까?")){
		document.frm.action = "/NEW/BatList/BatModifyProc.jsp";
		document.frm.submit();
	 }else{
		 alert("수정 취소");
		 return false;
	 }
}
</script>

		<br><br>
		<input type="button" value="돌아가기" onclick="javascript:history.back()">
		
</body>
</html>