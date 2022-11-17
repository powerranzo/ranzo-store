<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<link rel="stylesheet" href="${path}/resources/css/exhibition_detail_review.css">
</head>
<body>
	<section class="sec-review">
		<div class="notice">
			<p class='comment-notice'>게시판 운영규정에 맞지 않는 글은 사전 통보없이 삭제될 수 있습니다.<br>
			특히 티켓 매매 및 양도의 글은 발견 즉시 임의 삭제되며 전화번호, 이메일 등의 개인정보는 악용될 우려가 있으므로 게시를 삼가 주시기 바랍니다.
			</p>
		</div>
		<br>
		<h3>
			<span>종합 평점 ${map.avgRating}</span>
		</h3>
		<div class="list-header">
			<span>총 <strong>${map.count}</strong>개의 이용 후기가 등록되었습니다.</span>
			<div>
				<a href="${path}/board/review/write.do/${map.code}">관람후기 작성</a>
			</div>
		</div>
		<hr>
		<ul>
			<c:forEach var="review" items="${map.reviewInfo}">   
				<li class="review">
					<div class="review-info"> 
						<span class="rating">
							<c:choose>
								<c:when test="${review.rating eq 5}">★★★★★</c:when>							
								<c:when test="${review.rating eq 4}">★★★★☆</c:when>							
								<c:when test="${review.rating eq 3}">★★★☆☆</c:when>							
								<c:when test="${review.rating eq 2}">★★☆☆☆</c:when>							
								<c:when test="${review.rating eq 1}">★☆☆☆☆</c:when>							
								<c:when test="${review.rating eq 0}">☆☆☆☆☆</c:when>
							</c:choose>
						</span> | 
						<span class="writer">${review.writer}</span> | 					
						<span class="date">
							<fmt:formatDate value="${review.reg_date}" pattern="yyyy-MM-dd" />
						</span>
					</div>
					<div class="review-comment">
						<div class="title">${review.subject}</div>
						<div class="content">${review.content}</div>
					</div>
				</li>
		</c:forEach>
		</ul>
	</section>
</body>
</html>