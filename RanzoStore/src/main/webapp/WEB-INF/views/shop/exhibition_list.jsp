<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>전시</title>
	<%@ include file="../include/header.jsp" %>	
</head>
<body>
<%@ include file="../include/menu.jsp" %>
<h2>상품목록</h2>

	<ul class="shop-list">
		<c:forEach var="dto" items="${list}">
			<li>
				<a href="${path}/shop/exhibition/detail/${dto.code}">
					<div class="prd-img">
						<img src="${dto.thumnail}">
					</div>
					<div class="prd-info">
						<span class="prd-title">${dto.title}</span>
						<span class="prd-place">${dto.gallery}</span>
						<span class="prd-period">${dto.startDate} ~ ${dto.endDate}</span>
					</div> 
					<div> <!-- 관리자용 -->
						<c:if test="${sessionScope.admin_userid != null }">
							<br><a href="#">[편집]</a>
						</c:if>
					</div>
				</a>
			</li>
		</c:forEach>
	</ul>

<%-- 
<table border="1" style="width: 100%;">
	<tr>
		<th>상품코드</th>
		<th>&nbsp;</th>
		<th>상품명</th>
		<th>가격</th>
	</tr>
<c:forEach var="row" items="${list}">
	<tr>
		<td>${row.product_id}</td>
		<td><img src="${path}/images/${row.picture_url}"
					width="100px" height="100px"></td>
		<td><a href="${path}/shop/product/detail/${row.product_id}">
			${row.product_name}</a>
			<!-- 관리자용 편집 버튼 -->
			<c:if test="${sessionScope.admin_userid != null }">
				<br><a href="${path}/shop/product/edit/${row.product_id}">[편집]</a>
			</c:if>
		</td>
		<td><fmt:formatNumber value="${row.price}"
					pattern="#,###" /></td>
	</tr>
</c:forEach>	
</table>
 --%>
</body>
</html>

