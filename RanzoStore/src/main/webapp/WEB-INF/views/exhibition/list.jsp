<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
</head>
<body>
<%@ include file="../include/menu.jsp" %>
<h2>상품목록</h2>
<table border="1" style="width: 100%;">
	<tr>
		<th>코드</th>
		<th>&nbsp;</th>
		<th>상품명</th>
		<th>가격</th>
	</tr>
<c:forEach var="row" items="${list}">
	<tr>
		<td><a href="${path}/reserv/${row.code}">${row.code}</a></td>
		<td><img src="${row.thumnail}"
					width="100px" height="100px"></td>
		<td>${row.title}
		</td>
	</tr>
</c:forEach>	
</table>
</body>
</html>

