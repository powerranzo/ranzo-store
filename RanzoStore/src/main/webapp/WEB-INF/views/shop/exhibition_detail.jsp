<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전시</title>
<%@ include file="../include/header.jsp"%>
<script type="text/javascript">
	$(function(){
		//상세 판넬
		tabList = $('.tablist li a');
		panelList = $('.tabpanel');
		
		//링크 클릭시
		tabList.click(function(e){
			e.preventDefault();
			
			tabList.removeClass('active');
			$(this).addClass('active');
			
			panelList.hide();
			
			var $target = $(this).attr('href');
			/* console.log($target); */
			$($target).show();
		});
		
		// 리뷰
	function review() {
		$.ajax({
			type: "post",
			url: "board/review//list.do",
			data : {product : ${dto_prd.code}},
			success: function(result){
				console.log(result);
				$("#rvwList").html(result);
			}
		});
	}

	});
</script>	
<link rel="stylesheet" href="${path}/resources/css/exhibition_detail.css">
</head>
<body>
	<%@ include file="../include/menu.jsp"%>
	<section class="sec-prd">
		
		
	
		<div class="prd-heading">
			<span class="info-title"></span>
			<span class="prd-title">${exhibition.title}</span>
			<span class="prd-title">${exhibition.summary}</span>			 
			<hr>
		</div>
		<div class="prd-img">
			<img src="${exhibition.thumnail}">
		</div>
		<div class="prd-info">
			<span class="prd-place">${exhibition.gallery}</span> 
			<span class="prd-period"> 
				<fmt:formatDate value="${exhibition.start_date}" pattern="yyyy-MM-dd" /> ~ 
				<fmt:formatDate value="${exhibition.end_date}" pattern="yyyy-MM-dd" />
			</span>
			<span><a href="${path}/reserv/detail/${exhibition.code}">예매하기</a></span>
		</div>
		<div>
			<!-- 관리자용 -->
			<c:if test="${sessionScope.admin_userid != null }">
				<br>
				<a href="${path}/shop/product/edit/${exhibition.code}">[편집]</a>
			</c:if>
		</div>
	</section>
	<hr>
	<section class="sec-detail">
		<ul class="tablist"> 
			<li><a href="#prdInfo">전시상세</a></li>
			<li><a href="#reservInfo">예매/취소</a></li>
			<li><a href="#reviewInfo">관람후기</a></li>
			<li><a href="#qnaInfo">Q&A</a></li>
		</ul>

		<div class="tabpanel" id="prdInfo">전시상세</div>
		<div class="tabpanel" id="reservInfo">예매/취소</div>
		<div class="tabpanel" id="reviewInfo"">
		<h1>관람후기</h1>
		<hr>
<%-- 			<form name="form1" method="post" action="${path}/board/review/list.do">
				<select name="search_option"56ㅏㅍ                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
					<option value="all"
						<c:if test="${map.search_option == 'all'}"> selected </c:if>	>전체 검색</option>
					<option value="title"
						<c:if test="${map.search_option == 'title'}"> selected </c:if>  >전시명</option>
					<option value="subject" 
						<c:if test="${map.search_option == 'subject'}"> selected </c:if>	>제목</option>
					<option value="content" 
						<c:if test="${map.search_option == 'content'}"> selected </c:if>	>내용</option>
					<option value="name"
						<c:if test="${map.search_option == 'name'}"> selected </c:if>	 >이름</option>
				</select>
				<input name="keyword" size="80" value="${map.keyword}">
				<input type="submit" value="조회">
				<button type="button" id="btnWrite" onclick="location.href='${path}/board/review/write.do'">글쓰기</button>
			</form> --%>
		</div>
		<div class="tabpanel" id="qnaInfo" >Q&A</div>
	</section>

</body>
</html>

