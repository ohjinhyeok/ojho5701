<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:useBean id="tdao" class="hyeok.dao.ToDoDAO"/>
	
<%  
	String referer= request.getHeader("referer");
	String before = referer.substring(referer.lastIndexOf("/")+1);
	
	out.print(referer);
	out.print(before);
	
	switch(before){
	
	case "todoListProc.jsp" : //수정 폼 출력
		int todoNo = Integer.parseInt(request.getParameter("todoNo"));
		request.setAttribute("tvo", tdao.getModToDo(todoNo));
%>
		<jsp:forward page="/BatList/todoModifyForm.jsp"/>
<% 
		break;

	default  : //수정 처리
%>
		<jsp:useBean id="tvo" class="hyeok.vo.ToDoVO" scope="request">
			<jsp:setProperty name="tvo" property="*"/>
		</jsp:useBean>
		
<% 
		boolean result = tdao.modToDo(tvo);
		if(result){
			session.setAttribute("msg", "일정 수정 성공");
		} else {
			session.setAttribute("msg", "일정 수정 실패");
		}
		response.sendRedirect("/BatList/todoListProc.jsp");
		break;
	}
	
	
%> 

