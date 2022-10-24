<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- 세션 사용 옵션 -->
<%@ page session="true" %>

<html>
<head>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>
<meta charset="UTF-8">
	<title>Home</title>
<%@ include file="include/header.jsp" %>
<style type="text/css">

.swiper-container {
	height:700px;
	width: 100%;
}
.swiper-slide {
	text-align:center;
	display:flex; /* 내용을 중앙정렬 하기위해 flex 사용 */
	align-items:center; /* 위아래 기준 중앙정렬 */
	justify-content:center; /* 좌우 기준 중앙정렬 */
}
.swiper-slide img {
	box-shadow:0 0 5px #555;
	max-width:100%; /* 이미지 최대너비를 제한, 슬라이드에 이미지가 여러개가 보여질때 필요 */
	/* 이 예제에서 필요해서 설정했습니다. 상황에따라 다를 수 있습니다. */
}
.main {
	padding: 30px 150px;
	text-align: center;
}
.main li {
	display: inline-block;
	padding-right: 15px;
}
h1 {
	font-size: 60px;
	font-weight: bold;
}
.simage{
	postiion : relative;
}
button.btn1 {
  position: absolute;
  top: 500px;
  left : 150px;
  width: 180px; 
  height: 60px;
  border: 1px solid white;
  background: none;
  font-weight: bold;
  font-size: 18px;
  color: white;
}
button.btn2 {
  position: absolute;
  top: 500px;
  left : 350px;
  width: 180px; 
  height: 60px;
  border: 1px solid white;
  background-color: white;
  color: black;
  font-weight: bold;
  font-size: 18px;
}
.image_text{
  position: absolute;
  top: 280px;
  left : 150px;
  font-size: 70px;  
  color: white;
  text-align: left;

}
.text1{
	position: absolute;
	top: 230px;
  left : 150px;
	background-color: black;
	color: white;
	width: 100px;
	padding: 10px;
	text-align: center;
}
</style>
<script type="text/javascript">
function btn2(){
	location.href="${path}/reserv/reserv.do";
}

</script>
</head>
<body>
<h1>
	Hello world!
</h1>

<%@ include file="include/menu.jsp" %>

<c:if test="${sessionScope.userid != null }">
 <h2>${sessionScope.name}(${sessionScope.userid})님의 방문을 환영합니다.</h2>
</c:if>

<div class="swiper-container">
   <div class="swiper-wrapper">
   <div class="swiper-slide"><a><img class="simage" src="${path}/resources/images/20220916134414476001.jpg"></a>
   <div class="text1">디뮤지엄</div>
   <div class="image_text">
   <p style="font-size: 18px; font-weight: bold;">2022.03.16 ~ 2022.11.27</p>
   <p style="font-weight: bold;">Romantic Days</p>
   <p>어쨌든, 사랑</p></div>
   <button class="btn1" type="button">자세히보기</button>
   <button class="btn2" type="button" onclick="btn2()">예매하기</button>
   </div>
   <div class="swiper-slide"><a><img src="${path}/resources/images/20220629092929701001.png"></a></div>
	</div>

	<!-- 네비게이션 -->
	<div class="swiper-button-next"></div><!-- 다음 버튼 (오른쪽에 있는 버튼) -->
	<div class="swiper-button-prev"></div><!-- 이전 버튼 -->

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
	autoplay: {
		delay: 8000,
	},
});

</script>

<div class="main">
<div style="display: inline-block; text-align: right;">
<h1>EXHIBITION</h1>
<br>
<ul>
 <li>추천 전시 > </li>
</ul>
</div>
<div style="display: inline-block;">
 <ul>
  <li><a href="#"><img alt="" src="${path}/resources/images/20220825-43301_1.jpg" width="250" height="300"></a></li>
  <li><a href="#"><img alt="" src="${path}/resources/images/d49b047b-0422-45a9-952a-946828669f40.jpg" width="250" height="300"></a></li>
  <li><a href="#"><img alt="" src="${path}/resources/images/2022-Busan-Biennale-Poster-768x1152.jpg" width="250" height="300"></a></li>
 </ul>
</div>
</div>
<a href="${path}/exhibition/list.do">전시리스트 test</a><br>
<a href="${path}/reserv/orderlist.do">주문내역 확인하기 test</a>

<%@ include file="include/footer.jsp" %>

</body>
</html>
