<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp"%>
<style type="text/css">
#mypagelist td{
	padding: 5px;
}
</style>
</head>
<body>

<table id="mypagelist">
<tr>
 <th width="75%">전시</th>
 <th>예매일</th>
</tr>
<c:forEach var="row" items="${list}">
<tr>
<td><a href="${path}/reserv/orderdetail/${row.no}">${row.title}</a></td>
<td style="text-align: right;"><fmt:formatDate	value="${row.reg_date}" pattern="yyyy-MM-dd" /></td>
</tr>
</c:forEach>
</table>




</body>
</html>