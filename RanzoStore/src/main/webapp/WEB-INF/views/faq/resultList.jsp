<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp"%>
<script type="text/javascript">
function list(page){
	location.href="${path}/faq/list.do?curPage="+page;
} 
</script>
<style type="text/css">
.container{
	margin: auto;
	width: 1000px;
}
</style>
</head>
<body>
<div class="container">
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
</div>

</body>
</html>