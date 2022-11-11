<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전시</title>
<%@ include file="../include/header.jsp" %>	
<link rel="stylesheet" href="${path}/resources/css/exhibition.css?=ver1">
<script type="text/javascript">
	/*  */
	$(window).resize(function (){
		/* dropdown으로 숨겨진 메뉴를 반응형 사이즈에 맞춰 다시 보이게 함 */
			$('.sort').hide();	
		var width_size = window.outerWidth;
		if (width_size >= 768) {
			$('.filter').show();	
		}
		if (width_size >= 1132) {
			$('.sort').show();	
		}
	});
$(function(){

	date = new Date();
	console.log("date:"+date.getHours()+":"+date.getMinutes()+":"+date.getSeconds());
	getList();
	
	$('.filter-dropdown').click(function(){
		if($('.sort-dropdown').css('display') != 'none'){
			/* 태블릿 이상 */
			$('.sort').hide();			
		}
		$('.filter').slideToggle(500);
		$(this).text($(this).text() == "지역 ▾" ? "닫기 ✕" : "지역 ▾");
		console.log("filter-dropdown"+$('.filter-dropdown').css('display'));
		console.log("filter"+$('.filter').css('display'));
	});
	$('.sort-dropdown').click(function(){
		if($('.filter-dropdown').css('display') != 'none'){
			/* 태블릿 이상 */
			$('.filter').hide();	
		}
		$('.sort').slideToggle(500);	
		//$(this).text();
		console.log("sort-dropdown"+$('.sort-dropdown').css('display'))
		console.log("sort"+$('.sort').css('display'))
	});

	
	// 필터,정렬
	allLoaction = $('.filter li:first');
	allLoaction.addClass('selected');
	$('.sort li:first').addClass('selected');

	filterList = $('.filter li');
	sortList = $('.sort li');
	filterList.click(function(e){		
		if($(this).index() == 0){
			filterList.removeClass('selected');		
			$(this).addClass('selected');			
		} else {
			$(this).toggleClass('selected');
			allLoaction.removeClass('selected');
		}
		getList();
	});

	sortList.click(function(e){
		sortList.removeClass('selected');
		$(this).addClass('selected');
		getList();
	});

});


function getList(){
	// 검색 필터
	sort = $('.sort .selected').text();
	console.info("sort"+sort);
	filter = $('.filter .selected').toArray();
	console.info("filter"+filter);
	var location = [];
	for(var i=0 ; i<filter.length ; i++){
		//location.push(filter[i].innerHTML);
		location.push(filter[i].innerHTML);
	}
	console.info("location"+location);

	$.ajax({
		type: "get",
		url: "${path}/shop/exhibition/list",
		data: {
			sort:sort,
			location:location.join(',')
		},
		success: function(result){
			console.debug("getList success : " + result);
			$("#exhibition_list").html(result);
		},
		error : function (result){
			console.error("getList error : " + result);
		}
	});
}
</script>
</head>
<body>
	<header>
		<%@ include file="../include/menu.jsp" %>
	</header>
	
	<section class="sec-content">
		<h2>현재전시</h2>
		<div class="sec-search">			
				<span class="filter-dropdown">지역 ▾</span>		
				<ul class="filter">			
					<li>전체</li>
					<li>서울</li>
					<li>경기</li>
					<li>충청</li>
					<li>대구</li>
					<li>부산</li>
					<li>광주</li>
					<li>제주</li>
				</ul>

				<span class="sort-dropdown">정렬</span>
				<ul class="sort">
					<li id="rating">별점 높은순</li>
					<li id="review">리뷰 많은순</li>
					<li id ="end_date">종료 임박순</li>
					<li id ="price">가격 낮은순</li>
				</ul>	

		</div>

		<div id="exhibition_list"></div>
		
	</section>
	
	<footer>
		<%@ include file="../include/footer.jsp"%>
	</footer>
	
</body>
</html>

