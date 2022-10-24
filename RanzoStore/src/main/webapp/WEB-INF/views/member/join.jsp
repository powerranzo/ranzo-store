<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../include/header.jsp" %>
<script>

//제대로 안된 거 있으면 가입 버튼 안눌림 
var checking = false;  

function valid(){
	if(checking == false){
		$("#idChkMsg").text("아이디 중복확인을 해주세요.");
		$("#idChkMsg").css("color", "red");
	}
	return checking;
}

//아이디 중복체크
function idChk() {
	var userid = $("#userid").val();
	
	$.ajax({
		url : "${path}/member/idChk.do",
		type : "post",
		data : {"userid" : userid},
		success : function(data) {
			if(userid == ""){
				checking = false;
				$("#idChkMsg").text("아이디를 입력한 후 눌러주세요.");
				$("#idChkMsg").css("color", "red");
			}else if(data == 1){
				checking = false;
				$("#idChkMsg").text("사용 중인 아이디입니다.");
				$("#idChkMsg").css("color", "red");
			}else if(data == 0){
				checking = true;
				$("#idChkMsg").text("사용 가능한 아이디입니다");
				$("#idChkMsg").css("color", "green");
			}
		}
	});
}

//비번 정규식 & 비번 = 비번확인 검사
function pwdConfirm() {
	var passwd = $("#passwd").val();
	var passwd2 = $("#passwd2").val();
	var pwdCheck = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/;
	
	if (!pwdCheck.test(passwd)) {
		checking = false;
		$("#pwdMsg").text("비밀번호는 영문자+숫자+특수문자 조합으로 8~25자리 사용해야 합니다.");
		$("#pwdMsg").css("color", "red");
	}else if(passwd == ""){
		checking = false;
		$("#pwdMsg").text("비밀번호를 입력해주세요.");
		$("#pwdMsg").css("color", "red");
	}else {
		checking = true;
		$("#pwdMsg").text("사용 가능합니다.");
		$("#pwdMsg").css("color", "green");
	}
	
	if(!pwdCheck.test(passwd2)){
		checking = false;
		$("#pwdChkMsg").text("비밀번호는 영문자+숫자+특수문자 조합으로 8~25자리 사용해야 합니다.");
		$("#pwdChkMsg").css("color", "red");
	}else if(passwd == passwd2) {
		checking = true;
		$("#pwdChkMsg").text("일치합니다.");
		$("#pwdChkMsg").css("color", "green");
	}else {
		checking = false;
		$("#pwdChkMsg").text("불일치합니다.");
		$("#pwdChkMsg").css("color", "red");
	}
}

var name = $("#name").val();
if(name == "") {
	alert("이름을 입력하세요.");
	name.focus();
	checking = false;
};


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
	left: 50%;
	transform: translate(-50%, -50%);
}

.input-field {
	width: 300px;
	height: 40px;
	border: 1px solid gray;
	padding: 0 10px;
	margin-top: 10px;
}

.input-field-b {
	width: 210px;
	height: 40px;
	border: 1px solid gray;
	padding: 0 10px;
	margin-top: 10px;
}

label {
	width: 50px;
	height: 30px;
	margin-top: 4px;
}

button {
	background-color: black;
	color: white;
	width: 308px;
	height: 50px;
	font-size: 17px;
	border: none;
	margin: 20px 0 30px 0;
}

.button-s {
	background-color: black;
	color: white;
	width: 70px;
	height: 40px;
	font-size: 14px;
	border: none;
	margin: 20px 0 0 0;
}

.title {
	font-size: 30px;
	margin: 40px 0 15px 0;
}

.msg {
	height: 10px;
	text-align: right;
	font-size: 1px;
}

.gender-chk {
	height: 30px;
	margin-top: 4px;
}
</style>
<title>회원가입</title>
</head>
<body>
<%@ include file="../include/menu.jsp" %>
	<form id="joinForm" method="post" action="${path}/member/insert.do" onsubmit="return valid()">
		<div class="title">회원가입</div>
		<br>
		<table>
			<tr>
				<td><label>아이디</label></td>
				<td><input class="input-field-b" type="text" id="userid" name="userid" placeholder="아이디를 입력해주세요."> 
					<button type="button" id="btnIdChk" class="button-s" onclick="idChk()">중복확인</button>
					<div class="msg" id="idChkMsg"></div>
				</td>
			</tr>
			<p>
			<tr>
				<td><label>비밀번호</label></td>
				<td><input class="input-field" type="password" id="passwd" name="passwd" placeholder="8자 이상, 숫자와 특수문자 포함">
						<div class="msg" id="pwdMsg"></div>
				</td>
			</tr>
			<p>
			<tr>
				<td><label>비밀번호 확인</label></td>
				<td><input class="input-field" type="password" id="passwd2" name="passwd2"
							onkeyup="pwdConfirm()" placeholder="8자 이상, 숫자와 특수문자 포함">
						<div class="msg" id="pwdChkMsg"></div>
				</td>
			<p>
			<tr>
				<td><label>이름</label></td>
				<td><input class="input-field" type="text" id="name" name="name">
				</td>
			</tr>
			<p>
			<tr>
				<td><label>이메일</label></td>
				<td><input class="input-field" type="email" id="email" name="email"
					placeholder="power@ranzo.com"></td>
			</tr>
			<p>
			<tr>
				<td><label>성별</label></td>
				<td><div class="gender-chk"><input type="radio" name="gender" value="여자" />여자 
				<input type="radio" name="gender" value="남자" />남자
					</div></td>
			</tr>
			<p>
			<tr>
				<td><label>전화번호</label></td>
				<td><input class="input-field" type="tel" name="hp" placeholder="전화번호를 입력하세요."></td>
			</tr>
			<p>
			<tr>
				<td><label>주소</label></td>
				<td><input class="input-field-b" type="text" name="zipcode">
					<input class="button-s" type="button" value="주소찾기"></td>
			</tr>
			<tr>
				<td></td>
				<td><input class="input-field" type="text" name="addr1"></td>
			</tr>
			<tr>
				<td></td>
				<td><input class="input-field" type="text" name="addr2"></td>
			</tr>
			<tr>
				<td><input type="checkbox"></td>
				<td>[필수]개인정보 수집 및 이용약관 동의</td>
			</tr>
			<tr>
				<td></td>
				<td><button id="btnJoin">회원가입</button></td>
			</tr>
		</table>
	</form>
</body>
</html>