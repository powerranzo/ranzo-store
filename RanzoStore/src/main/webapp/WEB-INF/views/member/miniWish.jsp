<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>miniWish</title>
<%@ include file="../include/header.jsp" %>
<link rel="stylesheet" href="${path}/resources/css/exhibition_list.css">
<style>
/* 전시 포스터 */
.sec-exhibition .shop-list li a .imgbox {
	flex: 1;
	width: 100%;
	height: auto;
	max-width: 100px;
	max-height: 130px;
}

.sec-exhibition .shop-list li a .imgbox .prd-img {
	border-radius: 20px;
	object-fit: cover;
	width: 100%;
	height: auto;
}
</style>
</head>
<body>
<div class="sec-exhibition">
	<ul class="shop-list">
		<c:forEach var="dto" items="${list}" varStatus="status" begin="0" end="3">
			<li>
				<a href="${path}/shop/exhibition/detail/${dto.code}">
					<div class="imgbox">
						<img class="prd-img" src="${dto.thumnail}">
					</div>
				</a>
			</li>
		</c:forEach>
	</ul>
</div>
</body>
</html>