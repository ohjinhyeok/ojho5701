<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>일 정 추 가 하 기</h2>
<%-- <input type="hidden" name="userId" value="<%=userId%>"> --%>
<form action="scheduleProc.jsp" method="post" name="frm">
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script>
  $( function() {
    $( "#datepicker" ).datepicker();
      $( "#datepicker" ).datepicker("option", "dateFormat", "yy-mm-dd" );
   
  } );
  </script>
<p>Date: <input type="text" id="datepicker" name="datepicker"></p>
일정 내용 <input type="text" name="memo">
     <input type="button" value="확인" onclick="su()">
     <input type="button" value="취소"
     		onclick="window.close()">

 

<script type="text/javascript">

function su(){
	if(confirm("일정을 추가 하시겠습니까?")){
		document.frm.submit();
	 }else{
		 alert("일정 추가 취소");
		 return false;
	 }
}
</script>

</form>
</body>
</html>