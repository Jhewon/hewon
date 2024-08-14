<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page session="false" import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Error_Page</title>
</head>
<body>

	<h3><c:out value="${exception.getMessage() }"></c:out></h3>
	
	<ul>
		<c:forEach items="${exception.stackTrace }" var="stack"> 
		  <li>${stack }</li>
		</c:forEach>
	</ul>
</body>
</html>