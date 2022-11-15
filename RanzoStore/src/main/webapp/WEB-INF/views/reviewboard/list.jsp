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
	width: 880px;
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
#numstyle{
	border-radius: 50%;
	background-color: black;
	color: white;
	padding: 8px 12px 8px 12px;
}
i{
	color: silver;
}
.reviewdiv{
	text-align: center;	
	border: 1px solid #ddd;
	border-radius: 10px;
	margin:5px;
	display: inline-block; 
	width: 170px; 
	height: 280px;
	padding: 5px;
}
.reviewdiv img{
	border-radius: 10px;
}
.stardiv{
	color: orange;
	font-size: 18px;
}
.pagediv{
	width: 300px;
	margin: auto;
	text-align: center;
	margin-top: 10px;
	margin-bottom: 30px;
}
.reviewtb{
	width: 100%;
}
.reviewtb td{
	padding: 2px;
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
<c:forEach var="row" items="${map.list}">
<c:choose>
	<c:when test="${row.show == 'y'}">
<div class="reviewdiv">
 <table class="reviewtb">
  
		<tr>
   <td colspan="2">${row.name}(${row.writer})</td>
  </tr>
  <tr>
   <td colspan="2"><img src="${row.thumnail}" width="80px"></td>
  </tr>
   <tr>
   <td colspan="2" class="stardiv"><c:forEach begin="1" end="${row.rating}" step="1">
				<span class="glyphicon glyphicon-star"></span>
				</c:forEach></td>
		</tr>
  <tr>
   <td colspan="2"><a href="${path}/board/review/view.do?bno=${row.bno}">
   		<span style="font-size: 13px;">${row.subject}</span></a>
				<c:if test="${row.cnt > 0}">
					<span style="color: red;">(${row.cnt})</span>
				</c:if>
			</td>
  </tr>
  <tr>
   <td><span style="color: gray;">
   <fmt:formatDate value="${row.reg_date}" pattern="yyyy-MM-dd"/></span></td>
   <td style="text-align: right; font-size: 12px;" width="60%">| 조회수:${row.viewcnt}</td> 
  </tr>
 
 </table>
</div>
</c:when>
</c:choose>
</c:forEach>
<div class="pagediv">
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

</div>
</div>

</div>
</div>

<footer>
<%@ include file="../include/footer.jsp"%>
</footer>

</body>
</html>