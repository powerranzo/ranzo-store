<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>티켓예매 목록</title>
<%@ include file="../include/header.jsp" %>
<link rel="stylesheet" href="${path}/resources/css/CommonDashboard.css">
<style type="text/css">
<style type="text/css">
* {
	margin:0px; 
}
.content{
	margin: 0 80px 0 80px;
	display: flex;
	justify-content: space-between;
}
section {
	width: 75%;
	float: right;
	text-align: left;
}
.p {
	margin: 15px 0 15px 0;
}
.orderdiv {
	padding: 50px 0 0 0;
	float: left;
	display: inline-block;
	min-height: 100%;
	width: 80%;
	flex: 1;
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

.orderul li {
	display: inline-block;
	padding-top: 20px;
	padding-left: 3px;
}
.filterDate{
	border: 1px solid #e4e4e4;
	padding: 7px;
	width: 85px;
	text-align: center;
	background: none;
}
.filterDate:hover {
	background-color: black;
	color: white;
}
#strDate, #endDate{
	padding: 7px;
	border: 1px solid #e4e4e4;
}
.datediv {
	margin: 10px 0 0 0;
}

@media screen and (max-width: 800px) {
	.content{
		display: block;
	}
	.orderdiv {
		width:100%;
	}
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
function date(d) {
	$.ajax({
		type: "post",
		data: "filterDate="+$("#filterDate").val(),
		url: "${path}/reserv/date.do",
		success: function(result){
			switch (d) {
			case 1:
			 var now = new Date();
			 var week= new Date(now.setDate(now.getDate()-7));
			 document.getElementById("strDate").setAttribute("value", week.toISOString().substring(0, 10));
			 document.getElementById("endDate").setAttribute("value", new Date().toISOString().substring(0, 10));			
				break;
			case 2:
				var now = new Date();
				var month1= new Date(now.setMonth(now.getMonth()-1));
				document.getElementById("strDate").setAttribute("value", month1.toISOString().substring(0, 10));
				document.getElementById("endDate").setAttribute("value", new Date().toISOString().substring(0, 10));			
				break;
			case 3:
				var now = new Date();
				var month3= new Date(now.setMonth(now.getMonth()-3));
				document.getElementById("strDate").setAttribute("value", month3.toISOString().substring(0, 10));
				document.getElementById("endDate").setAttribute("value", new Date().toISOString().substring(0, 10));			
				break;
			case 4:
				var now = new Date();
				var month6= new Date(now.setMonth(now.getMonth()-6));
				document.getElementById("strDate").setAttribute("value", month6.toISOString().substring(0, 10));
				document.getElementById("endDate").setAttribute("value", new Date().toISOString().substring(0, 10));			
				break;
			}
		}
	});	
}
function list(page){
	location.href="${path}/reserv/list2.do/${sessionScope.userid}?curPage="+page;
} 

</script>
</head>
<%@ include file="../include/menu.jsp" %>

<div class="content">
<%@ include file="../include/CommonDashboard.jspf" %>
<section>
<div class="orderdiv">
<div class="title">티켓예매 목록</div>
<p class="p"><span style="color: #fa5041;">예매번호</span>를 클릭하면 예매 상세 내용을 확인할 수 있습니다.</p>
<hr noshade size="2px" width="820px" color="black">
<form action="${path}/reserv/list2.do/${sessionScope.userid}" method="post" name="orderlist">
<div class="datediv">
 <button type="button" name="filterDate" value="1" onclick="date(1)" class="filterDate">1주일</button>
 <button type="button" name="filterDate" value="2" onclick="date(2)" class="filterDate">1개월</button>
 <button type="button" name="filterDate" value="3" onclick="date(3)" class="filterDate">3개월</button>
 <button type="button" name="filterDate" value="4" onclick="date(4)" class="filterDate">6개월</button>
 <input name="strDate" id="strDate" type="date" value="${dto.strDate}">
  <span> ~ </span>
 <input name="endDate" id="endDate" type="date" value="${dto.endDate}"> 
<button name="btnSearch" id="btnSearch" class="filterDate">검색</button>
</div>
</form>
<table class="ordertable">
<tr>
 <th width="10%">예매번호</th>
 <th>전시명</th>
 <th width="15%">관람일</th>
 <th width="10%">매수</th>
 <th width="15%">상태</th>
</tr>
<c:forEach var="row" items="${map.list}">
<tr>
 <td ><a href="${path}/reserv/orderdetail/${row.no}">${row.no}</a></td>
 <td>${row.title}</td>
 <td><fmt:formatDate value="${row.res_date}" pattern="yyyy-MM-dd" /></td>
 <td>${row.quantity}장</td>
 <td>
  <c:choose>
  <c:when test="${row.pay=='y'}">
   <span style="color: #fa5041;">예매완료</span>
  </c:when>
  <c:otherwise>
   <p style="color: #fa5041;">취소</p>
  </c:otherwise>
 </c:choose>
</td>
</tr>
</c:forEach>
<!-- 페이지 네비게이션 출력 -->
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
</section>
</div>
<div align="center">
<footer>
<%@ include file="../include/footer.jsp" %>
</footer>
</div>
</body>
</html>