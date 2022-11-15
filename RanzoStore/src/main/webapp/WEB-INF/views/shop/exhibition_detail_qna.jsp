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
		<p class='comment-notice'>게시판 운영규정에 맞지 않는 글은 사전 통보없이 삭제될 수 있습니다.</p>
		
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