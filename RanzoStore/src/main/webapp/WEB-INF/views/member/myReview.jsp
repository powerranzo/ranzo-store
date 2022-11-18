<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 리뷰</title>
<%@ include file="../include/header.jsp" %>
<link rel="stylesheet" href="${path}/include/CommonDashboard.css">

<style>
* {box-sizing: content-box;}

* {
	margin:0px; 
}
.content{
	margin: 20px 80px 0 80px;

}
section {
	width: 75%;
	float: right;
	text-align: left;
}
.orderdiv {
	padding:5px;
	float: left;
	display: inline-block;
	min-height: 100%;
	width: 80%;
	flex: 1;
}
.p {
	margin: 15px 0 15px 0;
}

footer{
	clear : both;
	bottom: 0;
}

html, body{
	height: 100%;
}
body {
	display: flex;
  flex-direction: column;
  margin: 0;
}

th, td {
	border-bottom: 1px solid black;
  padding: 10px;
  text-align: center;
  height: 25px;
}
</style>

<script type="text/javascript">
function list(page){
	location.href="${path}/member/myReview.do?curPage="+page;
} 

</script>
</head>
<body>
<%@ include file="../include/menu.jsp" %>
<div class="content">
<%@ include file="../include/CommonDashboard.jspf" %>

	<section>
	 <div class="orderdiv">
		<div class="title">나의 리뷰</div>
		<p class="p">해당 게시판의 성격과 다른 글은 사전 동의 없이 담당 게시판으로 이동될 수 있습니다.</p>
		<hr noshade size="2px" width="820px" color="black">
		<table style="width: 820px;">
		<tr>
			<th style="width: 30%;">전시명</th>
			<th style="width: 40%;">제목</th>
			<th style="width: 20%;">작성일</th>
			<th style="width: 10%;">조회수</th>
		</tr>
		<c:forEach var="row" items="${map.list}">
			<c:choose>
				<c:when test="${row.show == 'y'}">
				<tr>
					<td><a href="${path}/shop/exhibition/detail/${row.product}">${row.title}</a></td>
					<td><a href="${path}/board/review/view.do?bno=${row.bno}">${row.subject}</a>
						<c:if test="${row.cnt > 0}">
							<span style="color: red;">(${row.cnt})</span>
						</c:if>
					</td>
					<td><fmt:formatDate value="${row.reg_date}" pattern="yyyy-MM-dd"/> </td>
					<td>${row.viewcnt}</td>
				</tr>
				</c:when>
			</c:choose>
		</c:forEach>

		</table>
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
		</table><br>
		</div>
	</section>

</div>

<footer>
<%@ include file="../include/footer.jsp" %>
</footer>
</body>
</html>