<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>review목록</title>
<%@ include file="../include/header.jsp" %>
</head>
<body>
<%@ include file="../include/menu.jsp" %>
<h2>Review게시판</h2>
총 ${map.count}개의 글이 있습니다.
<table border="1" style="width: 100%;">
<tr>
	<th>No.</th>
	<th>전시코드</th>
	<th>제목</th>
	<th>작성자</th>
	<th>작성일</th>
	<th>조회수</th>
</tr>
<c:forEach var="row" items="${map.list}">
	<tr>
		<td>${row.bno}</td>
		<td>${row.product}</td>
		<td>${row.title}</td>
		<td>${row.writer}</td>
		<td><fmt:formatDate value="${row.reg_date}" pattern="yyyy-MM-dd"/> </td>
		<td>${row.viewcnt}</td>
	</tr>
</c:forEach>

</table>
<div align="right">
<button type="button" id="btnWrite" onclick="location.href='${path}/board/review/write.do'">글쓰기</button>
</div>
</body>
</html>