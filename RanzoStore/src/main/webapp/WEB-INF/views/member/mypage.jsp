<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<%@ include file="../include/header.jsp" %>
<style>
* {box-sizing: content-box;}

.body {
	width: 500px;
	height: 600px;
	display: inline-block;
	align-items: center;
	position: absolute;
	top: 60%;
	left: 35%;
	transform: translate(-50%, -50%);
}

.title {
	font-size: 30px;
	margin-top: 40px;
}

.title-s {
	font-size: 20px;
	margin: 30px 0 15px 0;
}

section {
	margin-left: 50%;	
}

aside {
	width: 35%;
	height: 450px;
	float: left;
	color: black;
}

.profile {
	width: 700px;
	height: 200px;
	background-color: rgb(230, 230, 230);
}

.welcome {
	font-size: 30px;
	margin-top: 40px;
	padding: 20px 70px 70px 70px;
	display: inline-block;
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

.recentMenu {
	width: 700px;
}

.recentOrder {
	margin-top: 20px;
	display: inline-block;
}

.recentWish {
	margin: 20px 0 0 70px;
	display: inline-block;
}

.a {
	text-decoration: none;
	color: black;
	font-weight: normal;
}

</style>
</head>
<body>
<%@ include file="../include/menu.jsp"%>
<div class="body">
	<div class="title">MY PAGE</div>
	<aside>
		<div class="title-s">MY SHOPPING</div>
		<hr noshade size="1px" color="black"><br>
		<a class="a" href="#">주문내역</a>
		<p><br>
		<a class="a" href="#">취소/반품내역</a>
		<p><br>
		<a class="a" href="#">위시리스트</a>
		<p><br>
		<a class="a" href="#">배송지관리</a>
		<p><br>
		<a class="a" href="#">고객리뷰</a>
		<p><br>
		<a class="a" href="#">상품문의</a>
		<p><br>
		<div class="title-s">MY INFO</div>
		<hr noshade size="1px" color="black"><br>
		<a class="a" href="${path}/member/infoEnter.do">개인정보 변경/탈퇴</a>
	</aside>

	<section>
		<article class="profile">
			<div class="welcome">
			<strong>${sessionScope.name}</strong>님 <p>
			안녕하세요.
			</div>
			<div class="myreview">
			<img src="${path}/resources/images/pencil_icon.png" height="20">
			<a class="a" href="#">나의 후기</a>
			</div>
			<div class="myinfo">
			<img src="${path}/resources/images/user_icon.png" height="20">
			<a class="a" href="${path}/member/infoEnter.do">회원 정보</a>
			</div>
		</article>
	</section>
	
	<section class="recentMenu">
		<article class="recentOrder">
			<div class="title-s"><a class="a" href="#">최근 예매 내역 ></a></div>
 			<hr noshade size="1px" width="310px" color="black"> 
 			<div>최근 예매 내역이 없습니다.</div>
		</article>
		<article class="recentWish">
			<div class="title-s"><a class="a" href="#">최근 찜한 상품 ></a></div>
 			<hr noshade size="1px" width="310px" color="black"> 
 			<div>아직</div>
		</article>
	</section>
</div>
</body>
</html>