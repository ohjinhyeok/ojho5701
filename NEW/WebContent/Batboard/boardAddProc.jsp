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
   
    int pmemoId = Integer.parseInt(request.getParameter("mid"));
	
	String userId = request.getParameter("userId");
    String subject = request.getParameter("re");
    
	bvo.setUserId(userId);
    bvo.setPmemoId(pmemoId);
	bvo.setSubject(subject);
	bdao.addboard(bvo);
	System.out.print(bvo.getPmemoId());

	
%>

<c:redirect url="/Batboard/boardProc2.jsp"/>


