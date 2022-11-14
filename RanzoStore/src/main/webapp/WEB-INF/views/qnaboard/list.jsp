<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QNA</title>
<%@ include file="../include/header.jsp" %>
<link href="../include/header.jsp" rel="stylesheet">
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<style type="text/css">
.qna{
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
.qnakeyword {
	width: 300px;
	padding: 5px;
} 
.container{
	margin: auto;
	width: 950px;
}

.qnatable{
	margin: auto;
	width: 100%;
}
.qnatable thead{
	background-color: #f8f9fa;
	color: gray;
}
.qnatable th, .qnatable td{
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
table i{
	color: silver;
}
</style>

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


</head>
<body>
<%@ include file="../include/menu.jsp" %>

<div class="qna">
<h2><a href="${path}/board/qna/list.do">QNA</a></h2>
<!-- 검색폼 -->
<div class="searchdiv">
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
	<input name="keyword" class="qnakeyword" value="${map.keyword}" placeholder="검색어를 입력하세요.">
	<input type="submit" value="조회" id="searchBtn" name="searchBtn">
	<button type="button" id="btnWrite" class="btn btn-primary pull-right">글쓰기</button>
</form>
</div>




<div class="container">

<div id="tab-1" class="tab-content current">
<table  class="qnatable">
	<thead>
		<tr>
			<th width="10%">No.</th>
			<th>제목</th>
			<th width="15%">작성자</th>
			<th width="15%">작성일</th>
			<th width="10%">조회수</th>
		</tr>
	</thead>
	
<c:forEach var="row" items="${map.list}">

			<c:choose>
      <c:when test="${row.show == 'y'}">   
      <c:choose>
      <c:when test="${sessionScope.userid == row.writer || sessionScope.admin == 'y'}">
      <tr>
         <td>${row.bno}</td>      
         <td><a href="${path}/board/qna/view.do?bno=${row.bno}">${row.title}</a></td>
         <td>${row.name}(${row.writer})</td>
         <td><fmt:formatDate value="${row.reg_date}" pattern="yyyy-MM-dd"/> </td>
         <td style="text-align: center;">${row.viewcnt}</td>
      </tr>
      </c:when>
      <c:otherwise>
      <tr>
         <td>${row.bno}</td>
         <c:choose>
          <c:when test="${row.writer=='admin'}">
           <td><a href="${path}/board/qna/view.do?bno=${row.bno}">${row.title}</a></td>
          </c:when>
          <c:otherwise>          
            <td>비밀글입니다.</td>
          </c:otherwise>
         </c:choose>
         <td>${row.name}(${row.writer})</td>
         <td><fmt:formatDate value="${row.reg_date}" pattern="yyyy-MM-dd"/> </td>
         <td style="text-align: center;">${row.viewcnt}</td>
      </tr>
      </c:otherwise>
      </c:choose>   
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
</table>
</div>

</div>
</div>

<footer>
<%@ include file="../include/footer.jsp"%>
</footer>
</body>
</html>