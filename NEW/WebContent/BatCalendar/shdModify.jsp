<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>일 정 수 정 하 기</h2>
<%-- <input type="hidden" name="userId" value="<%=userId%>"> --%>
<form action="shdmodifyProc.jsp" method="post" name="frm">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script>
  $( function() {
    $( "#datepicker" ).datepicker();
  } );
  </script>

<p>Date: <input type="text" id="datepicker" name="datepicker"></p>
메모 <input type="text" name="memo" 
		    value="<%=request.getParameter("memo") %>">
     <input type="hidden" name="NO" 
     		value="<%=request.getParameter("NO")%>">
     <input type="button" value="수정" onclick="su()">
     <input type="button" value="취소"
     		onclick="window.close()">
<script type="text/javascript">
function su(){
	if(confirm("수정하시겠습니까?")){
		document.frm.submit();
	 }else{
		 alert("수정 취소");
		 return false;
	 }
}
</script>

</form>
</body>
</html>