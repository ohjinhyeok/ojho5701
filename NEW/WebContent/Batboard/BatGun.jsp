<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@   page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
<title>건의 게시판</title>
</head>


<style type="text/css">


/* 글 등록 버튼과 글 목록이 겹치지 않게 만들어준 아무것도 아닌것 */
#boardcss_list_add_button_table .boardcss_list_add_button ul { width: 100%; overflow: hidden; height: 10px;}

/* boardcss_list 에서 사용하는 글 목록 테이블 크기*/
.boardcss_list_table { width: 100%; }

/* 화면에 보여지는 글 목록 테이블 */
.list_table { width: 100%; }

/* 화면에 보여지는 caption */
.list_table caption { display: none; }

/* list_table 에서 사용되는 thead */
.list_table thead th { text-align: center; border-top: 1px solid #e5e5e5; border-bottom: 1px solid #e5e5e5; padding: 8px 0; background: #faf9fa; }

/* list_table 에서 사용되는 tbody */
.list_table tbody td { text-align: center;  border-bottom: 1px solid #e5e5e5; padding: 5px 0; }

/* boardcss_list 에서 사용되는 글 검색 테이블 크기 */
#boardcss_list_search { width: 100%; float: right;}

#boardcss_list_search ul{ float: right; width: 550px; display: inline; margin-right:-200px; }

#boardcss_list_search ul li { display: inline; font-weight: bold; }


#next_list{float:right; }


/* input 상자 모양 */
#search { width:200px; height:30px; text-align:center;  border: 1px solid #cfcfcf; vertical-align:middle; line-height:29px; }
#search2 { width:100px; height:30px; text-align:center;  border: 1px solid #cfcfcf; vertical-align:middle; line-height:29px; }

/* 검색 버튼 */
#boardcss_list_search ul li.search_button { cursor: pointer; width: 60px; text-align: center; border: 1px solid #bebebe; padding: 6px 0 6px; vertical-align:middle; font-weight: bold; margin-right:10px; /* background: #77b32f; */ }
#boardcss_list_search ul li.search_button a { color: #ffffff; }

/* 상세 검색버튼 */
#boardcss_list_search ul li.detail_button { cursor: pointer; width: 100px; text-align: center;  border: 1px solid #bebebe; padding: 6px 0 6px; vertical-align:middle; font-weight: bold; /* background: #77b32f; */ }
#boardcss_list_search ul li.detail_button a { color: #ffffff; }

/* 상세검색 테이블 */
.detailSearch { width: 100%; border-top: 1px solid #e5e5e5; }
.detailSearch .detailSearch_table { width: 100%; border-top: 0; border-bottom: 1px solid #e5e5e5; }

.detailSearch .detailSearch_table tbody td { padding: 5px 0; }
.detailSearch .detailSearch_table tbody td.detailSearch_td { vertical-align: middle; height: 30px; }

.detail_td { width: 100%; position: relative; height: 30px; }
.detail_td .detailSearch_button { cursor: pointer; width: 54px; position: absolute; border: 1px solid #bebebe;  padding: 6px 0 6px; text-align: center; font-weight: bold; right: 44px; display: block; /* background: #77b32f; */ }
.detail_td .detailSearch_button a { color: #ffffff; }

/* 상세검색 닫기 */
.closeButton_table { width: 100%; text-align: right; }
.closeButton { width: 85px; text-align: center; display: inline-block; border: 1px solid #bebebe; padding: 6px 0 6px; cursor: pointer; font-weight: bold; }
a{
	text-decoration: none;
	}
</style>

<body link="black" alink="black" vlink="black">
<%@ include file="../BatMember/LoginInfo.jsp" %>
<h2>건의 게시판</h2>
<hr>

<!-- 테이블 시작 -->
<div class="boardcss_list_table">
<form action="" name="frm">
	<table class="list_table">
		<caption>건의 게시판</caption>
		<colgroup>
			<col width="15%" />
			<col width="35%" />
			<col width="20%" />
			<col width="20%" />
			<col width="20%" />
		</colgroup>
		<thead>
		
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>아이디</th>
				<th>등록일자</th>
				<th>-</th>
			</tr>
		</thead>
	<tbody id="tbobo">
		<c:choose>
	<c:when test="${empty slist }">
		<tr>
			<td colspan=5>등록된 내용이 없습니다</td>
		</tr>
	</c:when>
	<c:otherwise>
		<c:forEach items="${slist }" var="j" varStatus="t">
		
		<c:set var="userII" value="${fn:split(j.userId, ':')}" />
			<tr>
				<td>${j.rnum }</td>
	
	<c:choose>
	<c:when test="${userId.trim() == userII[fn:length(userII)-1].trim() || userId == 'admin'}">
		<td><a href="#" onclick="gul(${j.subject})">${j.userId } 님의 건의 글.</a></td>
	</c:when>
	<c:otherwise>
		<td><a href="#" onclick="chi()">${j.userId } 님의 건의 글.</a></td>
	</c:otherwise>
	</c:choose>
				
				<td>${userII[fn:length(userII)-1].trim()}</td>
 				<td><fmt:formatDate value="${j.regDate }" pattern="yyyy-MM-dd" /></td>
 				<td>
 					<c:if test="${j.pmemoId==0 && userId == 'admin' }"><a href="#" onclick="view()"><i class="fa fa-plus-square-o"></i></a></c:if>
 					<c:if test="${j.pmemoId!=0 }"></c:if>
 					<c:if test="${userId.trim() == userII[fn:length(userII)-1].trim() || userId.trim() =='admin'}">
 					<a href="#" onclick="modi(${j.mid})"><i class="fa fa-check-square-o"></i></a> 
					<a href="#" onclick="del(${j.mid})"><i class="fa fa-minus-square-o"></i></a>
					</c:if>
				</td>
				<td>
				<div id="hire" style="display: none;"><input type="text" name="re">　<a href="#" onclick="cyu(${j.mid})">
				<i class="fa fa-hand-o-left"></i></a></div>
				</td>
			</tr>
		</c:forEach>
	</c:otherwise>
</c:choose>
		</tbody>
	</table>
	<input type="hidden" name="subject" value="">
	<input type="hidden" name="userId" value="${userId}">
	<input type="hidden" name="mid" value="">
	
	</form>
<script type="text/javascript">

function cli(){
	document.frm.action="/Batboard/boardProc.jsp";
	document.frm.submit();
}
function modi(we){
	 document.frm.mid.value=we;
	 document.frm.action="/NEW/Batboard/boardModProc.jsp";
	 document.frm.submit();
	 
}
function del(we){
	if(confirm("삭제하시겠습니까?")){
		document.frm.mid.value=we;
		document.frm.action="/NEW/Batboard/boardDelProc.jsp";
		document.frm.submit();
	}else{
		alert("삭제 취소");
		return false;
	}
}
function view(){
	var i = document.getElementById("hire");
	i.style.display="inline";
}
function chi(){
	alert("열람 불가");
}
function cyu(we){
	if(confirm("댓글을 추가하시겠습니까?")){
		
		document.frm.mid.value=we;
		document.frm.action="/NEW/Batboard/boardAddProc.jsp";
		document.frm.submit();
	}else{
		alert("댓글 취소");
		return false;
	}
}

function gul(sub){
	var my_tbody = document.getElementById('tbobo');
    var row = my_tbody.insertRow( my_tbody.rows.length );
    var cell1 = row.insertCell(0);
    var cell2 = row.insertCell(1);
    var cell3 = row.insertCell(2);
    var cell4 = row.insertCell(3);
    var cell5 = row.insertCell(4);
    cell1.innerHTML = '내용';
    cell2.innerHTML = sub;
    cell2.innerHTML = sub;
}
</script>

</div>
<!-- 테이블 종료 -->

<!-- 검색 테이블 시작 -->
<div id="boardcss_list_search" style="display:block;">
	<ul>
		<!--< li>제목</li>
		<li><input id="search" type="text" name="search_subject" value="" style="IME-MODE:active;" /></li>
		<li class="search_button"> 검색 </li> -->
		<li class="search_button" onclick="ve()">건의 등록 </li>
		<li class="search_button" onclick="location.replace('/NEW/BatList/BatListProc.jsp?userId=${userId}')">돌아가기</li>
	</ul>
</div>
<p>
<div id="nit" style="display: none;">
	<h3>건의 등록</h3>
		<form action="/NEW/Batboard/boardAddProc2.jsp" method="post">
			건의 내용 : <input type="text" name="subject" value="" size="30">
			<input type="hidden" name="userId" value="${userId}"> 
			<input type="submit" value="제출">
		</form>
</div>
</p>
<script type="text/javascript">
 function ve(){
	 var t = document.getElementById("nit");
	 t.style.display="inline";
 }
</script>
<div id="next_list" >
<i class="fa fa-caret-square-o-left"></i> <i class="fa fa-caret-square-o-right"></i>
</div>
<!-- 검색 테이블 종료 -->



</body>
</html>