
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.sql.*, javax.sql.*, javax.naming.*, java.util.*"
    import="hyeok.dao.DbConnect"
    import="hyeok.vo.MemberVO"
    import="java.util.Date"
    import="java.text.*"
	import="java.text.SimpleDateFormat"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
body {
	background: #ccc;
	font: 87.5%/1.5em 'Lato', sans-serif;
	margin: 0;
}

table {
	border-collapse: collapse;
	border-spacing: 0;
}

td {
	padding: 0;
}

.container {
  left: 50%;
  position: fixed;
  top: 50%;
  transform: translate(-50%, -50%);
}

.calendar-container {
	position: relative;
	width: 457px;
	
}

.calendar-container header {
	border-radius: 1em 1em 0 0;
	background: #e66b6b;
	color: #fff;
	padding: 3em 2em;
}

.day {
	font-size: 8em;
	font-weight: 900;
	line-height: 1em;
	
}

.month {
	font-size: 4em;
	line-height: 1em;
	text-transform: lowercase;
	
}

.ulc{
	font-size: small;
	float: right;
}




.calendar {
	background: #fff;
	border-radius: 0 0 1em 1em;
	-webkit-box-shadow: 0 2px 1px rgba(0, 0, 0, .2), 0 3px 1px #fff;
	box-shadow: 0 2px 1px rgba(0, 0, 0, .2), 0 3px 1px #fff;
	color: #555;
	display: inline-block;
	padding: 2em;
}

.calendar thead {
	color: #e66b6b;
	font-weight: 700;
	text-transform: uppercase;
}

.calendar td {
	padding: .5em 1em;
	text-align: center;
}

.calendar tbody td:hover {
	background: #cacaca;
	color: #fff;
	
}

.current-day {
	color: #e66b6b;
}

.prev-month,
.next-month {
	color: #cacaca;
}

.ring-left,
.ring-right {
	position: absolute;
	top: 245px;
}

.ring-left { left: 2em; }
.ring-right { right: 2em; }

.ring-left:before,
.ring-left:after,
.ring-right:before,
.ring-right:after {
	background: #fff;
	border-radius: 4px;
	-webkit-box-shadow: 0 3px 1px rgba(0, 0, 0, .3), 0 -1px 1px rgba(0, 0, 0, .2);
	box-shadow: 0 3px 1px rgba(0, 0, 0, .3), 0 -1px 1px rgba(0, 0, 0, .2);
	content: "";
	display: inline-block;
	margin: 8px;
	height: 32px;
	width: 8px;
}

.ctbtd{
	width: 400px;
	border-top: 3px dashed gray;
	position: fixed;
 	margin-bottom: 30px;
 	display: inline-block;
} 
.L{
	float: left;
	width: 170px;
	margin-top:5px;
	
	text-align: center;
	
}
.M{
	float: left;
	width: 85px;
	margin-top:5px;
	
	text-align: center;
}

.R{
	float: left;
	width:  125px;
	margin-top:10px;
	
	text-align: center;
	
}
</style>

</head>

<body onload="cal()">
<%@ include file="../BatMember/LoginInfo.jsp" %>
<% response.setContentType("text/html;charset=UTF-8");
	request.setCharacterEncoding("UTF-8"); %>
<%
	TimeZone timeZone = TimeZone.getTimeZone("Asia/Seoul");

	DateFormat dateFormat = new SimpleDateFormat("YYYY-MMMM-dd (EEEE) HH:mm:ss (z Z)");
	
	dateFormat.setTimeZone(timeZone);
	 
	Date date = new Date();
	
	DateFormat dF = new SimpleDateFormat("YYYY-MM-dd");
	
	DateFormat dFf = new SimpleDateFormat("d");
	
	dF.format(date);
	
	Calendar calendar = Calendar.getInstance();
	 
    calendar.setTimeZone(timeZone);
    
    int year = calendar.get(Calendar.YEAR);
    int month = calendar.get(Calendar.MONTH);      
    int day = calendar.get(Calendar.DAY_OF_MONTH);
    int week = calendar.get(Calendar.DAY_OF_WEEK);  
    int hour = calendar.get(Calendar.HOUR_OF_DAY);  
    int minute = calendar.get(Calendar.MINUTE);
    int second = calendar.get(Calendar.SECOND);
    
    
    DateFormatSymbols dateFormatSymbolss = DateFormatSymbols.getInstance(Locale.KOREA);


	String[] week_strings = dateFormatSymbolss.getWeekdays();   
    String week_string = week_strings[week];

