<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<style type="text/css">
.payresult{
	margin: auto;
	padding-top: 100px;
	width: 500px;
	height: 650px;
	text-align: center;
}
.payresult img{
	margin: 20px;
}
#myorder{
	width: 200px;
	height: 40px;
	background-color: black;
	color: white;
	border: none;
}
#myorder:hover {
	background-color: #ddd;
	color: black;
}
</style>
<script type="text/javascript">
$(function(){
	$("#myorder").click(function(){
		location.href="${path}/reserv/list.do/${sessionScope.userid}";
	});
});
</script>
</head>
<body>
<%@ include file="../include/menu.jsp" %>
<div class="payresult">
<img src="${path}/resources/images/ticket_icon.png" width="200">
<h2>결제가 완료되었습니다.</h2>

<p>감사합니다.</p>
<br>
<button id="myorder">주문내역 확인하기</button>

</div>




<footer>
<%@ include file="../include/footer.jsp" %>
</footer>
</body>
</html>