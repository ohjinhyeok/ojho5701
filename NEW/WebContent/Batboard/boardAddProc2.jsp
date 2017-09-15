<%@page import="hyeok.vo.boardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:useBean id="bvo" scope="request" class="hyeok.vo.boardVO" >
	<jsp:setProperty property="*" name="bvo" />
</jsp:useBean>
<jsp:useBean id="bdao" class="hyeok.dao.boardDAO"/>

<% 
   
	String userId = request.getParameter("userId");
    String subject = request.getParameter("subject");
    System.out.print("제출 "+userId);
    System.out.print("제출 "+subject);
	bvo.setUserId(userId);
	bvo.setSubject(subject);
	bdao.baddboard(bvo);

	
%>

<c:redirect url="/Batboard/boardProc2.jsp"/>