%>
<script>

    var today = new Date(); 
    var date = new Date();
 	
    function izen() {
        today = new Date(today.getFullYear(), today.getMonth() - 1, today
                .getDate());
        cal();
    }
    function tsugi() {
        today = new Date(today.getFullYear(), today.getMonth() + 1, today
                .getDate());
        cal();
    }
   function cal(){
        var startDate = new Date(today.getFullYear(), today.getMonth(), 1); 
        var lastDate = new Date(today.getFullYear(), today.getMonth() + 1, 0); 
        var Calendar = document.getElementById("calendar"); 
        
        
        // 기존 테이블에 뿌려진 줄, 칸 삭제
        while (Calendar.rows.length > 2) {
            Calendar.deleteRow(Calendar.rows.length - 1);
        }
        
        var row = null;
        row = Calendar.insertRow();
        var cnt = 0;
 
        // 1일이 시작되는 칸을 맞추어 줌
        for (i = 0; i < startDate.getDay(); i++) {
            cell = row.insertCell();
            cnt = cnt + 1;
        }
        
        document.getElementById("year").innerHTML=today.getFullYear();
        
        switch (today.getMonth()+1){
        
        case 1:
        	document.getElementById("month").innerHTML="January";
        	break;
        case 2:
        	document.getElementById("month").innerHTML="Febuary";
        	break;
        case 3:
        	document.getElementById("month").innerHTML="March";
        	break;
        case 4:
        	document.getElementById("month").innerHTML="April";
        	break;
        case 5:
        	document.getElementById("month").innerHTML="May";
        	break;
        case 6:
        	document.getElementById("month").innerHTML="June";
        	break;
        case 7:
        	document.getElementById("month").innerHTML="July";
        	break;
        case 8:
        	document.getElementById("month").innerHTML="August";
        	break;
        case 9:
        	document.getElementById("month").innerHTML="September";
        	break;
        case 10:
        	document.getElementById("month").innerHTML="October";
        	break;
        case 11:
        	document.getElementById("month").innerHTML="November";
        	break;
        case 12:
        	document.getElementById("month").innerHTML="December";
        	break;
        }
        
       
        for (i = 1; i <= lastDate.getDate(); i++) { // 1일부터 마지막 일까지
            td = row.insertCell() ;	
            td.innerHTML = "<font color='black' onclick='co("+i+")' id='dayday' name='dayday' value='dsds'>" + i;
            cnt = cnt + 1;
            if (cnt % 7 == 1) {//일요일 계산
                td.innerHTML = "<font color='red' onclick='co("+i+")' id='dayday'>" + i//일요일에 색
            }
            if (cnt % 7 == 0) { // 1주일이 7일 이므로 토요일 계산
                td.innerHTML = "<font color='blue' onclick='co("+i+")' id='dayday'>" + i//토요일에 색
                row = calendar.insertRow();// 줄 추가
            }
            if (today.getFullYear() == date.getFullYear()
                    && today.getMonth() == date.getMonth()
                    && i == date.getDate()) {
            	document.getElementById("day").innerHTML=i;
                td.bgColor= "pink";
            }
        }
 		
    }
   function co(i){
		 location.replace("/NEW/BatCalendar/calendarProc.jsp?userId=<%=userId%>&day="+i);
		
	}
</script>


<h2>${sessionScope.userId }님의 스케줄</h2>
<p><input type="button" value="메인 돌아가기" onclick="location.replace('/NEW/BatMember/main.jsp')"></p>
<div class="container">

  <div class="calendar-container">

    <header>
    <ul class="ulc" id="idulc">
<% 	
		Connection con = null;
		ResultSet rs = null;
		PreparedStatement stmt = null;
		Statement st = null;
		InitialContext ctx = new InitialContext();
		DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/oracle");
		con = ds.getConnection();

		st = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,
								  ResultSet.CONCUR_UPDATABLE);
		
		rs = st.executeQuery("select * from T_"+userId.toUpperCase()+" ORDER BY REG_DATE");
		
		rs.previous();
		String ooo = (String)request.getAttribute("ddd");
		boolean result = false ;
		/* 
		if(request.getAttribute("today")!=null){
			out.print(request.getAttribute("memo"));
			out.print(request.getAttribute("regDate"));
		}else{ */
		while(rs.next()){
				 
			 		int NO = rs.getInt("NO");
			 		String memo = rs.getString("MEMO");
					Date regDate = rs.getDate("REG_DATE");
			
			if(dF.format(regDate).equals(dF.format(date))){%>
				<% result=true;%>
				 <li><%=memo %> / <%=regDate %> <a href="#" onclick="window.open('shdModify.jsp?NO=<%=NO%>&memo=<%=memo%>',
				                                 '_blank',
				                                 'width=500, height=250')"><i class="fa fa-check-square-o"></i></a> 
				 							    <a href="#" onclick="del()"><i class="fa fa-minus-square-o"></i></a>												
				</li>
		<script type="text/javascript">
			function del(){
				if(confirm("삭제하시겠습니까?")){
		 			location.replace("/NEW/Calendar/shdDeleteProc.jsp?NO=<%=NO%>");
				 }else{
					 alert("삭제 취소");
				 return false;
	 			}
			}
		</script>
			 
			<% 
			}
		}
			
		/* } */if(result==false){%>
				<p>등록된  일정이 없습니다.</p>
	<%}
	DbConnect.close(rs,stmt,con);%>
	
</ul>

      <div class="day" id="day"></div>
      <div class="month" id="month"></div>
    	<br>
				<div class="ctbtd">
				<div class="L" id="year"></div>
				<div class="M"><%=week_string%></div>
				<div class="R">
				<a href="#" onclick="window.open('schedule.jsp',
				                                 '_blank',
				                                 'width=500, height=250')">
				                                 <i class="fa fa-plus-square-o"></i></a></div></div>
			
    </header>
    

  <table class="calendar" id="calendar">
      
      <thead>

        <tr>
			
          <td id="d" onclick="dd()">Mon</td>
          <td>Tue</td>
          <td>Wed</td>
          <td>Thu</td>
          <td>Fri</td>
          <td>Sat</td>
          <td>Sun</td>

        </tr>

      </thead>

        <tbody>

        <tr>
   
        </tr>


      </tbody> 
 
    </table>

    <label class="ring-left" onclick="izen()">  ◁  </label>
    <label class="ring-right" onclick="tsugi()">  ▷  </label>

  </div> <!-- end calendar-container -->

</div> <!-- end container -->

</body>
</html>