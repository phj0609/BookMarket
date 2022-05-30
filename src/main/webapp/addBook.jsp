<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/layout/menu.jsp" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%-- 	<fmt:setLocale value='<%= request.getParameter("language")%>'/>
	<fmt:setBundle basename="bundle.message"  var="msgBundle"/> --%>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3"><fmt:message key="title" bundle="${msgBundle}" /></h1>
		</div>
	</div>
	<div class="container">
		
	
		<form name="newBook" action="./processAddBook.jsp" class="form-horizontal" method="post" enctype="multipart/form-data">
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key="bookId" bundle="${msgBundle}" /></label>
				<div class="col-sm-3">
					<input type="text" id="bookId" name="bookId" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key="name" bundle="${msgBundle}" /></label>
				<div class="col-sm-3">
					<input type="text" id="name" name="name" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key="unitPrice" bundle="${msgBundle}" /></label>
				<div class="col-sm-3">
					<input type="text" id="unitPrice" name="unitPrice" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key="author" bundle="${msgBundle}" /></label>
				<div class="col-sm-3">
					<input type="text" id="author" name="author" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key="publisher" bundle="${msgBundle}" /></label>
				<div class="col-sm-3">
					<input type="text" id="publisher" name="publisher" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key="releaseDate" bundle="${msgBundle}" /></label>
				<div class="col-sm-3">
					<input type="text" id="releaseDate" name="releaseDate" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key="totalPages" bundle="${msgBundle}" /></label>
				<div class="col-sm-3">
					<input type="text" id="totalPages" name="totalPages" class="form-control">
				</div> 
			</div>
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key="description" bundle="${msgBundle}" /></label>
				<div class="col-sm-5">
					<textarea name="description" cols="50" row="2" class="form-control" placeholder="100자 이상 적어주세요"></textarea>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key="category" bundle="${msgBundle}" /></label>
				<div class="col-sm-3">
					<input type="text" name="category" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key="unitsInStock" bundle="${msgBundle}" /></label>
				<div class="col-sm-3">
					<input type="text" id="unitsInStock" name="unitsInStock" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key="condition" bundle="${msgBundle}" /></label>
				<div class="col-sm-5">
					<input type="radio" name="condition" value="New">
					신규 도서
					<input type="radio" name="condition" value="Old">
					중고 도서
					<input type="radio" name="condition" value="E-Book">
					E-Book
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key="bookImage" bundle="${msgBundle}" /></label>
				<div class="col-sm-5">
					<input type="file" name="productImage" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<div class="col-sm-offset-2 col-sm-10">
					<input type="button" class="btn btn-primary" value="등록" onclick="CheckAddBook()">
				</div>
			</div>
		</form>
	</div>
</body>
</html>