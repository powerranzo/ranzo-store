<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<%@ include file="../include/header.jsp" %>
<script>

 	$(function() {
 		
		$("#btnLogin").click(function() {
			var userid = $("#userid").val();
			var passwd = $("#passwd").val();
			if (userid == "") {
				alert("아이디를 입력하세요.");
				$("#userid").focus(); //입력 포커스 이동
				return;
			}
			if (passwd == "") {
				alert("비밀번호를 입력하세요.");
				$("#passwd").focus();
				return;
			}
			//폼 데이터를 서버로 제출
			document.loginForm.action = "${path}/member/loginCheck.do";
			document.loginForm.submit();
		});
	
 	<c:if test="${param.message == 'error' }">
 		console.log('message');
		alert("로그인에 실패하였습니다.");
	</c:if>
 	<c:if test="${param.message == 'nologin' }">
 		console.log('message');
		alert("로그인 후 이용가능합니다.");
	</c:if>
 	
	}); 
</script>
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
	top: 50%;
	left: 55%;
	transform: translate(-50%, -50%);
}

.input-field {
	width: 300px;
	height: 40px;
	border: 1px solid gray;
	padding: 0 10px;
	margin-bottom: 10px;
}

.button {
	background-color: black;
	color: white;
	width: 308px;
	height: 50px;
	font-size: 17px;
	border: none;
	margin-bottom: 10px;
}

.kakao{
	background-color: #FEE500;
	color: black;
	width: 308px;
	height: 50px;
	font-size: 17px;
	border: none;
	margin-bottom: 10px;
}

.title {
	font-size: 30px;
	margin: 40px 0 15px 0;
}

.msg {
	height: 30px;
	text-align: center;
	font-size: 16px;
	color: red;
	margin-bottom: 20px;
}

.a{
	text-decoration: none;
	color: black;
}

</style>
</head>
<body>
<%@ include file="../include/menu.jsp" %>
	<form name="loginForm" method="post">
		<div class="title">로그인</div>
		<p>
		
		<input class="input-field" type="text" name="userid" id="userid"
			placeholder="아이디를 입력해주세요.">
		<p>
			<input class="input-field" type="password" name="passwd" id="passwd"
				placeholder="비밀번호를 입력해주세요.">
		<p>
			<a href="#" class="a">아이디 찾기 </a>|<a href="#" class="a"> 비밀번호 찾기</a>
		<p>
			<button class="button" id="btnLogin">로그인</button>
			<a href="${path}/member/join.do"><input type="button" class="button" value="회원가입"></a>
		<p>
			<input class="kakao" type="button" value="kakao로 로그인하기">
	</form>
</body>
</html>