<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QnA 목록</title>
<%@ include file="../include/header.jsp" %>
<script type="text/javascript">
$(function() {
	$("#btnWrite").click(function() {
		location.href="${path}/board/qna/write.do";
	});
});
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
총 ${map.count}개의 글이 있습니다.

<table border="1" style="width: 100%;">
<tr>
	<th style="width: 10%;">No.</th>
	<th style="width: 40%;">제목</th>
	<th style="width: 20%;">작성자</th>
	<th style="width: 20%;">작성일</th>
	<th style="width: 10%;">조회수</th>
</tr>
<c:forEach var="row" items="${map.list}">
	<tr>
		<td>${row.bno}</td>
		<td><a href="${path}/board/qna/view.do?bno=${row.bno}">${row.title}</a></td>
		<td>${row.writer}</td>
		<td><fmt:formatDate value="${row.reg_date}" pattern="yyyy-MM-dd"/> </td>
		<td>${row.viewcnt}</td>
	</tr>
</c:forEach>
</table>
<div align="right">
<button type="button" id="btnWrite">글쓰기</button>
</div>
</body>
</html>