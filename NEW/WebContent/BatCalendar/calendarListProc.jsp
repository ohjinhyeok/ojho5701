<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.*"%>
<%@page import="hyeok.vo.CalVO"%>
<%@page import="java.text.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:useBean id="cdao" class="hyeok.dao.CalendarDAO"/>

<%  
	String userId = "T_"+request.getParameter("userId").toUpperCase();
	request.setAttribute("calList", cdao.getAllCal(userId));
	
	
%>
<jsp:forward page="/BatCalendar/calendar.jsp"/>