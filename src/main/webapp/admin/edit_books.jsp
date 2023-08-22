<%@page import="com.entity.BookDetails"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.Book_Dao_Impl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin: Edit books</title>
<%@include file="all_css.jsp"%>
</head>
<body style="background-color: #f0f1f2">
	<%@include file="navbar.jsp"%>
	<div class="container">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center">Edit Books</h4>

						<%
						Book_Dao_Impl DaoImp = new Book_Dao_Impl(DBConnect.getsqlConnection());
						BookDetails book = DaoImp.getBookById(Integer.parseInt(request.getParameter("id")));
						%>
						<form action="../editbooks" method="post">
						
						<input type="hidden" name="id" value="<%= request.getParameter("id")%>">
						
							<div class="form-group">
								<label for="exampleInputEmail1">Book Name*</label> <input
									type="text" name="bname" class="form-control"
									id="exampleInputEmail1" value="<%=book.getBookName()%>"
									aria-describedby="emailHelp" required="required">
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Author Name*</label> <input
									type="text" name="author" class="form-control"
									id="exampleInputPassword1" value="<%=book.getAuthor()%>"
									required="required">
							</div>

							<div class="form-group">
								<label for="price">price*</label> <input type="number"
									name="price" class="form-control" id="price"
									value="<%=book.getPrice()%>" required="required">
							</div>


							<div class="form-group">
								<label for="bookstatus">Book Status*</label> <select
									class="form-control" name="bstatus" id="bookstatus">
									<%
									if (book.getStatus().equals("Active")) {
									%>
									<option value="Active">Active</option>
									<option value="Inactive">Inactive</option>
									<%
									}
									%>
									<%
									if (book.getStatus().equals("Inactive")) {
									%>
									<option value="Inactive">Inactive</option>
									<option value="Active">Active</option>
									<%
									}
									%>

								</select>
							</div>

							<button type="submit" class="btn btn-primary">Edit</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="footer.jsp"%>
</body>
</html>