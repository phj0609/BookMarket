<%@page import="java.util.List"%>
<%@page import="dto.Book"%>
<%@page import="dao.BookRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
	if(id==null || id.trim().equals("")) {
		response.sendRedirect("product.jsp");
		return;
	}
	
	BookRepository dao = BookRepository.getInstance();
	
	Book book = dao.getBookById(id);
	if(book==null) {
		response.sendRedirect("exceptionNoProductId.jsp");
	}
	
	List<Book> carList = (List<Book>) session.getValue("cartlist");
	Book goodsQnt = new Book();
	for(int i=0; i<carList.size();i++) {
		goodsQnt = carList.get(i);
		if(goodsQnt.getBookId().equals(id)){
			carList.remove(goodsQnt);
		}
	}
	
	response.sendRedirect("cart.jsp");
%>