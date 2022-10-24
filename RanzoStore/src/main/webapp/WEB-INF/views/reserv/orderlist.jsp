<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<style type="text/css">
.ordertable{
	padding: 10px;
	width: 80%;
	margin: auto;
	text-align: center;
	border-collapse: collapse;
}
.ordertable th {
	border-top: 2px solid #e4e4e4;
	background-color: #f8f9fa;
	color: #7b7e83;
}
.ordertable td{	border-bottom: 1px solid #e4e4e4;}
.ordertable th, td{ padding: 10px;}
.orderdiv {
	padding: 20px;
	margin: auto;
	width: 80%;
}

</style>
</head>
<body>
<%@ include file="../include/menu.jsp" %>
<div class="orderdiv">
<h2>예매확인/취소</h2>
<p><span style="color: #fa5041;">예매번호</span>를 클릭하면 예매 상세 내용을 확인할 수 있습니다.</p>

<table class="ordertable">
<tr>
 <th>예매번호</th>
 <th>전시명</th>
 <th>관람일</th>
 <th>매수</th>
 <th>상태</th>
</tr>
<c:forEach var="row" items="${list}">
<tr>
 <td width="10%"><a href="${path}/reserv/orderdetail/${row.no}">${row.no}</a></td>
 <td>${row.title}</td>
 <td><fmt:formatDate value="${row.res_date}" pattern="yyyy-MM-dd" /></td>
 <td>${row.quantity}장</td>
 <td><c:if test="${row.pay=='y'}"><p style="color: #fa5041;">예매완료</p></c:if></td>
</tr>
</c:forEach>
</table>
</div>


<%@ include file="../include/footer.jsp" %>
</body>
</html>