<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QNA 게시판</title>
<%@ include file="../include/header.jsp" %>
 
<script type="text/javascript">
$(function() {
	$("#btnWrite").click(function() {
		location.href="${path}/board/qna/write.do";		
	});	
});


function list(page) {
	location.href="${path}/board/qna/list.do?curPage="+page;
}
</script>

<style type="text/css">
td {
	text-align: center;
}
</style>

</head>
<body>
<%@ include file="../include/menu.jsp" %>
<h2>QnA게시판</h2>

<table border="1" style="width: 100%;">
<tr>
	<th style="width: 10%;">No.</th>
	<th style="width: 40%;">제목</th>
	<th style="width: 20%;">작성자</th>
	<th style="width: 20%;">작성일</th>
	<th style="width: 10%;">조회수</th>
</tr>
<c:forEach var="row" items="${map.list}">
	<c:choose>
		<c:when test="${row.show == 'y'}">
		<tr>
			<td>${row.bno}</td>
			<td><a href="${path}/board/qna/view.do?bno=${row.bno}">${row.title}</a></td>
			<td>${row.name}(${row.writer})</td>
			<td><fmt:formatDate value="${row.reg_date}" pattern="yyyy-MM-dd"/> </td>
			<td>${row.viewcnt}</td>
		</tr>
		</c:when>
	</c:choose>
</c:forEach>

<!-- 페이지 네비게이션 출력 -->
	<tr>
		<td colspan="6" align="center">
			<c:if test="${map.pager.curBlock > 1}">
				<a href="#" onclick="list('1')">[처음]</a>
			</c:if>
			<c:if test="${map.pager.curBlock > 1}">
				<a href="#" onclick="list('${map.pager.prevPage}')">
				[이전]</a>
			</c:if>
			<c:forEach var="num" 
				begin="${map.pager.blockBegin}"
				end="${map.pager.blockEnd}">
				<c:choose>
					<c:when test="${num == map.pager.curPage}">
					<!-- 현재 페이지인 경우 하이퍼링크 제거 -->
						<span style="color:red;">${num}</span>
					</c:when>
					<c:otherwise>
						<a href="#" onclick="list('${num}')">${num}</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${map.pager.curBlock < map.pager.totBlock}">
				<a href="#" 
				onclick="list('${map.pager.nextPage}')">[다음]</a>
			</c:if>
			<c:if test="${map.pager.curPage < map.pager.totPage}">
				<a href="#" 
				onclick="list('${map.pager.totPage}')">[끝]</a>
			</c:if>
		</td>
	</tr>
</table>

<!-- 검색폼 -->
<div align="left">
<form name="form1" method="post" action="${path}/board/qna/list.do">
	<select name="search_option">
		<option value="all"
			<c:if test="${map.search_option == 'all'}"> selected </c:if>	>전체 검색</option>
		<option value="name"
			<c:if test="${map.search_option == 'name'}"> selected </c:if>	>이름</option>
		<option value="title" 
			<c:if test="${map.search_option == 'title'}"> selected </c:if>	>제목</option>
		<option value="content" 
			<c:if test="${map.search_option == 'content'}"> selected </c:if>	>내용</option>
	</select>
	<input name="keyword" size="80" value="${map.keyword}">
	<input type="submit" value="조회">
</form>
</div>

<div align="right">
	<button type="button" id="btnWrite">글쓰기</button>
</div>

</body>
</html>