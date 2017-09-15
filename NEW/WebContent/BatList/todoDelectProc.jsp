<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:useBean id="tdao" class="hyeok.dao.ToDoDAO"/>

<%  int todoNo = Integer.parseInt(request.getParameter("todoNo"));
	boolean result = tdao.delToDo(todoNo);
	if(result ){
		session.setAttribute("msg", "일정 삭제 성공");
	} else {
		session.setAttribute("msg", "일정 삭제 실패");
	}
%> 
<c:redirect url="/BatList/todoListProc.jsp"/>
