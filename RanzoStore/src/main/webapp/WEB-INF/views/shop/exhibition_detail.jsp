<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>${exhibition.title}</title>
	<%@ include file="../include/header.jsp" %>	
</head>
<body>
<%@ include file="../include/menu.jsp" %>
<h2>상품정보</h2>

				<a href="${path}/shop/exhibition/detail/${exhibition.code}">
					<div class="prd-img">
						<img src="${exhibition.thumnail}">
					</div>
					<div class="prd-info">
						<span class="prd-title">${exhibition.title}</span>
						<span class="prd-place">${exhibition.gallery}</span>
						<span class="prd-period">${exhibition.startDate} ~ ${exhibition.endDate}</span>
					</div> 
					<div> <!-- 관리자용 -->
						<c:if test="${sessionScope.admin_userid != null }">
							<br><a href="#">[편집]</a>
						</c:if>
					</div>
				</a>

</body>
</html>

