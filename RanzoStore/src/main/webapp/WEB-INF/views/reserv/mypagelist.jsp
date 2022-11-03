<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp"%>
</head>
<body>

<table>
<tr>
 <td>전시</td>
 <td>관람일</td>
</tr>
<c:forEach var="row" items="${list}">
<tr>
<td>${row.title}</td>
<%-- <td><fmt:formatDate	value=" ${row.res_date}" pattern="yyyy-MM-dd" /></td> --%>
<td>${row.res_date}</td>
</tr>
</c:forEach>
</table>




</body>
</html>