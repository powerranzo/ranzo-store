<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../include/header.jsp" %>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>

//회원가입 유효성 검사
var checking = false;  
var idChecking = false;  
var pwdChecking = false;  
var nameChecking = false;  
var emailChecking = false;  

function valid(){
	if(checking == false){
		if(idChecking == false){
			alert("아이디 중복 확인을 해주세요.");	
			checking = false;
		}else if(pwdChecking == false){
			alert("비밀번호를 다시 한 번 확인해주세요.");
			checking = false;
		}else if(nameChecking == false){
			alert("이름을 입력해주세요.");
			checking = false;
		}else if(emailChecking == false){
			alert("이메일을 입력해주세요.");
			checking = false;
		}else {
			checking = true;
		}
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
				idChecking = false;
				$("#idChkMsg").text("아이디를 입력한 후 눌러주세요.");
				$("#idChkMsg").css("color", "red");
			}else if(data == 1){
				idChecking = false;
				$("#idChkMsg").text("사용 중인 아이디입니다.");
				$("#idChkMsg").css("color", "red");
			}else if(data == 0){
				idChecking = true;
				$("#idChkMsg").text("사용 가능한 아이디입니다");
				$("#idChkMsg").css("color", "green");
			}
		}
	});
}

//비번 정규식 & 비번 = 비번확인 일치 검사
function pwdConfirm() {
	var passwd = $("#passwd").val();
	var passwd2 = $("#passwd2").val();
	var pwdCheck = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/;
	
	if(passwd == ""){
		pwdChecking = false;
		$("#pwdMsg").text("비밀번호를 입력해주세요.");
		$("#pwdMsg").css("color", "red");
	}else if (!pwdCheck.test(passwd)) {
		pwdChecking = false;
		$("#pwdMsg").text("비밀번호는 영문자+숫자+특수문자 조합으로 8~25자리 사용해야 합니다.");
		$("#pwdMsg").css("color", "red");
	}else if(pwdCheck.test(passwd)) {
		pwdChecking = true;
		$("#pwdMsg").text("사용 가능합니다.");
		$("#pwdMsg").css("color", "green");
	}

	if(!pwdCheck.test(passwd2)){
		pwdChecking = false;
		$("#pwdChkMsg").text("비밀번호는 영문자+숫자+특수문자 조합으로 8~25자리 사용해야 합니다.");
		$("#pwdChkMsg").css("color", "red");
	}else if(passwd == passwd2 && pwdCheck.test(passwd2)) {
		pwdChecking = true;
		$("#pwdChkMsg").text("일치합니다.");
		$("#pwdChkMsg").css("color", "green");
	}else if(passwd != passwd2) {
		pwdChecking = false;
		$("#pwdChkMsg").text("불일치합니다.");
		$("#pwdChkMsg").css("color", "red");
	}
}

// 이름 입력 안하면 알림창
function nameChk() {
	if($("#name").val() == ""){
		nameChecking = false;
	}else {
		nameChecking = true;
	}
}

// 이메일 입력 안하면 알림창
function emailChk() {
	if($("#email").val() == ""){
		emailChecking = false;
	}else {
		emailChecking = true;
	}
}


//주소 찾기
function daumZipCode() {
	new daum.Postcode({
		oncomplete: function(data) {
			var addr = ''; // 주소 변수
			var extraAddr = ''; // 참고항목 변수

			if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
				addr = data.roadAddress;
			} else { // 사용자가 지번 주소를 선택했을 경우(J)
				addr = data.jibunAddress;
			}
            
			if(data.userSelectedType === 'R'){
				if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
					extraAddr += data.bname;
				}
				if(data.buildingName !== '' && data.apartment === 'Y'){
					extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
				}
				if(extraAddr !== ''){
					extraAddr = ' (' + extraAddr + ')';
				}
				document.getElementById("addr1").value = extraAddr;
            
			} else {
				document.getElementById("addr2").value = '';
			}
				document.getElementById('zipcode').value = data.zonecode;
				document.getElementById("addr1").value = addr;
				document.getElementById("addr2").focus();
			}
		}).open();
}
    
    
</script>
<style>
* {
	box-sizing: content-box;
}

/* #joinForm {	
	display: inline;	
	position: absolute;
	transform: translate(-50%, -50%);
} */
.joindiv{
	margin: auto;
	width: 600px;
	align-items: center;
	text-align: center;
}

.input-field {
	width: 300px;
	height: 40px;
	border: 1px solid gray;
	padding: 0 10px;
	margin-top: 10px;
}

.input-field-b {
	width: 208px;
	height: 40px;
	border: 1px solid gray;
	padding: 0 10px;
	margin-top: 10px;
}

label {
	width: 100px;
	height: 30px;
	margin-top: 10px;
	text-align: left;
}

#btnJoin{
	background-color: black;
	color: white;
	width: 320px;
	height: 50px;
	font-size: 17px;
	border: none;
	margin: 20px 0 30px 0;
}

.button-s {
	background-color: black;
	color: white;
	width: 77px;
	height: 41px;
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

tr {
	height: 60px;
}


</style>
<title>회원가입</title>
</head>
<body>
<%@ include file="../include/menu.jsp" %>
<div class="joindiv">
	<form id="joinForm" method="post" action="${path}/member/insert.do" onsubmit="return valid()">
		<div class="title">회원가입</div>
		<br>
		<table>
			<tr>
				<td width="30%"><label>아이디</label></td>
				<td><input class="input-field-b" type="text" id="userid" name="userid" placeholder="아이디를 입력해주세요."> 
					<button type="button" id="btnIdChk" class="button-s" onclick="idChk()">중복확인</button>
					<div class="msg" id="idChkMsg"></div>
				</td>
			</tr>
			<p>
			<tr>
				<td><label>비밀번호</label></td>
				<td><input class="input-field" type="password" id="passwd" name="passwd" 
							onkeyup="pwdConfirm()" placeholder="8자 이상, 숫자와 특수문자 포함">
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
				<td><input class="input-field" type="text" id="name" name="name" onkeyup="nameChk()">
				</td>
			</tr>
			<p>
			<tr>
				<td><label>이메일</label></td>
				<td><input class="input-field" type="email" id="email" name="email"
					placeholder="power@ranzo.com" onkeyup="emailChk()"></td>
			</tr>
			<p>
			<tr>
				<td><label>성별</label></td>
				<td><div class="gender-chk"><input type="radio" name="gender" value="여자" checked />여자 
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
				<td><input class="input-field-b" type="text" name="zipcode" id="zipcode" placeholder="우편번호">
					<input class="button-s" type="button" onclick="daumZipCode()" value="주소찾기"></td>
			</tr>
			<tr>
				<td></td>
				<td><input class="input-field" type="text" name="addr1" id="addr1" placeholder="기본주소"></td>
			</tr>
			<tr>
				<td></td>
				<td><input class="input-field" type="text" name="addr2" id="addr2" placeholder="상세주소"></td>
			</tr>
			<tr>
				<td><input type="checkbox" checked required></td>
				<td>[필수]개인정보 수집 및 이용약관 동의</td>
			</tr>
			<tr>
				<td></td>
				<td><button id="btnJoin">회원가입</button></td>
			</tr>
		</table>
	</form>
</div>

<%@ include file="../include/footer.jsp"%>

</body>
</html>