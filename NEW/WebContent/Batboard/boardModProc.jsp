<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="bdao" class="hyeok.dao.boardDAO"/>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%  
	String referer= request.getHeader("referer");
	String before = referer.substring(referer.lastIndexOf("/"));
	String be = before.substring(1,14);
/* --------------------------------------주소처리 */

	int mid = Integer.parseInt(request.getParameter("mid"));
	
	System.out.println("1 : " + mid);
	
	switch(be){
	
	case "boardProc.jsp" : //수정 폼 출력
		  
		System.out.println("2 : " + mid);
		
		request.setAttribute("bvo", bdao.getModboard(mid));
		System.out.println("5 : " + bdao.getModboard(mid).getMid());
%>		
		<jsp:forward page="/Batboard/boardModFormProc.jsp"/>
<% 
		break;

	default  : //수정 처리
%>
		<jsp:useBean id="bvo" class="hyeok.vo.boardVO" scope="request">
			<jsp:setProperty name="bvo" property="*"/>
		</jsp:useBean>
<% 		
		boolean result = bdao.modboard(bvo);
		if(result){
			session.setAttribute("msg", "일정 수정 성공");
		} else {
			session.setAttribute("msg", "일정 수정 실패");
		}
		
		
		response.sendRedirect("/NEW/Batboard/boardProc.jsp?page="+1+"");
		break;
	} 
	
%> 
