<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<style type="text/css">
.orderdetail{
	padding: 10px;
	width: 80%;
	margin: auto;
	border-collapse: collapse;
	text-align: left;
}
.orderdetail thead {
	border-top: 2px solid #e4e4e4;
	background-color: #f8f9fa;
	color: #7b7e83;
	text-align: left;
	font-size: 20px;
	font-weight: bold;
}
.orderdetail td{	border-bottom: 1px solid #e4e4e4;}
.orderdetail thead, td{ padding: 10px;}
.orderdiv {
	padding: 20px;
	margin: auto;
	width: 80%;
}
.tdstyle {
	background-color: #f8f9fa;
}


</style>
</head>
<body>
<%@ include file="../include/menu.jsp" %>
<div class="orderdiv">
<h2>예매확인/취소</h2>

<table class="orderdetail">
<thead>
<tr>
<td colspan="3"> > ${dto.title}</td>
</tr>
</thead>
<tr>
 <td rowspan="7" width="30%"><img src="${dto.thumnail}" width="300px"> </td>
 <td class="tdstyle" width="20%">예매자</td>
 <td>${dto.name}</td>
</tr>
<tr>
 <td class="tdstyle">예약번호</td>
 <td>${dto.no}</td>
</tr>
<tr>
 <td class="tdstyle">관람일</td>
 <td><fmt:formatDate value="${dto.res_date}" pattern="yyyy-MM-dd" /></td>
</tr>
<tr>
 <td class="tdstyle">장소</td>
 <td>${dto.gallery}</td>
</tr>
<tr>
 <td class="tdstyle">예매내용</td>
 <td>${dto.quantity}장
  <ul style="font-size: 12px; color: gray;">
   <c:if test="${dto.adult>0}"><li>성인 ${dto.adult}장</li></c:if>
   <c:if test="${dto.teen>0}"><li>청소년 ${dto.teen}장</li></c:if>
   <c:if test="${dto.kids>0}"><li>유아 및 어린이${dto.kids}장</li></c:if>
  </ul>
 </td>
</tr>
<tr>
 <td class="tdstyle">총 결제금액</td>
 <td><fmt:formatNumber value="${dto.sub_total}" pattern="#,###" />원</td>
</tr>
<tr>
 <td class="tdstyle">상태</td>
 <td><c:if test="${dto.pay=='y'}"><p style="color: #fa5041;">예매완료</p></c:if></td>
</tr>
<tr>
 <td>예매취소, 배송지 수정?</td>
</tr>
</table>


</div>


<%@ include file="../include/footer.jsp" %>
</body>
</html>