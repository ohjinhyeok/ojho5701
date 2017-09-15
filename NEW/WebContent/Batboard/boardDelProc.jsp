<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="tdao" class="hyeok.dao.boardDAO"/>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%  int mid = Integer.parseInt(request.getParameter("mid"));
	System.out.print("딜리"+mid);
	boolean result = tdao.delboard(mid);
	if(result ){
		session.setAttribute("msg", "건의 삭제 성공");
	} else {
		session.setAttribute("msg", "건의 삭제 실패");
	}
%> 
<c:redirect url="/Batboard/boardProc.jsp?page=1"/>