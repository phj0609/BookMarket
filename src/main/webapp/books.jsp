<%@page import="dao.BookRepository"%>
<%@page import="dto.Book"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서 목록</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body> -->
<jsp:useBean id="bookDAO" class="dao.BookRepository" />
<%
	BookRepository dao = BookRepository.getInstance();
	request.setAttribute("list", bookDAO.getAllBooks());
	List<Book> listOfBooks = dao.getAllBooks();
%>
<%@ include file="/layout/menu.jsp" %>
<div class="jumbotron">
	<div class="container">
		<h1 class="display-3" id="booklist" name="booklist" ><fmt:message key="booklist" bundle="${msgBundle}" /></h1>
	</div>
</div>
<div class="container">
	<div class="row ">
	<% for(Book book : listOfBooks ) { %>
		<div class="col-md-12" style="display:flex; justify-content:space-around; border-bottom: 2px gray dashed; padding: 5px" >
			<div class="col-md-2">
				<img src="${pageContext.request.contextPath}/upload/<%=book.getFileName()%>" style="width:100%">
			</div> 
			<div class="col-md-10" >
				<h3><%= book.getName() %></h3>
				<div style="display:flex; justify-content:space-between;">
					<p class="col-md-10"style="padding-top: 15px;"><%= book.getDescription() %> </p>
					<span><a href="./product.jsp?id=<%=book.getBookId()%>"
					class="btn btn-secondary" role="button"> 상세 정보 &raquo;></a></span>
				</div> 
			<p><%= book.getAuthor() %>|<%= book.getPublisher() %>|<%= book.getUnitPrice() %>원</p>
		</div>
	</div>
		<hr size="2" style="border: 1px gray dashed;">
		<% }%>
	</div>
</div>

<%@ include file="/layout/footer.jsp" %>
</body>
</html>