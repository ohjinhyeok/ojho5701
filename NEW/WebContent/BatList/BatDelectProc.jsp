<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<jsp:useBean id="tdao" class="hyeok.dao.ToDoDAO"/>

<%  System.out.println("딜리트프록시");
	int todoNo = Integer.parseInt(request.getParameter("todoNo"));
	System.out.println("딜리트 "+ request.getParameter("userId"));
	System.out.println("딜리트 : "+todoNo);
	boolean result = tdao.BatdelToDo(todoNo);
	if(result ){
		session.setAttribute("msg", "댓글 삭제 성공");
	} else {
		session.setAttribute("msg", "댓글 삭제 실패");
	}
%> 
<c:redirect url="/BatList/BatListProc2.jsp">
	<c:param name="userId" value="${userId }"/>
</c:redirect>

