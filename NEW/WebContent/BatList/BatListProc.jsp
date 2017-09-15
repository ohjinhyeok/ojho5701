<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.*"%>
<%@page import="hyeok.vo.ToDoVO"%>
<%@page import="java.text.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<jsp:useBean id="tdao" class="hyeok.dao.ToDoDAO"/>

<%  
	
 	System.out.println("위에"+request.getAttribute("userId"));
	System.out.println("위에2"+request.getParameter("userId"));
	
	request.setAttribute("Membertvo", tdao.getOneMember(request.getParameter("userId")));
	System.out.println("아래"+request.getParameter("userId"));
	
	request.setAttribute("todolist", tdao.BatgetOneToDo());
	
%>
<jsp:forward page="/BatList/BatList.jsp"/>