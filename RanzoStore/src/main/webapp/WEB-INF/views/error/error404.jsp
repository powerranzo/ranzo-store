<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ranzo Store</title>
<style type="text/css">
#errorPage{
width:100%; margin:auto;}
h1{
margin-left:40%;
padding:5px;
display:inline;
background-color: #ffb6e3;
}
</style>
</head>
<body>
<div id="errorPage">
<img src="<%=application.getContextPath()+"/resources/images/powerranzo.png" %>">
<h1 align="center">Oops! We can't find that page(404)</h1>
</div>
</body>
</html>