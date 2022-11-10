<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<%@ include file="../include/header.jsp" %>
<script>

$(function() {
	$("#btnFindPwd").click(function() {
		var userid = $("#userid").val();
		var name = $("#name").val();
		var email = $("#email").val();
		if (userid == "") {
			alert("아이디를 입력하세요.");
			$("#userid").focus(); 
			return;
		}
		if (name == "") {
			alert("이름을 입력하세요.");
			$("#name").focus(); 
			return;
		}
		if (email == "") {
			alert("이메일을 입력하세요.");
			$("#email").focus();
			return;
		}
		document.findPwd.action = "${path}/member/findPwd.do";
		document.findPwd.submit();
	});		
});
 	
<c:if test="${message == 'checkAgain' }">
	console.log('message');
	alert("다시 한 번 확인해주세요.");
</c:if>

</script>
<style>
* {
	padding: 0; margin: 0;
}
.finddiv{
	width: 500px;
	height: 650px;
	padding-top:5%;
	padding-bottom:5%;
	margin: auto;
	align-items: center;
	text-align: center;
	flex: 1;
	
}
.input-field1 {
	width: 300px;
	height: 40px;
	border: 1px solid gray;
	padding: 0 10px;
	margin: 30px 0 10px 0;
}

.input-field2 {
	width: 300px;
	height: 40px;
	border: 1px solid gray;
	padding: 0 10px;
	margin-bottom: 10px;
}

.button {
	background-color: black;
	color: white;
	width: 320px;
	height: 50px;
	font-size: 17px;
	border: none;
	margin: 30px 0 30px 0;
}

.title {
	font-size: 30px;
	margin: 40px 0 15px 0;
}

.a{
	text-decoration: none;
	color: black;
	font-weight: normal; 
}

.a-div {
	text-align: center;
}

</style>
</head>
<body>
<%@ include file="../include/menu.jsp" %>
<div class="finddiv">
	<form name="findPwd" method="post">
		<div class="title">비밀번호 찾기</div>
		<p>
		
		<input class="input-field1" type="text" name="userid" id="userid"
			placeholder="아이디를 입력해주세요.">
		<p>
			<input class="input-field2" type="text" name="name" id="name"
				placeholder="이름을 입력해주세요.">
		<p>
			<input class="input-field2" type="email" name="email" id="email"
				placeholder="이메일을 입력해주세요.">
		<p>
			<button class="button" id="btnFindPwd">비밀번호 찾기</button>
		<p>
			<div class="a-div">
			<a href="javascript:history.back();" class="a">이전 화면으로 </a>|<a href="${path}/member/findIdPage.do" class="a"> 아이디 찾기</a>
			</div>
	</form>
	</div>
<footer>
<%@ include file="../include/footer.jsp"%>
</footer>
</body>
</html>