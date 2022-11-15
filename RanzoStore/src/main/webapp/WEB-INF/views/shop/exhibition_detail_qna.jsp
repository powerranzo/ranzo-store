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
		<div>
			<p class='comment-notice'>게시판 운영규정에 맞지 않는 글은 사전 통보없이 삭제될 수 있습니다.<br>
			상품, 예매, 배송 등의 문의는 챗봇을 이용해주시기 바랍니다.
			</p>
		</div>
		<br>
		<div class="list-header">
			<span>총 <strong>${map.count}</strong>개의 이용 후기가 등록되었습니다.</span>
			<div>
				<a href="${path}/board/qna/write.do/${map.code}">문의하기</a>
			</div>
		</div>
		<hr>
		<ul>
			<c:forEach var="qna" items="${map.qnaInfo}">   
				<li class="qna">
					<div class="qna-info"> 
						<span id='writer'>${qna.writer}</span> | 
						<span id='date'>
							<fmt:formatDate value="${qna.reg_date}" pattern="yyyy-MM-dd" />
						</span>
					</div>
					<div class='title'>${qna.title}</div>			
					<div class='content'>${qna.content}</div>
	
				</li>
		</c:forEach>
	</ul>
	</section>
	
</body>
</html>