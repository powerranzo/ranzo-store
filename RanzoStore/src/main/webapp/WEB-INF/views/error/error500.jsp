<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@page isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ranzo Store</title>
<%@ include file="../include/header.jsp"%>
<style type="text/css">
@media screen and (max-width: 900px) {
	#footer {
		min-width: 100%;
		min-height: 200px;
		bottom: 0 !important;
		margin: 200px 0 0 0;
	}
}

html, body {
	margin: 0;
	padding: 0;
	min-height: 100% !important;
}

body {
	display: flex;
	flex-direction: column;
	bottom: 0;
}

#errorPage {
	width: 100%;
	margin-top: 5%;
	margin-left: 3%;
}

#footer {
	bottom: 0 !important;
	margin: 200px 0 0 0;
	width: 100%;
}

h1 {
	margin-left: 40%;
	padding: 5px;
	display: inline;
	background-color: #ffb6e3;
}
</style>
</head>
<body>
	<%@ include file="../include/menu.jsp"%>
	<div id="errorPage">
		<img
			src="<%=application.getContextPath() + "/resources/images/powerranzo.png"%>">
		<h1 align="center">Sorry, something went wrong(500)</h1>
	</div>
	<%@ include file="../include/footer.jsp"%>
</body>
</html>