<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://kit.fontawesome.com/3e5be1b969.js" crossorigin="anonymous"></script>
<title>about</title>
<%@ include file="../include/header.jsp"%>
<style type="text/css">
.ranzo{
	margin: auto;
	width: 80%;

}
.ranzo h2{
	font-size: 80px;
}
.rtable{
	width: 70%;
	margin: 20px 0px;
}
.rtable th, td{
	padding: 8px;
	border-bottom: 1px dotted #ddd;
}
.ranzo img{
	opacity: 0.5;
}
.ranzo2 {
	padding: 20px 50px;
	margin: auto;
}
</style>
</head>
<body>
<%@ include file="../include/menu.jsp"%>
<div class="ranzo">
<h2>power ranzo</h2>
<h3 style="color: gray;">&nbsp;"고객을 위한 최고의 티켓예매 서비스를 제공하기 위해 앞장서는 사람들이 모인 곳"</h3>
<div class="ranzo2">
대한민국의 모든 전시를 손쉽고 빠르게 예매할 수 있는 안정적인 서비스를 제공합니다.<br>
끊임없는 연구와 투자를 통해 삶의 질을 풍요롭게 하는 전시문화 발전을 선도하며 <br>
앞으로도 보다 나은 서비스를 제공하기 위해 노력 하겠습니다.

<table class="rtable">
	<tr>
		<th>회사명</th>
		<td>주식회사 파워레인조</td> 
	</tr>	
	<tr>
		<th>설립일</th>
		<td>2022년 11월 18일</td> 
	</tr>
	<tr>
		<th>사업분야</th>
		<td>온라인 티켓 예매 서비스(전시)</td> 
	</tr>
	<tr>
		<th>조원</th>
		<td>송민지, 김수현, 김현아, 윤소라, 최규리</td> 
	</tr>
</table>
<img alt="" src="${path}/resources/images/powerranzo.png" width="60%">
</div>
</div>




<footer>
<%@ include file="../include/footer.jsp"%>
</footer>
</body>
</html>