<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<html>
<head>
<meta charset="UTF-8">
	<title>Home</title>
	<%@ include file="include/header.jsp" %>
</head>
<body>
	<%@ include file="include/menu.jsp" %>
	<h1>
		Hello world!  
	</h1>
	path : ${path}
	<P>  The time on the server is ${serverTime}. </P>
	
	<hr>
	
	
</body>
</html>
