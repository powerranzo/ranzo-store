<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 상품 문의</title>
<%@ include file="../include/header.jsp" %>
<link rel="stylesheet" href="${path}/resources/css/CommonDashboard.css">

<style>
* {box-sizing: content-box;}

* {
	margin:0px; 
}
.content{

	margin: 0px 80px 0 80px;


}
section {
	width: 75%;
	float: right;
	text-align: left;
}
.orderdiv {
	padding: 50px 0 0 0;
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

.orderdiv a:hover{ font-weight: bold;}
.orderdiv a:visited{ text-decoration: none; color: black;}
.orderdiv a:link { text-decoration: none; color:black; }
.orderdiv a:active { text-decoration: none; color:black;}
.ordertable{
	margin-top:10px;
	text-align: left;
	width: 100%;
	border-collapse: collapse;
}
.ordertable th {
	border-top: 2px solid #e4e4e4;
	background-color: #f8f9fa;
	color: #7b7e83;
}
.ordertable td{	border-bottom: 1px solid #e4e4e4;}
.ordertable th, td{ padding: 10px;}
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
<script type="text/javascript">
function list(page){
	location.href="${path}/member/myInquiry.do?curPage="+page;
} 
</script>
</head>
<body>
<%@ include file="../include/menu.jsp" %>
<div class="content">
<%@ include file="../include/CommonDashboard.jspf" %>

	<section>
	 <div class="orderdiv">
		<div class="title">나의 상품 문의</div>
		<p class="p">해당 게시판의 성격과 다른 글은 사전 동의 없이 담당 게시판으로 이동될 수 있습니다.</p>
		<hr noshade size="1px" width="820px" color="black">
		<table style="width: 820px;" class="ordertable">
		<tr>
			<th style="width:12%; text-align: center;">문의번호</th>
			<th>제목</th>
			<th style="width: 20%;">작성일</th>
			<th style="width: 10%; text-align: center;">조회수</th>
		</tr>
		<c:forEach var="row" items="${map.list}">
			<c:choose>
				<c:when test="${row.show == 'y'}">
				<tr>
					<td style="text-align: center;">${row.bno}</td>
					<td><a href="${path}/board/qna/view.do?bno=${row.bno}">${row.title}</a></td>
					<td><fmt:formatDate value="${row.reg_date}" pattern="yyyy-MM-dd"/> </td>
					<td style="text-align: center;">${row.viewcnt}</td>
				</tr>
				</c:when>
			</c:choose>
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
		</table><br>
		</div>
	</section>

</div>

<footer>
<%@ include file="../include/footer.jsp" %>
</footer>
</body>
</html>