<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>

<div class="container-fluid p-3" style="background-color: white">
	<div class="row">
		<div class="col-md-3 text-primary">
			<h3> <i class="fa-solid fa-book"></i> BookDukan.com</h3>
		</div>
		<div class="col-md-3 offset-6">
			<a  class="btn btn-primary"><i class="fa-solid fa-user"></i> ${userObj.name} </a>
			<a  class="btn btn-primary" data-toggle="modal" data-target="#exampleModalCenter"><i class="fa-solid fa-right-from-bracket"></i> Logout</a>
		</div>
	</div>
</div>

<%@include file="Modal.jsp" %>

<nav class="navbar navbar-expand-lg navbar-dark bg-custom">
	<a class="navbar-brand" href="home.jsp"><i class="fa-solid fa-house"></i></a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item active"><a class="nav-link" href="home.jsp">Home
					<span class="sr-only">(current)</span>
			</a></li>
		</ul>
		<form class="form-inline my-2 my-lg-0">
			<button class="btn btn-light my-2 my-sm-0" type="submit"><i class="fa-solid fa-gear"></i> Setting</button>
			<button class="btn btn-light my-2 my-sm-0 ml-1" type="submit"><i class="fa-solid fa-phone"></i> Conact Us</button>
		</form>
	</div>
</nav>