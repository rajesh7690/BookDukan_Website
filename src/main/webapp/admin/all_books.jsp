<%@page import="com.entity.BookDetails"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.Book_Dao_Impl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All books</title>
<%@include file="all_css.jsp"%>
</head>
<body>
	<c:if test="${empty userObj }">
		<c:redirect url="../login.jsp" />
	</c:if>
	<%@include file="navbar.jsp"%>
	<h3 class="text-center">Hello Admin</h3>
	<c:if test="${not empty success }">
		<h5 class="text-center text-success">${success }</h5>
		<c:remove var="success" scope="session" />
	</c:if>
	<c:if test="${not empty fail }">
		<h5 class="text-center text-danger">${fail }</h5>
		<c:remove var="fail" scope="session" />
	</c:if>
	<table class="table table-striped">
		<thead class="bg-primary text-white">
			<tr>
				<th scope="col">Id</th>
				<th scope="col">Image</th>
				<th scope="col">Book Name</th>
				<th scope="col">Author</th>
				<th scope="col">Price</th>
				<th scope="col">Categories</th>
				<th scope="col">Status</th>
				<th scope="col">Action</th>
			</tr>
		</thead>
		<tbody>
			<%
			Book_Dao_Impl bookdao = new Book_Dao_Impl(DBConnect.getsqlConnection());
			List<BookDetails> bookGroup = bookdao.allBook();
			for (BookDetails book : bookGroup) {
			%>
			<tr>
				<td><%=book.getBookId()%></td>
				<td><img src="../book/<%=book.getImage()%>"
					style="width: 50px; height: 70px"></td>
				<td><%=book.getBookName()%></td>
				<td><%=book.getAuthor()%></td>
				<td><%=book.getPrice()%></td>
				<td><%=book.getBookCategory()%></td>
				<td><%=book.getStatus()%></td>
				<td><a href="edit_books.jsp?id=<%=book.getBookId()%>"
					class="btn btn-sm btn-primary"><i
						class="fa-solid fa-pen-to-square"></i> Edit</a> <a
					href="../deletebook?id=<%=book.getBookId()%>&image=<%=book.getImage() %>"
					class="btn btn-sm btn-danger"><i class="fa-solid fa-trash"></i>
						Delete</a></td>
			</tr>

			<%
			}
			%>

		</tbody>
	</table>
	<div style="margin-top: 70px">
	<%@include file="footer.jsp" %>
	</div>
</body>
</html>