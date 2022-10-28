<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 수정 확인</title>
<%@ include file="../include/header.jsp" %>
<script type="text/javascript">

<c:if test="${message == 'error' }">
	alert("비밀번호를 확인해주세요.");
</c:if>

</script>
<style>
* {box-sizing: content-box;}

form {
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
	width: 700px;
}

aside {
	width: 35%;
	height: 450px;
	float: left;
	color: black;
}

.p {
	margin-bottom: 15px;
}

.a {
	text-decoration: none;
	color: black;
	font-weight: normal;
}

.check {
	margin: 30px 0 0 165px;
}

.input-field {
	width: 300px;
	height: 40px;
	border: 1px solid gray;
	padding: 0 10px;
}

.msg {
	height: 10px;
	text-align: right;
	font-size: 1px;
}

button {
	background-color: black;
	color: white;
	width: 320px;
	height: 50px;
	font-size: 17px;
	border: none;
	margin: 50px 0 30px 190px;
}

</style>
</head>
<body>
<%@ include file="../include/menu.jsp" %>
<form method="post" action="${path}/member/infoEnterCheck.do">
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
		<a class="a" href="#">개인정보 변경/탈퇴</a>
	</aside>
	
	<section>
		<div class="title">개인 정보 수정</div>
		<div class="title-s">비밀번호 재확인</div>
		<p class="p">회원님의 정보를 안전하게 보호하기 위해 비밀번호를 다시 한번 확인해주세요.</p>
		<hr noshade size="2px" width="700px" color="black">
		<div class="check">
			<table>
				<tr height="50px">
					<td width="70px">아이디</td>
					<td><input class="input-field" value="${sessionScope.userid}" name="userid" id="userid" readonly="readonly"></td>
				</tr>
				<tr height="50px">
					<td>비밀번호</td>
					<td><input class="input-field" type="password" name="passwd" id="passwd"
					placeholder="비밀번호를 입력해주세요.">
					<div class="msg" id="pwdMsg"></div></td>
				</tr>
			</table>
		</div>
		<p style="margin: 50px 0 30px 0">
		<hr noshade size="1px" width="700px" color="black">
		<button id="btnCheck">확인</button>
	</section>

</form>
</body>
</html>