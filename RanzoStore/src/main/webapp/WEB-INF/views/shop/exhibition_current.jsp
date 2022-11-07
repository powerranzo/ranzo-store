<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전시</title>
<%@ include file="../include/header.jsp" %>	
<link rel="stylesheet" href="${path}/resources/css/exhibition.css">
<script type="text/javascript">
$(function(){

	date = new Date();
	console.log("date:"+date.getHours()+":"+date.getMinutes()+":"+date.getSeconds());

	getList();
});

function getList(){
	$.ajax({
		type: "get",
		url: "${path}/shop/exhibition/list",
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
<%@ include file="../include/menu.jsp" %>
	<section class="sec-content">
		<h2>현재전시 <span>()</span></h2>
		<hr>
		<div class="sec-search">

			<div>		
				<ul class="filter">			
					<li>전체</li>
					<li>서울</li>
					<li>경기/인천</li>
					<li>충청/강원</li>
					<li>대구/경북</li>
					<li>부산/경남</li>
					<li>광주/전라</li>
					<li>제주</li>
				</ul>
			</div>

			<div>
				<ul class="sort">
					<li>최저가순</li>
					<li>종료 임박순</li>
					<li>리뷰 많은순</li>
				</ul>	
			</div>
		</div>

		<div id="exhibition_list"></div>
		
	</section>
	
	<%@ include file="../include/footer.jsp"%>
</body>
</html>

