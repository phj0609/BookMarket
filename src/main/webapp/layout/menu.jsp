<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

	<fmt:setLocale value='<%= request.getParameter("language")%>'/>
	<fmt:setBundle basename="bundle.message"  var="msgBundle"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href ="${pageContext.request.contextPath}/resources/css/style.css">
<script src="./resources/js/validation.js"></script>
</head>
<body>

<nav class="navbar navbar-expand navbar-dark bg-dark">
	<div class="container">
		<div class="navbar-header">
			<a href="welcome.jsp" class="mx-2">Home</a>
			<a href="books.jsp" class="mx-2" id="booklist" name="booklist"><fmt:message key="booklist" bundle="${msgBundle}" /></a> 
			<a href="addBook.jsp" class="mx-2" id="bookregistration" name="bookregistration"><fmt:message key="bookregistration" bundle="${msgBundle}" /></a>
			<a href="login.jsp" id="login" name="login"><fmt:message key="login" bundle="${msgBundle}" /></a>
		</div>
	</div>
		<div class="text-right" >
			<a href="?language=ko">한국어</a>|<a href="?language=en">English</a>|<a href="logout.jsp" class="btn btn-sm btn-success pull-right">logout</a>
		</div>
</nav>