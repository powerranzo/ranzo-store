<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 성공</title>
<%@ include file="../include/header.jsp"%>
<style>
* {
	box-sizing: content-box;
}

form {
	width: 500px;
	height: 600px;
	display: inline;
	align-items: center;
	position: absolute;
	top: 80%;
	left: 50%;
	transform: translate(-50%, -50%);
}

body {
	text-align: center;
}

.name {
	color: #2968c1;
}

.button {
	background-color: black;
	color: white;
	width: 70px;
	height: 40px;
	font-size: 14px;
	border: none;
	margin-top: 40px;
}
</style>
</head>
<body>
	<%@ include file="../include/menu.jsp"%>
	<form>
		<h1><strong class="name">${param.name}</strong>님의 가입을 환영합니다!</h1>
		<br>
		ranzo store와 함께 일상을 더 다채롭게 만들어보세요!
		<p>
			<a href="${path}"><input type="button" class="button" value="홈으로"></a>
			<a href="${path}/member/login.do"><input type="button" class="button" value="로그인"></a>
	</form>
</body>
</html>