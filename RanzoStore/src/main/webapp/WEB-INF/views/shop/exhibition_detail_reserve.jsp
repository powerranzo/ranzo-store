<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<link rel="stylesheet" href="${path}/resources/css/exhibition_detail_review.css">
</head>
<body>
	<h2>예매/취소</h2>
	<c:if test="${sessionScope.admin == 'y'}">
		<a href="#">수정</a>
	</c:if>
	<hr>
</body>
</html>