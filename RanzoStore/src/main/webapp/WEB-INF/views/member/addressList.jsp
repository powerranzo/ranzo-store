<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>배송지 목록</title>
<%@ include file="../include/header.jsp" %>
<style>
* {
	box-sizing: content-box;
}

.title {
	font-size: 30px;
	margin: 80px 0 40px 0;
}

.box {
	width: 680px;
	height: 155px;
	border: 1px solid;
	text-align: left;
	padding: 15px 0 10px 15px;
	margin-top: 20px;
}

.btnArea{
	text-align: right;
	padding: 0 15px 10px 0;
}

.button {
	background-color: black;
	color: white;
	width: 120px;
	height: 40px;
	font-size: 14px;
	border: none;
	margin-top: 20px;
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
	<div class="title">배송지 목록</div>
	<c:forEach items="${list}">
	<div class="box">
		배송지명 (이름) <p><br>
		[우편번호] 서울 강남구 가로수길 5, 123-4 <p>
		010-1234-5678<br>
	<div class="btnArea"><a href="#"><input type="button" class="button" value="수정"></a>
	<a href="#"><input type="button" class="button" value="삭제"></a></div>
	</div>
	</c:forEach>
 	<a href="#"><input type="button" class="button" value="등록"></a>
</div></div>	
</body>
</html>