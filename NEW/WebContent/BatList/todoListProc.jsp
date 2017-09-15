<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.*"%>
<%@page import="hyeok.vo.ToDoVO"%>
<%@page import="java.text.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% response.setContentType("text/html;charset=UTF-8");
	request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="tdao" class="hyeok.dao.ToDoDAO"/>

<% 
	HashMap <String, String> map = new HashMap();

	Calendar cal = Calendar.getInstance();
	
	map.put("year", cal.get(Calendar.YEAR)+"");
	map.put("month", cal.getDisplayName(Calendar.MONTH, Calendar.LONG, Locale.US).toLowerCase()+"");
	map.put("day", String.format("%02d", cal.get(Calendar.DAY_OF_MONTH))+"");
	map.put("week", cal.getDisplayName(Calendar.DAY_OF_WEEK, Calendar.LONG ,Locale.JAPAN)+"");
	
	request.setAttribute("map", map);
	
	request.setAttribute("list", tdao.getOneToDo());
	
%>

<jsp:forward page="/BatList/todoList.jsp"/>




