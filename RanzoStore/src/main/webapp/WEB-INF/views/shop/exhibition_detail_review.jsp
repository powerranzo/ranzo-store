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
		<h2>관람후기 <span id="review-count">(${map.count})</span> ${map.avgRating}</h2>
		<hr>
		<p class='comment-notice'>게시판 운영규정에 맞지 않는 글은 사전 통보없이 삭제될 수 있습니다.</p>
		
		<ul>
			<!-- fn: header.jsp의 jstl -->
			<c:forEach var="review" items="${map.reviewInfo}">   
				<li class='review'>
					<div class='review-info'>
						<span class='bno'>${review.bno}</span> | 
						<span class='rating'>${review.rating}</span> | 
						<span class='writer'>${review.writer}</span> | 					
						<span class='date'>
							<fmt:formatDate value="${review.reg_date}" pattern="yyyy-MM-dd" />
						</span>
					</div>
					<div class='title'>${review.subject}</div>
					<div class='content'>${review.content}</div>
				</li>
		</c:forEach>
		</ul>
	</section>
</body>
</html>