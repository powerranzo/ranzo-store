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
	<h1>Q&A <span id="review-count">(${map.count})</span></h1>
	<hr>
	게시판 운영규정에 맞지 않는 글은 사전 통보없이 삭제될 수 있습니다.
	
	<ul>
		<c:forEach var="qna" items="${map.qnaInfo}">   
			<li>
				<div>
					<span id='rvw-bno'>${qna.bno}</span> | 
					<span id='rvw-writer'>작성자 :${qna.writer}</span> | 
					<span id='rvw-date'>작성일:${qna.reg_date}</span>
				</div>
				<div class='rvw-subject'>${qna.title}</div>			
				<div class='rvw-content'>${qna.content}</div>

			</li>
	</c:forEach>
	</ul>
	
</body>
</html>