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
		findHeart(); 
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

	
  // 좋아요 체크 되어있는 지 확인
	function findHeart() {				
	   
	  // 로그인 했을 때만 좋아요 가능
		<c:if test="${sessionScope.userid != null}">
		// 좋아요가 있는지 확인한 값을 heartval에 저장
  	var heartval = ${dto.heart}
  
		// heartval이 1이면 좋아요가 이미 되있는것이므로 꽉 찬 하트를 출력하는 코드
 	 if(heartval>0) {
			$("#heart").prop("src", "${pageContext.request.contextPath}/resources/images/favorite2.png");
		} else {
			$("#heart").prop("src", "${pageContext.request.contextPath}/resources/images/favorite1.png");
		}
 	</c:if>
	}  

	// 좋아요 버튼을 클릭 시 실행되는 코드
	function clickHeart() {
		
	// 로그인 했을 때만 좋아요 가능
	<c:if test="${sessionScope.userid != null}">
		
	$.ajax({
		url :"${path}/shop/exhibition/heart.do",
		type :"GET",
		dataType : "json",
		data : {"exhibitionCode": "${exhibition.code}", "userid": "${sessionScope.userid}"},
		success : function(data){
  				if(data==1) { // 좋아요 누름
					$("#heart").prop("src","${pageContext.request.contextPath}/resources/images/favorite2.png");
				} else { // 좋아요 취소
					$("#heart").prop("src","${pageContext.request.contextPath}/resources/images/favorite1.png");
				}  
			}
	   });
	</c:if>
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
		 	<span class="itemLabel">가격</span>
			<span class="item">성인<fmt:formatNumber value="${exhibition.adult_price}" pattern="#,###" /></span>
			<span class="item">청소년<fmt:formatNumber value="${exhibition.teen_price}" pattern="#,###" /></span>
			<span class="item">어린이<fmt:formatNumber value="${exhibition.kids_price}" pattern="#,###" /></span>
			<span class="button"><a href="${path}/reserv/detail/${exhibition.code}">예매하기</a></span>
			
			<!-- 임시 좋아요 자리 -->
			<!-- 로그인 해야만 좋아요 가능 -->
			<c:if test="${sessionScope.userid != null }">
			<a onclick="clickHeart()"><img id="heart" src="${pageContext.request.contextPath}/resources/images/favorite1.png">
			좋아요</a>
			</c:if>
			<!-- 임시 좋아요 자리 -->
		</div>

		<div> 
			<!-- 관리자용 -->
			<c:if test="${sessionScope.admin_userid != null }">
				<br>
				<a href="${path}/shop/product/edit/${exhibition.code}">[편집]</a>
			</c:if>
		</div>
	</section>


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

