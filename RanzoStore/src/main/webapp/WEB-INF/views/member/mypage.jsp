<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<%@ include file="../include/header.jsp" %>
<link rel="stylesheet" href="${path}/include/CommonDashboard.css">
<style>
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
	width: 80%;
	min-height: 100%;
	flex: 1;
}
.profile {
	width: 800px;
	height: 200px;
	background-color: rgb(230, 230, 230);
}
.welcome {
	font-size: 30px;
	margin-top: 40px;
	padding: 20px 70px 70px 70px;
	display: inline-block;
	width: 30%;
}
.myreview {
	font-size: 22px;
	display: inline-block;
}
.myinfo{
	font-size: 22px;
	display: inline-block;
	margin-left: 60px;
}
.recentOrder {
	margin: 20px 20px 10px 20px;
	display: inline-block;
	width: 350px;
}
.recentWish {
	margin: 20px 10px 10px 30px;
	display: inline-block;
	width: 350px;
}
@media screen and (max-width: 1000px){
	.profile{
	background-color: rgb(230, 230, 230);
	}
	.orderdiv2{
		width: 100%;
	}
	.welcome{
		margin: 10px;
		padding: 20px;
		width: 90%;		
	}
}
</style>
<script type="text/javascript">
$(function(){
	orderlist();
});
function orderlist(){
	$.ajax({
		type: "post",
		url: "${path}/reserv/mypagelist.do/${sessionScope.userid}",
		success: function(result){
			$("#resultList").html(result);
		}
	});
}


</script>


</head>
<body>
<%@ include file="../include/menu.jsp"%>
<div class="content">
<%@ include file="../include/CommonDashboard.jspf" %>
<section>
 <div class="orderdiv">
		<article class="profile">
			<div class="welcome">
			<strong>${sessionScope.name}</strong>님 <p>
			안녕하세요.
			</div>
			<div class="myreview">
			<img src="${path}/resources/images/pencil_icon.png" height="20">
			<a class="a1" href="#">나의 후기</a>
			</div>
			<div class="myinfo">
			<img src="${path}/resources/images/user_icon.png" height="20">
			<a class="a1" href="${path}/member/infoEnter.do">회원 정보</a>
			</div>
		</article>
		<article class="recentOrder">
			<div class="title-s">
			<img src="${path}/resources/images/ticket_icon.png" height="25">
			<a class="a1" href="#">최근 예매 내역 ></a></div>
 			<hr noshade size="1px" color="black"> 
 			<div id="resultList"></div>
		</article>
		<article class="recentWish">
			<div class="title-s">
			<img src="${path}/resources/images/favorite1.png" height="25">
			<a class="a1" href="#">최근 찜한 상품 ></a></div>
 			<hr noshade size="1px" color="black"> 
 			<div>아직</div>
		</article>
	 </div>
	</section>
</div>
<footer>
<%@ include file="../include/footer.jsp" %>
</footer>
</body>
</html>