<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="hyeok.vo.MemberVO"%>

<jsp:useBean id="mdao" class="hyeok.dao.MemberDAO"/>

<%
	String userId=request.getParameter("userId");
    int i = 0;
	List <MemberVO> mdaolist = mdao.getAllMember();
	for(MemberVO mvo : mdaolist){
		if(userId.equals(mvo.getUserId())){
			i++;
		}
	}
	out.print(i);
%>