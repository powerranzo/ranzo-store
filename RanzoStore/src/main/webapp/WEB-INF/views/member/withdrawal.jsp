<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴</title>
<%@ include file="../include/header.jsp" %>
<script>

<c:if test="${message == 'error' }">
	alert("비밀번호를 확인해주세요.");
</c:if>

</script>
<style>
* {
	box-sizing: content-box;
}

/* form {
	width: 500px;
	height: 600px;
	display: inline;
	position: absolute;
	top: 62%;
	left: 45%;
	transform: translate(-50%, -50%);
}  */

.title {
	font-size: 30px;
	margin: 80px 0 40px 0;
}

.alert {
	width: 680px;
	height: 110px;
	background-color: rgb(230, 230, 230);
	text-align: left;
	margin-bottom: 20px;
}

.h3{
 margin-top: 30px;
}

.input-field {
	width: 300px;
	height: 40px;
	border: 1px solid gray;
	padding: 0 10px;
	margin-top: 20px;
}

button {
	background-color: black;
	color: white;
	width: 320px;
	height: 50px;
	font-size: 17px;
	border: none;
	margin: 20px 0 30px 0;
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
<form method="post" action="${path}/member/deleteCheck.do">
<div><div class="div">
	<div class="title">회원 탈퇴 안내</div>
	<div class="alert">
		1. 회원탈퇴 시 고객님의 정보는 상품 반품 및 A/S를 위해 전자상거래 등에서의 소비자 보호에 관한 법률에 의거한 고객정보 보호정책에 따라 관리됩니다.<p>
		2. 탈퇴 이후에는 고객님께서 작성하셨던 게시글들은 삭제가 불가능합니다.<p>
		3. 탈퇴한 아이디는 본인관 타인 모두 재사용이 불가하오니 신중하게 선택해주시기 바랍니다.<p>
		4. 혹시 이용 과정에서 불편한 점이 있으셨다면 [1:1문의]로 내용을 남겨주세요.</div>
		
	<input type="checkbox" required> 안내 사항을 모두 이해하였으며, 이에 동의합니다.
	
	<h3 class="h3">탈퇴를 희망하신다면, 비밀번호를 다시 한번 입력해주세요.</h3> 
	
	<input type="hidden" name="userid" id="userid" value="${sessionScope.userid}">
	<input class="input-field" type="password" name="passwd" id="passwd" placeholder="비밀번호를 입력해주세요.">
	<p>
	<button>회원탈퇴</button>
</div></div>	
</form>
</body>
</html>