<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>BAT LOGIN</title>
<style type="text/css">
html, body {
  border: 0;
  padding: 0;
  margin: 0;
  height: 100%;
}

body {
  background: tomato;
  display: flex;
  justify-content: center;
  align-items: center;
  font-size: 16px;
}

form {
  background: white;
  width: 40%;
  box-shadow: 0px 0px 20px rgba(0, 0, 0, 0.7);
  font-family: lato;
  position: relative;
  color: #333;
  border-radius: 10px;
}
form header {
  background: #FF3838;
  padding: 30px 20px;
  color: white;
  font-size: 1.2em;
  font-weight: 600;
  border-radius: 10px 10px 0 0;
}
form label {
  margin-left: 20px;
  display: inline-block;
  margin-top: 30px;
  margin-bottom: 5px;
  position: relative;
}
form label span {
  color: #FF3838;
  font-size: 2em;
  position: absolute;
  left: 2.3em;
  top: -10px;
}
form input {
  display: block;
  width: 78%;
  margin-left: 20px;
  padding: 5px 20px;
  font-size: 1em;
  border-radius: 3px;
  outline: none;
  border: 1px solid #ccc;
}
form .help {
  margin-left: 20px;
  font-size: 0.8em;
  color: #777;
}
#button {
  position: relative;
  margin-top: 30px;
  margin-bottom: 30px;
  left: 46%;
  transform: translate(-50%, 0);
  font-family: inherit;
  color: white;
  background: #FF3838;
  outline: none;
  border: none;
  padding: 5px 15px;
  font-size: 1.3em;
  font-weight: 400;
  border-radius: 3px;
  box-shadow: 0px 0px 10px rgba(51, 51, 51, 0.4);
  cursor: pointer;
  transition: all 0.15s ease-in-out;
}
form button:hover {
  background: #ff5252;
}
</style>
</head>
<body>
<c:if test="${not empty msg }">
<script>
	alert('${msg}');
</script>
</c:if>

<form action="hello.action" method="post">
  <header>B·A·T·L·O·G·I·N</header>
  <label>UserId <span>*</span></label>
  <input type="text" name="userId">
  
  <label>Password <span>*</span></label>
  <input type="password" name="userPw">
  <input type="submit" value="로그인" id="button">
  <input type="button" value="회원가입" onclick="location.href='/NEW/BatMember/New.jsp'" id="button">
</form>


</body>
</html>


<%session.removeAttribute("msg");%>





