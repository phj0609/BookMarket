<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<%!
	String greeting = "온라인서점에 오신 것을 환영합니다.";
	String tagline = "Welcome to Book Market!";
%>
<%
	response.setIntHeader("Refresh",5);
	Date day = new Date();
	String am_pm;
	int hour = day.getHours();
	int minute = day.getMinutes();
	int second = day.getSeconds();
	if(hour/12 == 0) {
		am_pm = "AM";
	} else {
		am_pm = "PM";
		hour = hour - 12;
	}
	String CT = hour + ":" + minute + ":" + second + "" + am_pm;
%>
<%@ include file="/layout/menu.jsp" %>

<div class="jumbotron">
	<div class="container">
		<h1 class="display-3"><%= greeting %></h1>
	</div>
</div>
<div class="container">
	<div class="text-center">
		<h3><%= tagline %></h3>
		<p>현재 접속 시간 <%= CT %></p>
	</div>
</div>
<%@ include file="/layout/footer.jsp" %>

</body>
</html>