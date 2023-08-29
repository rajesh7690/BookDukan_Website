<%@page import="com.entity.BookDetails"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.Book_Dao_Impl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>New Book</title>
<%@include file="all_component/all_css.jsp"%>
<style type="text/css">
.crd-ho:hover {
	background-color: #fcf7f7;
}
</style>
</head>
<body style="background-color: #f7f7f7">
	<%@include file="all_component/navbar.jsp"%>
	<div class="container-fluid">
		<div class="row p-3">
			<%
			Book_Dao_Impl bookToDb = new Book_Dao_Impl(DBConnect.getsqlConnection());
			List<BookDetails> newbooks = bookToDb.getCatagoryWiseBook("New", "all");

			for (BookDetails newbook : newbooks) {
			%>

			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="book/<%=newbook.getImage()%>"
							style="width: 100px; height: 150px" class="img-thumbnil">
						<p><%=newbook.getBookName()%></p>
						<p><%=newbook.getAuthor()%></p>
						<p>
							Category :
							<%=newbook.getBookCategory()%></p>
						<div class="row">
							<a href="" class="btn btn-danger btn-sm ml-5"><i
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
	</div>

</body>
</html>