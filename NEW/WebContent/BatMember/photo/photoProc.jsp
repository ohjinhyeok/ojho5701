<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="com.oreilly.servlet.MultipartRequest"
    import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"
    import="java.io.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
String uploadPath = getInitParameter("uploadPath");
String savePath = application.getRealPath(uploadPath);
int maxSize=5*1024*1024;
String encType="UTF-8";
MultipartRequest multi = new MultipartRequest(request, savePath, maxSize, encType, new DefaultFileRenamePolicy());
String fileName = multi.getFilesystemName("photoNew");
String fileId = multi.getParameter("userIdNew");
%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>