<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<jsp:useBean id="tvo" scope="request" class="hyeok.vo.ToDoVO" >
	<jsp:setProperty property="*" name="tvo"/>
</jsp:useBean>
<jsp:useBean id="tdao" class="hyeok.dao.ToDoDAO"/>

 <%
 
	boolean result = tdao.BatAddToDo(tvo); 

	if(result == true){
		if(result ){
		session.setAttribute("msg", "투표 추가 성공");
		} else {
			session.setAttribute("msg", "투표 추가 실패");
		}
	}
	
	tdao.BatModToDo(tvo);
	
%>


<c:redirect url="/BatList/BatListProc2.jsp"/>


