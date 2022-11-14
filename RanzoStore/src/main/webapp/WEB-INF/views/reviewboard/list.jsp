<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>REVIEW</title>
<%@ include file="../include/header.jsp" %>
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link href="../include/style.css" rel="stylesheet">

<style type="text/css">
.review{
	margin: auto;
	width: 80%;
	margin-top: 10px;
}
h2 a:link{text-decoration: none; color: black;}
h2 a:visited{text-decoration: none; color: black;}
h2 a:active{text-decoration: none; color: black;}
.searchdiv {
	background-color: #ecedf2;
	height: 100px;
	width: 75%;
	text-align: center;
	margin: auto;
	margin-bottom: 20px;
	padding: 35px;
}
.searchdiv select {
	width: 150px;
	padding: 7px;
}
.reviewkeyword{
	width: 300px;
	padding: 5px;
} 
.container{
	margin: auto;
	width: 950px;
}

.reviewtable{
	margin: auto;
	width: 100%;
}
.reviewtable thead{
	background-color: #f8f9fa;
	color: gray;
}
.reviewtable th, .reviewtable td{
	padding: 10px;
}
#searchBtn{
	width: 90px;
	height:35px;
	background-color: black;
	color: white;
	border-radius: 5px;
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
</style>


<script type="text/javascript">
function list(page) {
	location.href="${path}/board/review/list.do?curPage="+page;
}
</script>
</head>
<body>
<%@ include file="../include/menu.jsp" %>

<div class="review">
<h2><a href="${path}/board/review/list.do">REVIEW</a></h2>
<!-- 검색폼 -->
<div class="searchdiv">
<form name="form1" method="post" action="${path}/board/review/list.do">
	<select name="search_option">
		<option value="all"
			<c:if test="${map.search_option == 'all'}"> selected </c:if>	>전체 검색</option>
		<option value="title"
			<c:if test="${map.search_option == 'title'}"> selected </c:if>  >전시명</option>
		<option value="subject" 
			<c:if test="${map.search_option == 'subject'}"> selected </c:if>	>제목</option>
		<option value="content" 
			<c:if test="${map.search_option == 'content'}"> selected </c:if>	>내용</option>
		<option value="name"
			<c:if test="${map.search_option == 'name'}"> selected </c:if>	 >이름</option>
	</select>
	<input name="keyword" class="reviewkeyword" value="${map.keyword}">
	<input type="submit" value="조회" id="searchBtn" name="searchBtn">
	<button type="button" id="btnWrite" onclick="location.href='${path}/board/review/write.do'" class="btn btn-primary pull-right">글쓰기</button>
</form>
</div>




<div class="container">

<div id="tab-1" class="tab-content current">
<table class="reviewtable">
<thead>
	<tr>
		<th>No.</th>
		<th>별점</th>
		<th>전시명</th>
		<th>제목</th>
		<th>작성자</th>
		<th>작성일</th>
		<th>조회수</th>
	</tr>
</thead>

<c:forEach var="row" items="${map.list}">
<c:choose>
	<c:when test="${row.show == 'y'}">
		<tr>
			<td>${row.bno}</td>
			<td>
				<c:forEach begin="1" end="${row.rating}" step="1">
					<span class="glyphicon glyphicon-star"></span>
				</c:forEach>
			</td>
			<td><a href="${path}/shop/exhibition/detail/${row.product}">${row.title}</a></td>
			<td><a href="${path}/board/review/view.do?bno=${row.bno}">${row.subject}</a>
				<c:if test="${row.cnt > 0}">
					<span style="color: red;">(${row.cnt})</span>
				</c:if>
			</td>
			<td>${row.name}(${row.writer})</td>
			<td><fmt:formatDate value="${row.reg_date}" pattern="yyyy-MM-dd"/> </td>
			<td>${row.viewcnt}</td>
		</tr>
	</c:when>
</c:choose>
</c:forEach>

<!-- 페이지 네비게이션 출력 -->
	<tr>
		<td colspan="7" align="center">
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

</div>
</div>

<footer>
<%@ include file="../include/footer.jsp"%>
</footer>

</body>
</html>