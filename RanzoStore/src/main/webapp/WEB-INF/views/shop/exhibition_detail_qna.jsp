<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<link rel="stylesheet" href="${path}/resources/css/exhibition_detail_qna.css">
</head>
<body>
	<section class="sec-qna">
		<h2>Q&A <span id="count">(${map.count})</span></h2>
		<hr>
			<p class='comment-notice'>게시판 운영규정에 맞지 않는 글은 사전 통보없이 삭제될 수 있습니다.<br>
			상품, 예매, 배송 등의 문의는 인터파크티켓 챗봇을 이용해주시기 바랍니다.
			<a href="${path}/board/qna/write.do">문의하기</a>
		<ul>
			<c:forEach var="qna" items="${map.qnaInfo}">   
				<li class="qna">
					<div class="qna-info">
						<span id='bno'>${qna.bno}</span> | 
						<span id='writer'>${qna.writer}</span> | 
						<span id='date'>${qna.reg_date}</span>
					</div>
					<div class='title'>${qna.title}</div>			
					<div class='content'>${qna.content}</div>
	
				</li>
		</c:forEach>
	</ul>
	</section>
	
</body>
</html>