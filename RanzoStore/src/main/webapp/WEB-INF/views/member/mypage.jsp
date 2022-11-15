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
<link rel="stylesheet" href="${path}/resources/css/CommonDashboard.css">
<style type="text/css">
*{
	margin: 0;
}
.content{
	margin: 0 80px 0 80px;
	display: flex;
	justify-content: space-between;
}
section {
	margin-top:3%;
	width: 90%;
	float: left;
	margin-left: 50px;
	text-align: left;
}
.orderdiv {
	padding:5px;
	float: left;
	display: inline-block;
	width: 80%;
}
.profile {
	margin-top: 30px;
	width: 80%;
	height: 30%;
	background-color: rgb(230, 230, 230);
	display: flex;
	justify-content: space-between;
	padding: 50px;
}
.welcome {
	font-size: 30px;
}
.myreview, .myinfo {
	padding: 30px;
	font-size: 22px;
}
.recentOrder, .recentWish {
	display: inline-block;
	width: 35%;
	height: 300px;
	margin: 20px;
	vertical-align: top;
}
.a2 {
	text-decoration: none;
	color: gray;
	font-size: 20px;
}
.a2:hover{
	color: black;
	text-decoration: none;
	font-weight: bold;	
}

@media screen and (max-width: 1100px) {
	.profile{
		display: block;	
		height: 400px;
		background-color: rgb(230, 230, 230);
	}
	.recentOrder, .recentWish {
		display: block;
		width: 100%;
		height: 300px;
		margin: 20px;
		
	}
}

@media screen and (max-width: 800px) {
	.content{
		display: block;
		
	}
	.profile{
		width: 100%;
		
	}
}
#footer{bottom:0; margin-top:120px;}
</style>
<script type="text/javascript">
$(function(){
	orderlist();
	miniWish();
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

function miniWish(){
	$.ajax({
		url :"${path}/member/miniWish.do/${sessionScope.userid}",
		type :"POST",
		success: function(result){
			$("#miniWish").html(result);
		}
	});
}
</script>


</head>
<body>
<%@ include file="../include/menu.jsp"%>
	<div class="content">
		<%@ include file="../include/CommonDashboard.jspf"%>
		<section>
		<div class="profile">
			<div class="welcome">
			<strong>${sessionScope.name}</strong>님 <p>안녕하세요.
			</div>
			<div class="myreview">
			<img src="${path}/resources/images/pencil_icon.png" height="20">
			<a class="a2" href="${path}/member/myReview.do">나의 후기</a>
			</div>
			<div class="myinfo">
			<img src="${path}/resources/images/user_icon.png" height="20">
			<a class="a2" href="${path}/member/infoEnter.do">회원 정보</a>
			</div>
		</div>
		<div class="profile2">
		<div class="recentOrder">
			<img src="${path}/resources/images/ticket_icon.png" height="25">
			<a class="a2" href="${path}/reserv/list.do/${sessionScope.userid}">최근 예매 내역 ></a>
 			<hr noshade size="1px" color="black"> 
 			<div id="resultList"></div>
		</div>
		<div class="recentWish">
			<img src="${path}/resources/images/favorite1.png" height="25">
			<a class="a2" href="${path}/member/wishlist.do">최근 찜한 상품 ></a>
 			<hr noshade size="1px" color="black"> 
 		<div id="miniWish"></div>
		</div>
		</div>
		</section>
	</div>


	<footer>
<%@ include file="../include/footer.jsp" %>
</footer>
</body>
</html>