<%@page import="com.entity.BookDetails"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.Book_Dao_Impl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Book</title>
<%@include file="all_component/all_css.jsp"%>
</head>
<body style="background-color: #f7f7f7">
	<%@include file="all_component/navbar.jsp"%>
	<div class="container">
		<div class="row p-3">
			<div class="col-md-6 text-center bg-white border p-5">
				<%
				int id = Integer.parseInt(request.getParameter("id"));
				Book_Dao_Impl booktodb = new Book_Dao_Impl(DBConnect.getsqlConnection());
				BookDetails book = booktodb.getBookById(id);
				%>

				<img alt="book.jpg" src="book/<%=book.getImage()%>"
					style="height: 150px; width: 100px"> <br>
				<h4 class="mt-3">
					Book Name : <span class="text-danger"><%=book.getBookName()%></span>
				</h4>
				<br>
				<h4>
					Author Name : <span class="text-danger"><%=book.getAuthor()%></span>
				</h4>
				<br>
				<h4>
					Category : <span class="text-danger"><%=book.getBookCategory()%></span>
				</h4>
			</div>
			<div class="col-md-6 text-center bg-white border p-5">
				<h2 class="mb-3"><%=book.getBookName()%></h2>
				<%
				if ("Old".equals(book.getBookCategory())) {
				%>
				<h5>Contact To Seller</h5>
				<h5>
					Email id : <span class="text-danger"><%=book.getEmail()%></span>
				</h5>
				<%
				}
				%>
				<div class="row">
					<div class="col-md-4 text-danger tex-center p-2">
						<i class="fa-solid fa-money-bill-wave fa-2x"></i>
						<p>Cash On Delivery</p>
					</div>
					<div class="col-md-4 text-danger tex-center p-2">
						<i class="fa-solid fa-rotate-left fa-2x"></i>
						<p>Return Available</p>
					</div>
					<div class="col-md-4 text-danger tex-center p-2">
						<i class="fa-solid fa-truck fa-2x"></i>
						<p>Free Shipping</p>
					</div>
				</div>
				<div class="text-center p-3 mt-5">
					<%
					if ("Old".equals(book.getBookCategory())) {
					%>
					<a href="index.jsp" class="btn btn-primary"> Continue Shopping</a>
					<%
					} else {
					%>
					<a href="" class="btn btn-primary"><i
						class="fa-solid fa-cart-shopping"></i> Add To Cart</a>
					<%
					}
					%>
					<a href="" class="btn btn-danger"><i
						class="fa-solid fa-indian-rupee-sign"></i><%=book.getPrice()%></a>
				</div>

			</div>
		</div>
	</div>
</body>
</html>