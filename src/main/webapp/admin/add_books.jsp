<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin: Add books</title>
<%@include file="all_css.jsp"%>
</head>
<body style="background-color: #f0f1f2">
	<c:if test="${empty userObj }">
		<c:redirect url="../login.jsp" />
	</c:if>
	<%@include file="navbar.jsp"%>
	<div class="container">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center">Add Books</h4>
						<c:if test="${not empty success }">
							<p class="text-center text-success">${success }</p>
							<c:remove var="success" scope="session" />
						</c:if>
						<c:if test="${not empty fail }">
							<p class="text-center text-danger">${fail }</p>
							<c:remove var="fail" scope="session" />
						</c:if>

						<form action="../addbooks" method="post"
							enctype="multipart/form-data">
							<div class="form-group">
								<label for="exampleInputEmail1">Book Name*</label> <input
									type="text" name="bname" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									required="required">

							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Author Name*</label> <input
									type="text" name="author" class="form-control"
									id="exampleInputPassword1" required="required">
							</div>

							<div class="form-group">
								<label for="price">price*</label> <input type="number"
									name="price" class="form-control" id="price"
									required="required">
							</div>

							<div class="form-group">
								<label for="catagory">Book Catagory*</label> <select
									class="form-control" name="btype" id="catagory">
									<option selected>--select--</option>
									<option value="New">New Book</option>
								</select>
							</div>

							<div class="form-group">
								<label for="bookstatus">Book Status*</label> <select
									class="form-control" name="bstatus" id="bookstatus">
									<option selected>--select--</option>
									<option value="Active">Active</option>
									<option value="Inactive">Inactive</option>
								</select>
							</div>

							<div class="form-group">
								<label for="file">Book Image</label> <input type="file"
									name="bimg" class="form-control-file" id="file"
									required="required">
							</div>

							<button type="submit" class="btn btn-primary">Add</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="footer.jsp"%>
</body>
</html>