<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<body>
<h2>회원 가입</h2>
<script>
$(function(){
   $("#userIdNew").keyup(function(){
	   $("#userIdNew").val($("#userIdNew").val().trim());
	   if($("#userIdNew").val().trim().length>10){
		   $("#CheckId").html("<span style='color:red'>아이디 길이 초과</span>");
	   }/* else if($("#userIdNew").val().length<0){
		   $("#CheckId").html("<span style='color:red'>아이디를 입력해주세요</span>");
	   } */else{
    	 $.ajax({
    		 url:"ckId.jsp",
    	   	   type:"get",
    	        data : {userId : $("#userIdNew").val().trim()},
    	         dataType:'text',
    	           success:function(result){
    	             if(result>0){
    	           	  /* $("#userIdNew").val(''); */
    	     			 $("#CheckId").html("<span style='color:red'>해당 아이디는 사용할 수 없습니다.</span>");
    	           	 }else{
    	     			 $("#CheckId").html("<span style='color:blue'>해당 아이디를 사용할 수 있습니다.</span>");
    	       		 }
    	           },
    	    	error: function(xhr, status, error) { // 댓글 데이터 저장 실패
 
    	    		 return ;  
    	    	}   
    	   });//ajax
	   }//else
	});//fu 
	
}); 
</script>
<form name="frm" action="/NEW/BatMember.do?flag=5" method="post">
<ul>
	<li>아이디 : 	<input type="text" name="userIdNew" id="userIdNew" value="${userId }" ></li>
	<span id="CheckId"></span>
	<li>비밀번호 : <input type="password" name="userPwNew" ></li>
	<li>이름 : <input type="text" name="userNmNew" ></li>
	<li>이메일 : <input type="text" name="emailNew" ></li>
	<li>성별 : <input type="radio" name="genderNew" value="M">남
			  <input type="radio" name="genderNew" value="F">여</li>
	<li>사진 : <input type="file" name="photoNew" ></li>
</ul>
<input type="submit" value="회원가입" >
</form>

<form action="/NEW/BatMember/login.jsp">
<input type="button" value="취소" onclick="history.back()">
</form>

</body>
</html>