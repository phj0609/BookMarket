<%@page import="dao.BookRepository"%>
<%@page import="dto.Book"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page errorPage="exceptionNoBookId.jsp" %>
<title>도서 상세 정보</title>
<script type="text/javascript">
	function addToCart() {
		if(confirm("상품을 장바구니에 추가하시겠습니까?")) {
			document.addForm.submit();
		} else {
			document.addForm.reset();
		}
	}
</script>
</head>
<body>
	<%@ include file="/layout/menu.jsp" %>
	<jsp:useBean id="bookDAO" class="dao.BookRepository" scope="session"/>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">도서 정보</h1>
		</div>
	</div>
	<%
		String id = request.getParameter("id");
		BookRepository dao = BookRepository.getInstance();
		Book book = dao.getBookById(id);
	%>
	<div class="container">
		<div class="row"> 
			<div class="col-md-4">
			<img src="${pageContext.request.contextPath}/upload/<%=book.getFileName()%>" style="width:100%"></div>
			
			<div class="col-md-5">
				<h3><%= book.getName() %></h3>
				<p><%= book.getDescription() %></p>
				<p><b>상품 코드 : </b><span class="badge badge-danger">
				<%=book.getBookId() %></span>
				<p> <b>출판사</b> : <%=book.getPublisher() %></p>
				<p> <b>분류</b> : <%=book.getCategory() %></p>
				<p> <b>재고 수</b> : <%=book.getUnitsInStock() %></p>
				<p> <b>총 페이지 수</b> : <%=book.getTotalPages() %></p>
				<p> <b>출판일</b> : <%=book.getReleaseDate() %></p>
				<h4><%=book.getUnitPrice() %>원</h4>
				<form name="addForm" action="./addCart.jsp?id=<%= book.getBookId()%>" method="post">
				<p> <a href="#" class="btn btn-info" onclick="addToCart()">도서주문 &raquo;</a>
				<a href="./cart.jsp" class="btn btn-warning"> 장바구니 &raquo;</a>
				<a href="./books.jsp" class="btn btn-secondary">도서목록 &raquo;</a>
			</div>
		</div>
		<hr>
	</div>
	<%@ include file="/layout/footer.jsp" %>
</body>
</html>