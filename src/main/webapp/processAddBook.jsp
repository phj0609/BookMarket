<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.oreilly.servlet.*"%>
<%@page import="dto.Book"%>
<%@page import="dao.BookRepository"%>
<%@page import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <%
 	request.setCharacterEncoding("UTF-8");
 	
 	String realFolder = "C:\\upload";
 	int maxSize = 5*1024*1024;
 	String encType = "utf-8";
 	
 	MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());
 	
 	String bookId = multi.getParameter("bookId");
 	String name = multi.getParameter("name");
 	String unitPrice = multi.getParameter("unitPrice");
 	String author = multi.getParameter("author");
 	String description = multi.getParameter("description");
 	String publisher = multi.getParameter("publisher");
 	String category = multi.getParameter("category");
 	String unitsInStock = multi.getParameter("unitsInStock");
 	String totalPages = multi.getParameter("totalPages");
 	String releaseDate = multi.getParameter("releaseDate");
 	String condition = multi.getParameter("condition");
 	
 	Integer price;
 	
 	if(unitPrice.isEmpty())
 		price = 0;
 	else
 		price = Integer.valueOf(unitPrice);
 	
 	long stock;
 
 	if(unitsInStock.isEmpty())
 		stock = 0;
 	else
 		stock = Long.valueOf(unitsInStock);
	
	long pages;
	
 	if(totalPages.isEmpty())
 		pages = 0;
 	else
 		pages = Long.valueOf(totalPages);
 	
 	Enumeration files = multi.getFileNames();
 	String fname = (String)files.nextElement();
 	String fileName = multi.getFilesystemName(fname);
 	
 	BookRepository dao = BookRepository.getInstance();
 	
 	Book newBook = new Book();
 	newBook.setBookId(bookId);
 	newBook.setName(name);
 	newBook.setUnitPrice(price);
 	newBook.setAuthor(author);
 	newBook.setDescription(description);
 	newBook.setPublisher(publisher);
 	newBook.setCategory(category);
 	newBook.setUnitsInStock(stock);
 	newBook.setTotalPages(pages);
 	newBook.setReleaseDate(releaseDate);
 	newBook.setCondition(condition);
 	newBook.setFileName(fileName);
 	
 	dao.addBook(newBook);
 	
 	response.sendRedirect("./books.jsp");
 	
 %>
</body>
</html>