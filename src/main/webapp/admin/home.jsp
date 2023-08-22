<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Ebook: Admin Home</title>
<%@include file="all_css.jsp"%>
</head>
<style>
a{
text-decoration: none;
color:black;
}
a:hover {
	text-decoration: none;
	color: black;
}
</style>

<body>
	<c:if test="${empty userObj }">
	<c:redirect url="../login.jsp"/>
	</c:if>

	<%@include file="navbar.jsp"%>

	<div class="container">
		<div class="row">
			<div class="col-md-3">
			<a href="add_books.jsp">
				<div class="card">
					<div class="card-body text-center">
					<i class="fa-solid fa-square-plus fa-3x text-primary"></i><br>
					<h4>Add Books</h4>
					------------------
					</div>
				</div>
				</a>
			</div>
			<div class="col-md-3">
			<a href="all_books.jsp">
				<div class="card">
					<div class="card-body text-center">
					<i class="fa-solid fa-book-open fa-3x text-danger"></i><br>
					<h4>All Books</h4>
					------------------
					</div>
				</div>
				</a>
			</div>
			<div class="col-md-3">
			<a href="orders.jsp">
				<div class="card">
					<div class="card-body text-center">
					<i class="fa-solid fa-box-open fa-3x text-warning"></i><br>
					<h4>Orders</h4>
					------------------
					</div>
				</div>
				</a>
			</div>
			<div class="col-md-3">
				<div class="card">
					<div class="card-body text-center" data-toggle="modal" data-target="#exampleModalCenter">
					<i class="fa-solid fa-right-from-bracket fa-3x text-primary"></i><br>
					<h4>Log Out</h4>
					------------------
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="Modal.jsp" %>
	<div style="margin-top: 387px">
	<%@include file="footer.jsp" %>
	</div>
	
</body>
</html>