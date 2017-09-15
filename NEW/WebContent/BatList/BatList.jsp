<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@   page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
@import url(https://fonts.googleapis.com/css?family=Fjalla+One);
body {
  background-color: rgba(255, 152, 142, 0.25);
  -webkit-font-smoothing:subpixel-antialiased;
  -webkit-user-select: none;
  -moz-user-select: none;
  -ms-user-select: none;
  user-select: none; 
}
#pollTitle {
	font-family: 'Fjalla One', Helvetica, Arial, sans-serif;
	font-size: 60px;
  color: #e74c3a;
	margin: 30px auto 5px;
	text-align: center;
	line-height: 1em;
	width: 100%;
}
#pollContainer {
  width:584px; height:425px;
  margin:30px auto; padding:5px; border-radius:3px;
  text-align:center;
  box-shadow:0 0 20px rgba(0,0,0,0.3);
  font-family:calibri;
  position:relative; z-index:0;
  }


#pollSection {
  position:absolute; left:5px; top:5px; z-index:2;
  width:584px; height:425px;
}
#pollButtons {
  margin:0; padding:0;
}
.pollRadio {
  display:none;
}
.pollButton1 {
  display:inline-block;
  background-color:rgba(0,0,0,0);
  border:1px solid #1abc9c;
  box-sizing:border-box;
  margin:5px; padding:10px 0;
  font-size:17px; color:#179d82; font-family:calibri;
  width:280px;
  height:350px;
  text-align:center;
  border-radius:5px;
	cursor:pointer;
	text-shadow:0 -1px 0 rgba(0,0,0,0.15);
	text-transform:uppercase;
  transition:all 0.4s ease;
  background-image: url('/NEW/BatList/photo/chicken.jpg');
}
.pollButton2 {
  display:inline-block;
  background-color:rgba(0,0,0,0);
  border:1px solid #1abc9c;
  box-sizing:border-box;
  margin:5px; padding:10px 0;
  font-size:17px; color:#179d82; font-family:calibri;
  width:280px;
  height:350px;
  text-align:center;
  border-radius:5px;
	cursor:pointer;
	text-shadow:0 -1px 0 rgba(0,0,0,0.15);
	text-transform:uppercase;
  transition:all 0.4s ease;
  background-image: url('/NEW/BatList/photo/pizza.jpg');
}
.pollButton:hover {
  background-color:rgba(72,201,176,0.4);
  color:#fff;
}
.pollRadio:checked + label {
  background-color:#48c9b0;
  border:5px solid yellow;
  color:#fff;
}
.pollLogochicken{
  float:left;
    width:278px; height:348px;
  margin-top:auto;
  margin-bottom:auto;
  margin-left: auto;
  margin-right: auto;

 
}
.pollLogopizza{
  float:left;
   width:279px; height:349px;
  margin-left: auto;
  margin-right: auto;
  
 
}
.menu {
  background-position:0 0;
  
}
.menu {
  background-position:0 0;
}

#pollVote {
  width:300px;
  margin:5px; padding:10px 0px;
  font-size:17px; font-weight:400; line-height:1.4;
  display:inline-block;
  border-radius:5px;
  border:none;
  color:#10659e;
  border:1px solid #10659e;
  cursor:pointer;
  transition:background-color .4s linear;
}
#pollVote:hover {
  background-color:#10659e;
  color:#fff;
}

#resultSection {
  position:absolute; left:5px; top:5px;
  width:584px; height:425px;
  z-index:1;
}
#resultBars {
  width:100%; height:100%;
}
#dat{
text-align:center;
margin-left: auto;
margin-right: auto;
}
#suji{
font-size: 70px;
margin-top: auto;
margin-bottom: auto;
}
#ketka{
height:400px;
margin-top: auto;
margin-bottom: auto;
}

</style>
</head>
<body>
<%@ include file="/BatMember/LoginInfo.jsp" %>

