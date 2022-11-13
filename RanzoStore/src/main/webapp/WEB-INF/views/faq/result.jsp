<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<script src="${path}/include/jquery-3.6.0.min.js"></script>
<style type="text/css">
#numstyle{
	border-radius: 50%;
	background-color: black;
	color: white;
	padding: 8px 12px 8px 12px;
}
table i{
	color: silver;
}
</style>
</head>
<body>
<table class="faqtable">
	<thead>
	<tr>
		<th width="15%">카테고리</th>
		<th>제목</th>
		<th width="15%">등록일</th>
	</tr>
	</thead>
<c:forEach var="row" items="${map.list}">
	<c:if test="${row.show=='y'}">
	<tr>
		<td>${row.category}</td>
		<td><a href="${path}/faq/view.do?no=${row.no}">${row.title}</a></td>
		<td><fmt:formatDate value="${row.reg_date}" pattern="yyyy-MM-dd" /></td>
	</tr>
</c:if>
</c:forEach>
<tr>
		<td colspan="6" align="center">
			<c:if test="${map.pager.curBlock > 1}">
				<a href="#" onclick="list('1')"><i class="fa-solid fa-less-than"></i><i class="fa-solid fa-less-than"></i></a>&nbsp;&nbsp;
			</c:if>
			<c:if test="${map.pager.curBlock > 1}">
				<a href="#" onclick="list('${map.pager.prevPage}')">
				<i class="fa-solid fa-less-than"></i></a>
			</c:if>
			<c:forEach var="num" 
				begin="${map.pager.blockBegin}"
				end="${map.pager.blockEnd}">
				<c:choose>
					<c:when test="${num == map.pager.curPage}">
					<!-- 현재 페이지인 경우 하이퍼링크 제거 -->
						<span id="numstyle">${num}</span>&nbsp;
					</c:when>
					<c:otherwise>
						<a href="#" onclick="list('${num}')"><span style="color:gray;">${num}</span></a>&nbsp;
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${map.pager.curBlock < map.pager.totBlock}">
				<a href="#" 
				onclick="list('${map.pager.nextPage}')"><i class="fa-solid fa-greater-than"></i></a>&nbsp;
			</c:if>
			<c:if test="${map.pager.curPage < map.pager.totPage}">
				&nbsp;<a href="#" 
				onclick="list('${map.pager.totPage}')"><i class="fa-solid fa-greater-than"></i><i class="fa-solid fa-greater-than"></i></a>
			</c:if>
		</td>
	</tr>
</table>
</body>
</html>