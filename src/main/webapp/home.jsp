<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Ebook: User Home</title>
</head>
<body>
	<c:if test="${not empty userObj}">
		<h5 class="text-center text-danger">${userObj.name}</h5>
	</c:if>
	<h5>User Home</h5>
</body>
</html>