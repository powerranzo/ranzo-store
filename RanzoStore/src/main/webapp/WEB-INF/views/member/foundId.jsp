<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기 성공</title>
<%@ include file="../include/header.jsp" %>
<style>
* {
	box-sizing: content-box;
}

.title {
	font-size: 30px;
	margin: 80px 0 20px 0;
}

.box {
	width: 400px;
	height: 150px;
	border: 1px solid;
	text-align: center;
	margin-top: 20px;
}

.h3{
	font-size: 20px;
}

.button {
	background-color: black;
	color: white;
	width: 120px;
	height: 40px;
	font-size: 14px;
	border: none;
	margin-top: 40px;
}

div{
	text-align: center;
}

.div {
	display: inline-block;
}

</style>
</head>
<body>
<%@ include file="../include/menu.jsp" %>
<div><div class="div">
	<div class="title">회원님의 아이디를 찾았습니다.</div><br>
	<div class="box"><br>
		이름 : ${dto.name} <p>
		이메일 : ${dto.email} <p><br>
		<h3 class="h3">아이디 : ${userid}</h3>
	</div>
	
	<a href="${path}/member/login.do"><input type="button" class="button" value="로그인"></a>
	<a href="${path}/member/findPwdPage.do"><input type="button" class="button" value="비밀번호 찾기"></a>
</div></div>	
</body>
</html>