<form name="frm2" action="" method="post" >
  <div id="pollTitle">배틀 게시판</div>
 	 <div id="pollContainer" >
 	 <c:choose>
  		<c:when test="${not empty BatList}">
  		<div id="ketka">
 				  <%int i=0; int j=0; %>
     			  <c:forEach items="${BatList }" var="i" varStatus="t">
						<c:if test="${i.menu=='c'}"><%i++;%></c:if>
						<c:if test="${i.menu=='p'}"><%j++;%></c:if>
				  </c:forEach>
		<%	int peri; 
			int perj; 
			int hit; 
			int total;
			peri=Math.round((float)i/(i+j)*100);
			perj=Math.round((float)j/(i+j)*100); %>
			
			<img src="../BatList/photo/1.gif" height="<%=peri+100%>" width="20" border="0" ><span id="suji"><%=peri %>%</span>
			<img src="../BatList/photo/2.gif" height="<%=perj+100%>" width="20" border="0"><span id="suji"><%=perj %>%</span> 
		</div>
		</c:when>
	<c:otherwise>	
   <div id="pollSection" >
     <div id="pollButtons">
       
       <input type="radio" class="pollRadio" name="menu" id="chicken" value="c" />
       <label class="pollButton1" for="chicken">
         <span class="pollLogochicken"></span>
         <span class="result"></span>
       </label>
     
       <input type="radio" class="pollRadio" name="menu" id="pizza" value="p"/>
       <label class="pollButton2" for="pizza" >
         <span class="pollLogopizza"></span>
         <span class="result"></span>
       </label>
     </div> 
 	<%session.setAttribute("TOHYO", "${Membertvo.TOHYO}");%>
        <input type="submit" id="pollVote" value="투표" onclick="tu('${Membertvo.TOHYO }')">

   </div>
	</c:otherwise>	
	</c:choose>
   </div>
   <input type="hidden" name="userId" value="${userId}">
  </form>
  
  
<script type="text/javascript">
function tu(data){
	if((document.getElementById("chicken").checked==true||document.getElementById("pizza").checked==true)&&data!=1){
			if(confirm("투표하시겠습니까?")){
				document.frm2.action="/NEW/BatList/BatAddProc.jsp";
				document.frm2.submit();
			}else{ 
				alert("투표 취소");
				return false;	
		}
	}else if(document.getElementById("chicken").checked==true||document.getElementById("pizza").checked==true&&data==1){
				alert("중복 투표 불가");
				return false;
	}else if(document.getElementById("chicken").checked!=true&&document.getElementById("pizza").checked!=true){
		alert("메뉴를 선택해주세요");
		return false;
	}
	
}

</script> 
 
<form name="frm"  method="post" id="dat" >
<h2>배틀 댓글</h2>
<div style="color:red">${msg }</div>
<hr>
<table>
<c:choose>
	<c:when test="${empty todolist }">
	<tr><td colspan=3>
			- 등록된 댓글이 없습니다.</td></tr>
	</c:when>
	<c:otherwise>
	<c:forEach items="${todolist }" var="i" varStatus="t">
	<tr>
		<td>${i.userId }</td><td>${i.todo}</td><td><fmt:formatDate value="${i.regDate}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
 		<td>
 			<c:if test="${userId==i.userId || userId=='admin' }">
 				<a href="#" onclick="mod(${i.todoNo})"><i class="fa fa-check-square-o"></i></a> 
				<a href="#" onclick="del(${i.todoNo})"><i class="fa fa-minus-square-o"></i></a>
			</c:if>
		</td>
	</tr>
	</c:forEach>
	</c:otherwise>
</c:choose>
</table>
<input type="hidden" name="todoNo" value="">
<input type="hidden" name="userId" value="${userId}">
</form>
<script type="text/javascript">
	 function del(data){
		if(confirm("삭제하시겠습니까?")){
			 document.frm.todoNo.value = data;
			 document.frm.action="/NEW/BatList/BatDelectProc.jsp"
			 document.frm.submit();
		}else{
			alert("삭제 취소");
			return false;
	 	}
	} 
	
	function mod(data){
		if(confirm("수정하시겠습니까?")){
			document.frm.todoNo.value = data;
			document.frm.action="/NEW/BatList/BatModifyProc.jsp";
			document.frm.submit();
		}else{
			alert("수정 취소");
			return false;
	 	}
	} 
</script>
<hr>
<div >	
		<form action="/NEW/BatList/BatAddProc2.jsp" method="post">
			댓글 : <input type="text" name="todo" size="100"> 
				  <input type="hidden" name="userId" value="${userId}">
				  <input type="hidden" name="gender" value="${Membertvo.gender}">
				  <input type="submit" value="등록">
		</form>
</div>
<hr>

<input type="button" value="메인 돌아가기" onclick="location.replace('/NEW/BatMember/main.jsp')">
<input type="button" value="건의 게시판" onclick="location.replace('/NEW/Batboard/boardProc.jsp?userId=<%=userId%>')">
				                              



<% session.removeAttribute("msg"); %>
</body>
</html>