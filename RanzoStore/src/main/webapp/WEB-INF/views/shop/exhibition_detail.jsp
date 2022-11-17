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

	// 트위터 공유
	function shareTwitter() {
		var sendText = $(".prd-title").text();
		var sendUrl = $(location).attr('href'); // 전달할 현재 URL
		window.open("https://twitter.com/intent/tweet?text=" + sendText + "&url=" + sendUrl);
	}
	
	// 페이스북 공유	
	function shareFacebook() {
		var sendUrl = $(location).attr('href') // 전달할 현재 URL
		window.open("http://www.facebook.com/sharer/sharer.php?u=" + sendUrl);
	}
	
	//링크 공유


	
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
		var userid = "<%=(String)session.getAttribute("userid")%>";
		console.info("userid"+userid);
		// 로그인 했을 때만 좋아요 가능
		if(userid != "null") {		
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
		} else {
			var result = confirm("로그인이 필요한 서비스입니다. 로그인하시겠습니까?")
			if(result) {
				console.log("로그인으로");
				location.href="${path}/member/login.do";
			}
		}
	}  
	

</script>	
<link rel="stylesheet" href="${path}/resources/css/exhibition_detail.css">
</head>
<body>
	<header>
		<%@ include file="../include/menu.jsp" %>
	</header>
		
	<section class="sec-content">
		<article class="sec-prd">
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
				<div>
				 	<span class="itemLabel">가격</span>
					<span class="item">
						성인 : <fmt:formatNumber value="${exhibition.adult_price}" pattern="#,###" /><br>
						청소년 : <fmt:formatNumber value="${exhibition.teen_price}" pattern="#,###" /><br>
						어린이 : <fmt:formatNumber value="${exhibition.kids_price}" pattern="#,###" />
					</span>
				</div>
				</div> <!-- end prd-body -->
				
				<div class="buttons">
					<span class="shareTweeter">
						<a href="javascript:shareTwitter();">
							<i class="fa fa-twitter" aria-hidden="true"></i>
						</a>
					</span>
					<span  class="shareFacebook">
						<a class="shareFacebook" href="javascript:shareFacebook();">
							<i class="fa fa-facebook" aria-hidden="true"></i>
						</a>
					</span>
					<a class="btn-wish" onclick="clickHeart()"><img id="heart" alt="찜" src="${pageContext.request.contextPath}/resources/images/favorite1.png"></a>
					<a class="btn-reserve" href="${path}/reserv/detail/${exhibition.code}">예매하기</a>
				</div>
				
				<c:if test="${sessionScope.admin_userid != null }">
					<!-- 관리자 수정버튼  -->
					<div>
						<a href="${path}/shop/product/edit/${exhibition.code}">[편집]</a>
					</div>
				</c:if>
		</article>
	
		<article class="sec-detail">
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
		</article>
	</section>

	<footer>
		<%@ include file="../include/footer.jsp"%>
	</footer>


</body>
</html>

