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
		tabList = $('.tab-list li');
		tabContent = $('.tab-content');
		tabContent.hide();
		$('.tab-list li:first').addClass("active").show();
		$('.tab-content:first').show();
		
		//링크 클릭시
		tabList.click(function(e){
			e.preventDefault();
			
			tabList.removeClass('active');
			$(this).addClass('active');
			
			tabContent.hide();
			
			var target = $(this).find("a").attr('href');
			/* console.log($target); */
			$(target).show();
		});
		
		$("#btn-review-write").on("click", function(){alert("btn-review-write")});
		
		reviewList();
		console.log("@@@ reviewList")

	});
	
	// 리뷰 리스트 ajax
	function reviewList() {
		$.ajax({
			type: "post",
			url: "${path}/board/review/exhibitionReviewList",
			data : {
				code : "${exhibition.code}" 
			},
			success: function(result){
				console.info("@@@ success : " + result);
				result = JSON.parse(data);
				console.info("@@@ success : " + result);
				var html = "<ul class='review-box'>";
				$.each(result, function(idx, review){
					html+="<li>";
					html+="<div class='rvw-info'>";
					html+="<span id='rvw-bno'>${review.bno}</span> |";
					html+="<span id='rvw-rating'>별점:${review.rating}</span> |";
					html+="<span id='rvw-writer'>작성자 :${review.writer}</span> |";
					html+="<span id='rvw-date'>작성일:${review.reg_date}</span>";
					html+="</div>";
					html+="<div class='rvw-subject'>${review.subject}</div>";
					html+="<div class='rvw-content'>${review.content}</div>";
					html+="</li> ";
				});
				$("#review-list").html(html);

/*
				$("#review-list").html(result);
				alert("success:${map.count}");
				console.info("stringify : "+JSON.stringify(result));
				console.info("result[0]"+result[0].content);
*/
			},
			error : function (result){
				console.error("@@@ error : " + result);
			}
		});
	}
	
	// 리뷰 
	function reviewWrite() {
		console.log("@@@ reviewWrite");
		$.ajax({
			type: "post",
			url: "${path}/board/review/exhibitionReviewWrite",
			dataType:"json",
			data : {
				code : "${exhibition.code}" 
			},
			success: function(result){
				console.info("@@@ success : "+result)
				$("#review-list").html(result); 
			},
			error : function (){
				console.error("@@@ error : ")
				$("#review-list").html(
                        "<div>review function error</div>");
			}
		});
	}
		
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
		<div class="prd-thumnail">
			<img src="${exhibition.thumnail}">
		</div>
		<div class="prd-info">
			<span class="prd-place">${exhibition.gallery}</span> 
			<span class="prd-period"> 
				<fmt:formatDate value="${exhibition.start_date}" pattern="yyyy-MM-dd" /> ~ 
				<fmt:formatDate value="${exhibition.end_date}" pattern="yyyy-MM-dd" />
			</span>
<%-- 			<span><fmt:formatNumber value="${exhibition.price}" pattern="#,###" /></span> --%>
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

	<section class="sec-detail">
		<ul class="tab-list"> 
			<li><a href="#prdInfo">전시상세</a></li>
			<li><a href="#reservInfo">예매/취소</a></li>
			<li><a href="#reviewInfo">관람후기</a></li>
			<li><a href="#qnaInfo">Q&A</a></li>
		</ul>

		<div class="tab-content" id="prdInfo"><img class="img-prdInfo" src="${exhibition.product_info}"></div>
		<div class="tab-content" id="reservInfo">예매/취소</div>
		<div class="tab-content" id="reviewInfo">
			<h1>관람후기 div <span id="review-count">${map.count}</span></h1>
			<hr>
			게시판 운영규정에 맞지 않는 글은 사전 통보없이 삭제될 수 있습니다.
			<div id="review-content">
				<div class="reviewInfo-Input">
					<!-- rating  -->
		            <textarea class="review-textarea" id="com_content" cols="80" rows="2" name="com_content" ></textarea>
	             </div>
				<div class="review-util">
	            	<button id="btn-attach"> 첨부파일</button>
	            	<button id="btn-review-write"> 리뷰등록</button>
	            </div>
			</div>
			<div id="review-list"></div>
		</div>
		<div class="tab-content" id="qnaInfo" >Q&A</div>
	</section>

</body>
</html>

