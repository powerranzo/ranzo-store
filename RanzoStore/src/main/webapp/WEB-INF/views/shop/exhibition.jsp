<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전시</title>
<%@ include file="../include/header.jsp" %>	
<link rel="stylesheet" href="${path}/resources/css/exhibition_list.css">
<script type="text/javascript">


</script>
</head>
<body>
<%@ include file="../include/menu.jsp" %>
<h2>현재전시</h2>
<hr>
	<section class="sec-content">
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

