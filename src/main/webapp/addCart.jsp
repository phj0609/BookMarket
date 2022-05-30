<%@page import="dto.Book"%>
<%@page import="dao.BookRepository"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String id = request.getParameter("id");
	if(id == null || id.trim().equals("")) {
		response.sendRedirect("books.jsp");
		return;
	}
	
	BookRepository dao = BookRepository.getInstance();
	
	Book book = dao.getBookById(id);
	if(book == null) {
		response.sendRedirect("exceptionNoProductId.jsp");
	}
	
	List<Book> goodsList = dao.getAllBooks();
	Book goods = new Book();
	for(int i = 0; i<goodsList.size(); i++) {
		goods = goodsList.get(i);
		if(goods.getBookId().equals(id)) {
			break;
		}
	}
	
	List<Book> list = (List<Book>) session.getAttribute("cartlist");
		if(list == null) {
			list = new ArrayList<Book>();
			session.setAttribute("cartlist", list);
		}
		
		int cnt= 0;
		Book goodsQnt = new Book();
		
		for(int i = 0; i< list.size(); i++) {
			goodsQnt = list.get(i);
			if(goodsQnt.getBookId().equals(id)) {
				cnt++;
				int orderQuantity = goodsQnt.getQuantity() + 1;
				goodsQnt.setQuantity(orderQuantity);
		}
		}
		if(cnt == 0) {
			goods.setQuantity(1);
			list.add(goods);
		}
	
	response.sendRedirect("product.jsp?id=" + id);
%>