<%@page import="java.util.List"%>
<%@page import="com.entity.BookDetails"%>
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
<title>BookDukan.com</title>
<%@include file="all_component/all_css.jsp"%>
<style type="text/css">
.back-img {
	background: url("img/book.jpg");
	height: 50vh;
	width: 100%;
	background: cover;
	background-repeat: no-repeat;
}

.crd-ho:hover {
	background-color: #fcf7f7;
}
</style>
</head>
<body style="background-color: #f7f7f7">
	<%@include file="all_component/navbar.jsp"%>
	<div class="container-fluid back-img">
		<h1 class="text-center text-white">BookDukan.com</h1>
	</div>
	<!-- Recent book -->
	<div class="container">
		<h3 class="text-center mt-3">Recent Book</h3>
		<div class="row">
			<%
			Book_Dao_Impl bookDb = new Book_Dao_Impl(DBConnect.getsqlConnection());
			List<BookDetails> books = bookDb.fourBook("recent");

			for (BookDetails book : books) {
			%>

			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="book/<%=book.getImage()%>"
							style="width: 150px; height: 200px" class="img-thumbnil">
						<p><%=book.getBookName()%></p>
						<p><%=book.getAuthor()%></p>
						<p>
							Category :
							<%=book.getBookCategory()%></p>
						<div class="row">
							<%
							if ("New".equals(book.getBookCategory())) {
							%>
							<a href="" class="btn btn-danger btn-sm ml-2"><i
								class="fa-solid fa-cart-shopping"></i> Add</a> <a href=""
								class="btn btn-primary btn-sm ml-1">View Details</a> <a href=""
								class="btn btn-danger btn-sm  ml-1"><i
								class="fa-solid fa-indian-rupee-sign"></i> <%=book.getPrice()%></a>
							<%
							}
							%>
							<%
							if ("Old".equals(book.getBookCategory())) {
							%>
							<a href="" class="btn btn-primary btn-sm ml-5">View Details</a> <a
								href="" class="btn btn-danger btn-sm  ml-1"><i
								class="fa-solid fa-indian-rupee-sign"></i> <%=book.getPrice()%></a>
							<%
							}
							%>

						</div>
					</div>
				</div>
			</div>
			<%
			}
			%>
		</div>
		<div class="text-center mt-3 mb-3">
			<a href="" class="btn btn-primary btn-sm text-white">View All</a>
		</div>
	</div>
	<!-- New book -->
	<div class="container">
		<h3 class="text-center">New Book</h3>
		<div class="row">
			<%
			Book_Dao_Impl bookToDb = new Book_Dao_Impl(DBConnect.getsqlConnection());
			List<BookDetails> newbooks = bookToDb.fourBook("New");

			for (BookDetails newbook : newbooks) {
			%>

			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="book/<%=newbook.getImage()%>"
							style="width: 150px; height: 200px" class="img-thumbnil">
						<p><%=newbook.getBookName()%></p>
						<p><%=newbook.getAuthor()%></p>
						<p>
							Category :
							<%=newbook.getBookCategory()%></p>
						<div class="row">
							<a href="" class="btn btn-danger btn-sm ml-2"><i
								class="fa-solid fa-cart-shopping"></i> Add</a> <a href=""
								class="btn btn-primary btn-sm ml-1">View Details</a> <a href=""
								class="btn btn-danger btn-sm  ml-1"><i
								class="fa-solid fa-indian-rupee-sign"></i> <%=newbook.getPrice()%></a>
						</div>
					</div>
				</div>
			</div>
			<%
			}
			%>
		</div>
		<div class="text-center mt-3 mb-3">
			<a href="" class="btn btn-primary btn-sm text-white">View All</a>
		</div>
	</div>
	<!-- Old book -->
	<div class="container">
		<h3 class="text-center">Old Book</h3>
		<div class="row">
			<%
			Book_Dao_Impl bookDbOld = new Book_Dao_Impl(DBConnect.getsqlConnection());
			List<BookDetails> oldbooks = bookDbOld.fourBook("Old");

			for (BookDetails oldbook : oldbooks) {
			%>

			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="book/<%=oldbook.getImage()%>"
							style="width: 150px; height: 200px" class="img-thumbnil">
						<p><%=oldbook.getBookName()%></p>
						<p><%=oldbook.getAuthor()%></p>
						<p>
							Category :
							<%=oldbook.getBookCategory()%></p>
						<div class="row">
							<a href="" class="btn btn-primary btn-sm ml-5">View Details</a> <a
								href="" class="btn btn-danger btn-sm  ml-1"><i
								class="fa-solid fa-indian-rupee-sign"></i> <%=oldbook.getPrice()%></a>
						</div>
					</div>
				</div>
			</div>
			<%
			}
			%>
		</div>
		<div class="text-center mt-3 mb-3">
			<a href="" class="btn btn-primary btn-sm text-white">View All</a>
		</div>
	</div>
	<%@include file="all_component/footer.jsp"%>
</body>
</html>