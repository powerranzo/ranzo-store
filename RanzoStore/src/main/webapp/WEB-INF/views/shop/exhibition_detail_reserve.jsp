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
예매/취소
<%-- 
	<h1>관람후기 <span id="review-count">${map.count}</span></h1>
	게시판 운영규정에 맞지 않는 글은 사전 통보없이 삭제될 수 있습니다.
	<hr>
	<ul>
		<!-- fn: header.jsp의 jstl -->
		<c:forEach var="review" items="${map.reviewList}">   
			<li>
				<div>
					<span id='rvw-bno'>${review.bno}</span> | 
					<span id='rvw-rating'>별점:${review.rating}</span> | 
					<span id='rvw-writer'>작성자 :${review.writer}</span> | 
					<span id='rvw-date'>작성일:${review.reg_date}</span>
				</div>
				<div class='rvw-subject'>${review.subject}</div>
				<div class='rvw-content'>${review.content}</div>
			</li>
	</c:forEach>
	</ul>
	 --%>
</body>
</html>