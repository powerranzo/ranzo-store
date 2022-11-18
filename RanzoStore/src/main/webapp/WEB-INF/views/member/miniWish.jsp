<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>miniWish</title>
<%@ include file="../include/header.jsp" %>
<style>

/* 전시 영역 */
.sec-exhibition .shop-list li {
	padding: 10px;
	boder: 1px solid;
	border-color: red;
}

.sec-exhibition .shop-list li a {
	display: flex;
	width: 100%;
	height: 100%;
}

/* 전시 포스터 */
.sec-exhibition .shop-list li a .prd-imgbox {
	flex: 1;
	width: 100%;
	height: auto;
	max-width: 100px;
	max-height: 130px;
}

.sec-exhibition .shop-list li a .prd-imgbox .prd-img {
	border-radius: 20px;
	object-fit: cover;
	width: 100%;
	height: auto;
}


/* 태블릿용 CSS */
@media all and (min-width:768px) {
	.sec-exhibition {
		margin: 0 auto;
	}
	.sec-exhibition .shop-list {
		width: 100%;
		display: grid;
		grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
	}
	.sec-exhibition .shop-list li {
		margin: 0;

	}
	/* 포스터와 정보가 세로로 표시되도록 */
	.sec-exhibition .shop-list li a {
		display: block;
	}

	/* 전시 포스터 */
	.sec-exhibition .shop-list li a .prd-imgbox {
		width: 100%;
		aspect-ratio: 3/4;
	}
	.sec-exhibition .shop-list li a .prd-imgbox .prd-img {
		border-radius: 20px;
		width: 100%;
		height: 100%;
		object-fit: cover;
	}

}

/* PC용 CSS */
@media all and (min-width:1132px) {
	.sec-exhibition {
		max-width: 1300px;
	}

	.sec-exhibition .shop-list {
		grid-template-columns: repeat(4, 1fr);
	}
}


</style>
</head>
<body>
<div class="sec-exhibition">
	<ul class="shop-list">
		<c:forEach var="dto" items="${list}" varStatus="status" begin="0" end="3">
			<li>
				<a href="${path}/shop/exhibition/detail/${dto.code}">
					<div class="prd-imgbox">
						<img class="prd-img" src="${dto.thumnail}">
					</div>
				</a>
			</li>
		</c:forEach>
	</ul>
</div>
</body>
</html>