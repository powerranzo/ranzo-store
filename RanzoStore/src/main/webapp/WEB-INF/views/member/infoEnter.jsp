<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 수정 확인</title>
<%@ include file="../include/header.jsp" %>
<link rel="stylesheet" href="${path}/resources/css/CommonDashboard.css">
<script type="text/javascript">
<c:if test="${message == 'error' }">
	alert("비밀번호를 확인해주세요.");
</c:if>
</script>
<style>
* {
	margin:0px; 
}
.content{
	margin: 0 80px 0 80px;
}
section {
	margin-top:6%;
	width: 75%;
	float: left;
	margin-left: 50px;
	text-align: left;
}
.orderdiv {
	padding:0 0 0 50px;
	float: left;
	display: inline-block;
	width: 90%;
/* 	min-height: 100%;
	flex: 1; */
}
.p {
	margin-bottom: 15px;
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

#btnCheck{
	background-color: black;
	color: white;
	width: 320px;
	height: 50px;
	font-size: 17px;
	border: none;
	margin: 50px 0 30px 190px;
}
footer{
	clear : both;
	bottom: 0;
}
html, body{
	height: 100%;
}
body {
	display: flex;
  flex-direction: column;
  margin: 0;
}
</style>
</head>
<body>
<%@ include file="../include/menu.jsp" %>
<form method="post" action="${path}/member/infoEnterCheck.do">
<div class="content">
<%@ include file="../include/CommonDashboard.jspf" %>

	<section>
	 <div class="orderdiv">
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
		</div>
	</section>

</div>
</form>

<footer>
<%@ include file="../include/footer.jsp" %>
</footer>
</body>
</html>