<%@ page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="hyeok.vo.boardVO"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<jsp:useBean id="bdao" class="hyeok.dao.boardDAO"/>

<%	
String referer= request.getHeader("referer");
	
String before = referer.substring(referer.lastIndexOf("/")+1);

System.out.println("보드프록시 : "+before);


 	/* System.out.println("페이지 : "+request.getParameter("page"));

 	int i = Integer.parseInt(request.getParameter("page")); */
 	
/*---------------------------------------------------------------*/

 	request.setAttribute("slist", bdao.getSelectboard(1));
 	/* request.setAttribute("count", bdao.countboard()); */
 	
	
%>

<jsp:forward page="/Batboard/BatGun.jsp"/>