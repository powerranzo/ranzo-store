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

<script type="text/javascript">
	function btn1() {
		location.href = "${path}/shop/exhibition/detail/testcode04";
	}
	function btn2() {
		location.href = "${path}/reserv/detail/testcode04";
	}
	function btn3() {
		location.href = "${path}/shop/exhibition/detail/testcode06";
	}
	function btn4() {
		location.href = "${path}/reserv/detail/testcode06";
	}
</script>
</head>
<body>
	<%@ include file="include/menu.jsp"%>

	<div class="swiper-container">
		<div class="swiper-wrapper">
			<div class="swiper-slide">
				<a><img class="simage"
					src="${path}/resources/images/main_3.jpg"></a>
				<div class="text1">국립중앙박물관</div>
				<div class="image_text">
					<p style="font-size: 18px; font-weight: bold;">2022.10.25 ~
						2023.03.01</p>
					<p style="font-weight: bold;" id="title1">합스부르크 600년,</p>
					<p>매혹의 걸작들</p>
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
				<button class="btn1" type="button" onclick="btn3()">자세히보기</button>
				<button class="btn2" type="button" onclick="btn4()">예매하기</button>
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
			<a href="${path}/shop/exhibition/detail/testcode31"><img src="${path}/resources/images/20220825-43301_1.jpg" id="r1"></a>
			</div>
			<div class="reco1">
			<a href="${path}/shop/exhibition/detail/testcode02"><img src="${path}/resources/images/d49b047b-0422-45a9-952a-946828669f40.jpg" id="r2"></a>
			</div>
			<div class="reco1">
			<a href="${path}/shop/exhibition/detail/testcode26"><img src="https://ticketimage.interpark.com/Play/image/large/22/22004804_p.gif" id="r3"></a>
			</div>
		</div>
	</div>
<!-- <footer> -->
<%@ include file="include/footer.jsp"%>
<!-- </footer> -->
<script type="text/javascript">
//popup
$(function() {
	$.ajax({
		type : "POST",
		url : "${path}/admin/popup.do",
		dataType : "json",
		success : function(data) {
				for (var i = 0; i < data.length; i++) {
					if(getStorage(data[i].no))
					popup(data[i]);
				}
		}
	});
}); //ready

function popup(i) {
	console.log('popup() 호출');
    var url = "${path}/admin/popup_img.do?no=" + i.no;
	var name = i.no;
	var today = new Date();
	var date = new Date(i.end_date);
	if (date.getTime() >= today.getTime()) {
		var option = "width = "
				+ i.img_width
				+ ", height = "
				+ i.img_height
				+ ", top = "
				+ i.pos_height
				+ ", left = "
				+ i.pos_width
				+ ", location = no, scrollbars = no, resizable=no, status=no, menubar=no";
		window.open(url, name, option);
	} else {
		return;
	}
}

function getStorage(no){
	var key="exp"+no;
	var exp=parseInt(localStorage.getItem(key));
	if(exp==null || exp=="")
		return true;
	else{
		var now = new Date();
	    now = now.setTime(now.getTime());
	    var exp=parseInt(localStorage.getItem(key));
	    console.log("exp:"+exp+", exp-now:"+(exp-now));
	    if(exp > now) 
	    	return false;
	    else {
	    	window.localStorage.removeItem(key);
	    	return true;
	    }
	}
}
</script>
</body>
</html>