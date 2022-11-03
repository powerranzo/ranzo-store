<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- 세션 사용 옵션 -->
<%@ page session="true"%>
<html>
<head>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>
<meta charset="UTF-8">
<title>Home</title>
<%@ include file="include/header.jsp"%>
<link rel="stylesheet" href="${path}/resources/css/home.css">
<script type="text/javascript">
	function btn1() {
		location.href = "${path}/shop/exhibition/detail/testcode04";
	}
	function btn2() {
		location.href = "${path}/reserv/detail/testcode04";
	}
</script>
</head>
<body>
	<%@ include file="include/menu.jsp"%>

	<div class="swiper-container">
		<div class="swiper-wrapper">
			<div class="swiper-slide">
				<a><img class="simage"
					src="${path}/resources/images/main_1.jpg"></a>
				<div class="text1">디뮤지엄</div>
				<div class="image_text">
					<p style="font-size: 18px; font-weight: bold;">2022.03.16 ~
						2022.11.27</p>
					<p style="font-weight: bold;" id="title1">Romantic Days</p>
					<p>어쨌든, 사랑</p>
				</div>
				<button class="btn1" type="button" onclick="btn1()">자세히보기</button>
				<button class="btn2" type="button" onclick="btn2()">예매하기</button>
			</div>
			<div class="swiper-slide">
				<a><img src="${path}/resources/images/main_2.jpg"></a>
				<div class="text1">DDP배움터</div>
				<div class="image_text">
					<p style="font-size: 18px; font-weight: bold;">2022.10.01 ~ 2023.01.08</p>
					<p style="font-weight: bold;" id="title1">Then, There</p>
					<p>장 줄리앙</p>
				</div>
				<button class="btn1" type="button" onclick="btn1()">자세히보기</button>
				<button class="btn2" type="button" onclick="btn2()">예매하기</button>
			</div>
		</div>

		<!-- 네비게이션 -->
		<div class="swiper-button-next"></div>
		<!-- 다음 버튼 (오른쪽에 있는 버튼) -->
		<div class="swiper-button-prev"></div>
		<!-- 이전 버튼 -->
		<!-- 페이징 -->
		<div class="swiper-pagination"></div>
	</div>
	<script>
		new Swiper('.swiper-container', {
			slidesPerView : 1, // 동시에 보여줄 슬라이드 갯수
			spaceBetween : 1, // 슬라이드간 간격
			slidesPerGroup : 1, // 그룹으로 묶을 수, slidesPerView 와 같은 값을 지정하는게 좋음
			// 그룹수가 맞지 않을 경우 빈칸으로 메우기
			// 3개가 나와야 되는데 1개만 있다면 2개는 빈칸으로 채워서 3개를 만듦
			loopFillGroupWithBlank : true,
			loop : true, // 무한 반복
			pagination : { // 페이징
				el : '.swiper-pagination',
				clickable : true, // 페이징을 클릭하면 해당 영역으로 이동, 필요시 지정해 줘야 기능 작동
			},
			navigation : { // 네비게이션
				nextEl : '.swiper-button-next', // 다음 버튼 클래스명
				prevEl : '.swiper-button-prev', // 이번 버튼 클래스명
			},
			autoplay : {
				delay : 8000,
			},
		});
	</script>

	<div class="main">
		<div style="display: inline-block; text-align: right;" id="s0">
			<h1>EXHIBITION</h1>
			<br>
			<ul>
				<li><strong>추천 전시 ></strong></li>
			</ul>
		</div>
		<div style="display: inline-block;" class="reco">
			<div class="reco1">
			<a href="#"><img src="${path}/resources/images/20220825-43301_1.jpg" id="r1"></a>
			</div>
			<div class="reco1">
			<a href="#"><img src="${path}/resources/images/d49b047b-0422-45a9-952a-946828669f40.jpg" id="r2"></a>
			</div>
			<div class="reco1">
			<a href="#"><img src="${path}/resources/images/2022-Busan-Biennale-Poster-768x1152.jpg" id="r3"></a>
			</div>
		</div>
	</div>

<%@ include file="include/footer.jsp"%>
</body>
</html>