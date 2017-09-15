<%@page import="oracle.net.aso.a"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<jsp:useBean id="tdao" class="hyeok.dao.ToDoDAO"/>
	
<%  
	String referer= request.getHeader("referer");
	String before = referer.substring(referer.lastIndexOf("/")+1);
	String bobobo = before.substring(0, 15);
	out.print(referer);

	System.out.println("1"+request.getParameter("todoNo"));
	switch(bobobo){
	
	case "BatListProc.jsp" : //수정 폼 출력
		System.out.println("2"+request.getParameter("todoNo"));
		int todoNo = Integer.parseInt(request.getParameter("todoNo"));
		System.out.println(todoNo);
		request.setAttribute("tvo", tdao.todoModToDo(todoNo));
		
%>
		<jsp:forward page="/BatList/BatModifyForm.jsp"/>
<%
		break;

	default  : //수정 처리
%>
		
		<jsp:useBean id="tvo" class="hyeok.vo.ToDoVO" scope="request">
			<jsp:setProperty name="tvo" property="*"/>
		</jsp:useBean>
<%
System.out.println("3");
System.out.println(tvo.getTodoNo()+"넘");
System.out.println(tvo.getTodo()+"메");
		boolean result = tdao.BtodoModToDo(tvo);
		if(result){
			session.setAttribute("msg", "댓글 수정 성공");
		} else {
			session.setAttribute("msg", "댓글 수정 실패");
		}
		
		response.sendRedirect("/NEW/BatList/BatListProc2.jsp?userId="+tvo.getUserId());
	break;
	}
%>		

