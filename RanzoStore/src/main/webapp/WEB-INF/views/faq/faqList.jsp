<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAQ</title>
<%@ include file="../include/header.jsp"%>
<style type="text/css">
.faq{
	margin: auto;
	width: 80%;
	margin-top: 10px;
}
.container{
	height: 700px;
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
#skeyword{
	width: 300px;
	padding: 5px;
} 

ul.tabs{
	margin-left: 130px;
	padding: 0px;
	list-style: none;
}
ul.tabs li{
	background: none;
	color: #222;
	display: inline-block;
	padding: 10px 15px;
	cursor: pointer;
	width:173px;
	border : 1px solid #ddd;
	text-align: center;
}

ul.tabs li.current{
	background:black;
	color: white;
}


.tab-content{
	display: none;
}

.tab-content.current{
	display: inherit;
}
.faqtable{
	width: 880px;
	margin: auto;
}
.faqtable thead{
	background-color: #f8f9fa;
	color: gray;
}
.faqtable th, .faqtable td{
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

function rlist(a){
	switch (a) {
	case 1:
		$.ajax({
			type: "post",
			data: {data:"예매/취소"},
			url: "${path}/faq/reservlist.do",
			success: function(result){
				$("#tab-2").html(result);
			}
		});	
		break;
	 case 2:
		$.ajax({
			type: "post",
			data: {data:"결제"},
			url: "${path}/faq/reservlist.do",
			success: function(result){
				$("#tab-3").html(result);
			}
		});	
		break;
	case 3:
		$.ajax({
			type: "post",
			data: {data:"회원"},
			url: "${path}/faq/reservlist.do",
			success: function(result){
				$("#tab-4").html(result);
			}
		});	
		break;
	case 4:
		$.ajax({
			type: "post",
			data: {data:"기타"},
			url: "${path}/faq/reservlist.do",
			success: function(result){
				$("#tab-5").html(result);
			}
		});	
		break;
	}
}
function list(page){
	location.href="${path}/faq/list.do?curPage="+page;
}

$(document).ready(function(){
	
	$('ul.tabs li').click(function(){
		var tab_id = $(this).attr('data-tab');

		$('ul.tabs li').removeClass('current');
		$('.tab-content').removeClass('current');

		$(this).addClass('current');
		$("#"+tab_id).addClass('current');
	})

})
</script>
</head>
<body>
<%@ include file="../include/menu.jsp"%>

<div class="faq">
<h2><a href="${path}/faq/list.do">FAQ</a></h2>


  <div class="container">
  <div class="searchdiv">
<form action="${path}/faq/list.do" name="sform" id="sform" method="post">
<select name="searchOption">
 <option value="all" selected>전체</option>
 <option value="예매/취소" <c:if test="${map.searchOption == '예매/취소'}"> selected </c:if> >예매/취소</option>
 <option value="결제" <c:if test="${map.searchOption == '결제'}"> selected </c:if> >결제</option>
 <option value="회원" <c:if test="${map.searchOption == '회원'}"> selected </c:if> >회원</option>
 <option value="기타" <c:if test="${map.searchOption == '기타'}"> selected </c:if> >기타</option>

</select>
<input type="text" placeholder="검색어를 입력하세요." id="skeyword" name="skeyword">
<input type="submit" value="검색" id="searchBtn" name="searchBtn">
</form>
</div>

	<ul class="tabs">
		<li class="tab-link current" data-tab="tab-1">전체</li>
		<li class="tab-link" data-tab="tab-2" onclick="rlist(1)">예매/취소</li>
		<li class="tab-link" data-tab="tab-3" onclick="rlist(2)">결제</li>
		<li class="tab-link" data-tab="tab-4" onclick="rlist(3)">회원</li>
		<li class="tab-link" data-tab="tab-5" onclick="rlist(4)">기타</li>
	</ul>

<div id="tab-1" class="tab-content current">
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
	</div>
<div id="tab-2" class="tab-content"></div>
<div id="tab-3" class="tab-content"></div>
<div id="tab-4" class="tab-content"></div>
<div id="tab-5" class="tab-content"></div>
</div>
</div>
<footer>
<%@ include file="../include/footer.jsp"%>
</footer>
</body>
</html>