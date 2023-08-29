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
			Book_Dao_Impl bookDbOld = new Book_Dao_Impl(DBConnect.getsqlConnection());
			List<BookDetails> oldbooks = bookDbOld.getCatagoryWiseBook("Old","all");

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
	</div>

</body>
</html>