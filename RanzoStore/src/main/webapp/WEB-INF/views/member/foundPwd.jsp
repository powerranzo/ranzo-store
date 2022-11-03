<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기 성공</title>
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
	<div class="title">임시 비밀번호가 발송되었습니다.</div><br>
	회원님의 임시 비밀번호가 입력한 이메일로 발송되었습니다.<p>
	확인 후 로그인하여 회원 정보 수정을 통해 비밀번호를 변경해주세요.<p>
	
	<a href="${path}/member/login.do"><input type="button" class="button" value="로그인"></a>
</div></div>
</body>
</html>