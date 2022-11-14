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
	<h1>관람후기 <span id="review-count">(${map.count})</span> ${map.avgRating}</h1>
	<hr>
	<p class='comment-notice'>게시판 운영규정에 맞지 않는 글은 사전 통보없이 삭제될 수 있습니다.</p>
	
	<ul>
		<!-- fn: header.jsp의 jstl -->
		<c:forEach var="review" items="${map.reviewInfo}">   
			<li class='review'>
				<div class='review-info'>
					<span class='review-bno'>${review.bno}</span> | 
					<span class='review-rating'>별점:${review.rating}</span> | 
					<span class='review-writer'>작성자 :${review.writer}</span> | 					
					<span class='review-date'>작성일:
						<fmt:formatDate value="${review.reg_date}" pattern="yyyy-MM-dd" />
					</span>
				</div>
				<div class='review-title'>${review.subject}</div>
				<div class='review-content'>${review.content}</div>
			</li>
	</c:forEach>
	</ul>
	
</body>
</html>