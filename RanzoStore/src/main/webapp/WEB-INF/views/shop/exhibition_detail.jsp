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
		// 상세 판넬
		tabList = $('.tab-list li');
		tabContent = $('.tab-content');
		tabContent.hide();
		$('.tab-list li:first').addClass("active").show();
		$('.tab-content:first').show();
		
		// 상세 정보 탭
		tabList.click(function(e){
			e.preventDefault();
			
			tabList.removeClass('active');
			$(this).addClass('active');
			
			tabContent.hide();
			
			var target = $(this).find("a").attr('href');
			/* console.log($target); */
			$(target).show();
		});			
		getProductInfo();
		getReserveInfo();
		getReviewInfo();
		getQnaInfo();
	});
	
	// 전시상세
	function getProductInfo() {
		$.ajax({
			type: "get",
			url: "${path}/shop/exhibition/getProductInfo?code=${exhibition.code}",
			success: function(result){
				console.debug("getProductInfo success : " + result);
				$("#productInfo").html(result);
			},
			error : function (result){
				console.error("getProductInfo error : " + result);
			}
		});
	}
	
	// 예매/취소
	function getReserveInfo() {
		$.ajax({
			type: "get",
			url: "${path}/shop/exhibition/getReserveInfo?code=${exhibition.code}",
			success: function(result){
				console.debug("getReserveInfo success : " + result);
				$("#reserveInfo").html(result);
			},
			error : function (result){
				console.error("getReserveInfo error : " + result);
			}
		});
	}
	
	
	// 관람후기
	function getReviewInfo() {
		$.ajax({
			type: "get",
			url: "${path}/board/review/getReviewInfo?code=${exhibition.code}",
			success: function(result){
				console.debug("getReviewInfo success : " + result);
				$("#reviewInfo").html(result);
			},
			error : function (result){
				console.error("getReviewInfo error : " + result);
			}
		});
	}
	
	// Q&A
	function getQnaInfo() {
		$.ajax({
			type: "get",
			url: "${path}/board/qna/getQnaInfo?code=${exhibition.code}",
			success: function(result){
				console.debug("getQnaInfo success : " + result);
				$("#qnaInfo").html(result);
			},
			error : function (result){
				console.error("getQnaInfo error : " + result);
			}
		});
	}
		
</script>	
<link rel="stylesheet" href="${path}/resources/css/exhibition_detail.css">
</head>
<body>
	<header>
		<%@ include file="../include/menu.jsp" %>
	</header>
	<section class="sec-content">
		<section class="sec-prd">
			<div class="prd-thumnail">
				<img src="${exhibition.thumnail}">
			</div>
			
			<div class="prd-head">
				<span class="prd-title">${exhibition.title}</span>
				<span class="prd-summary">${exhibition.summary}</span>			 
			</div>
			
			<div class="prd-body">
				<div>				
					<span class="itemLabel">장소</span>
					<span class="item">${exhibition.gallery}</span> 
				</div>
				<div>
				<span class="itemLabel">기간</span>
					<span class="item"> 
						<fmt:formatDate value="${exhibition.start_date}" pattern="yyyy-MM-dd" /> ~ 
						<fmt:formatDate value="${exhibition.end_date}" pattern="yyyy-MM-dd" />
				</span>
				</div>
	<%-- 		<span class="itemLabel">가격</span>
				<span class="item"><fmt:formatNumber value="${exhibition.price}" pattern="#,###" /></span> --%>
			</div>

			<span class="button-reserve"><a href="${path}/reserv/detail/${exhibition.code}">예매하기</a></span>

			<c:if test="${sessionScope.admin_userid != null }">
				<!-- 관리자 수정버튼  -->
				<div>
					<br>
					<a href="${path}/shop/product/edit/${exhibition.code}">[편집]</a>
				</div>
			</c:if>
		</section>
	
		<section class="sec-detail">
			<ul class="tab-list"> 
				<li><a href="#productInfo">전시상세</a></li>
				<li><a href="#reserveInfo">예매/취소</a></li>
				<li><a href="#reviewInfo">관람후기</a></li>
				<li><a href="#qnaInfo">Q&A</a></li>
			</ul>
	
			<div class="tab-content" id="productInfo"></div>
			<div class="tab-content" id="reserveInfo"></div>
			<div class="tab-content" id="reviewInfo"></div>
			<div class="tab-content" id="qnaInfo" ></div>
		</section>
	</section>

	<footer>
		<%@ include file="../include/footer.jsp"%>
	</footer>

</body>
</html>

