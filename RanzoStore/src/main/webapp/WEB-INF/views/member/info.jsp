<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정</title>
<%@ include file="../include/header.jsp" %>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>

var checking = false;
var pwdChecking = false;  
var nameChecking = false; 

//비번 정규식 & 비번 = 비번확인 일치 검사
function pwdConfirm() {
	var passwd = $("#passwd").val();
	var passwd2 = $("#passwd2").val();
	var pwdCheck = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/;
	
	if(passwd == ""){
		$("#pwdMsg").text("비밀번호를 입력해주세요.");
		$("#pwdMsg").css("color", "red");
		pwdChecking = false;
	}else if (!pwdCheck.test(passwd)) {
		$("#pwdMsg").text("비밀번호는 영문자+숫자+특수문자 조합으로 8~25자리 사용해야 합니다.");
		$("#pwdMsg").css("color", "red");
		pwdChecking = false;
	}else if(pwdCheck.test(passwd)) {
		$("#pwdMsg").text("사용 가능합니다.");
		$("#pwdMsg").css("color", "green");
		pwdChecking = true;
	}

	if(!pwdCheck.test(passwd2)){
		$("#pwdChkMsg").text("비밀번호는 영문자+숫자+특수문자 조합으로 8~25자리 사용해야 합니다.");
		$("#pwdChkMsg").css("color", "red");
		pwdChecking = false;
	}else if(passwd == passwd2 && pwdCheck.test(passwd2)) {
		$("#pwdChkMsg").text("일치합니다.");
		$("#pwdChkMsg").css("color", "green");
		pwdChecking = true;
	}else if(passwd != passwd2) {
		$("#pwdChkMsg").text("불일치합니다.");
		$("#pwdChkMsg").css("color", "red");
		pwdChecking = false;
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

//회원 정보 유효성 검사
function valid(){
	if(checking == false){
		if(pwdChecking == false){
			alertify.alert("비밀번호를 다시 한 번 확인해주세요.");
			checking = false;
		}else if(nameChecking == false){
			alertify.alert("이름을 입력해주세요.");
			checking = false;
		}else {
			checking = true;
		}
	}
	return checking;
}

//회원 정보 수정
$(function(){
	$("#btnUpdate").click(function(){
		if(valid()){
			document.infoForm.action="${path}/member/update.do";
			document.infoForm.submit();
		}
	});
}); 

//회원 탈퇴 -> 뉴 모달창 버전
$(function() {
	$("#btnWithdrawal").click(function(){
		alertify.confirm("탈퇴하시겠습니까?",
			function(){
				document.infoForm.action="${path}/member/withdrawal.do";
				document.infoForm.submit();
			});
	});
});


/* //회원 탈퇴 -> 일반 모달창 버전
$(function() {
	$("#btnDelete").click(function(){
		if(confirm("탈퇴하시겠습니까?")){
			document.infoForm.action="${path}/member/withdrawal.do";
			document.infoForm.submit();
		}
	});
}); */


//주소 찾기
function daumZipCode() {
	new daum.Postcode({
		oncomplete: function(data) {
			
			var addr = ''; 
			var extraAddr = ''; 

			if (data.userSelectedType === 'R') { 
				addr = data.roadAddress;
			} else { 
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

form {
	width: 500px;
	height: 600px;
	display: inline;
	align-items: center;
	position: absolute;
	top: 60%;
	left: 51%;
	transform: translate(-50%, -50%);
}

.input-field {
	width: 300px;
	height: 40px;
	border: 1px solid gray;
	padding: 0 10px;
}

.input-field-b {
	width: 210px;
	height: 40px;
	border: 1px solid gray;
	padding: 0 10px;
}

label {
	height: 30px;
	margin-top: 4px;
}

.button {
	background-color: black;
	color: white;
	width: 141px;
	height: 50px;
	font-size: 17px;
	border: none;
	margin: 40px 0 50px 0;
}

.button-s {
	background-color: black;
	color: white;
	width: 75px;
	height: 41px;
	font-size: 14px;
	border: none;
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

tr{
	height: 60px;
}

</style>
</head>
<body>
<%@ include file="../include/menu.jsp" %>
	<form name="infoForm" method="post">
		<div class="title">회원정보 수정</div>
		<br>
		<table>
			<tr>
				<td width="30%"><label>아이디</label></td>
				<td><input class="input-field" value="${dto.userid}" name="userid" id="userid" readonly="readonly"></td>
			</tr>
			<p>
			<tr>
				<td><label>새 비밀번호</label></td>
				<td><input class="input-field" type="password" id="passwd" name="passwd" 
							onkeyup="pwdConfirm()" placeholder="8자 이상, 숫자와 특수문자 포함">
						<div class="msg" id="pwdMsg"></div>
				</td>
			</tr>
			<p>
			<tr>
				<td><label>새 비밀번호 확인</label></td>
				<td><input class="input-field" type="password" id="passwd2" name="passwd2"
							onkeyup="pwdConfirm()" placeholder="8자 이상, 숫자와 특수문자 포함">
						<div class="msg" id="pwdChkMsg"></div>
				</td>
			<p>
			<tr>
				<td><label>이름</label></td>
				<td><input class="input-field" type="text" id="name" name="name" onkeyup="nameChk()" value="${dto.name}">
				</td>
			</tr>
			<p>
			<tr>
				<td><label>이메일</label></td>
				<td><input class="input-field" type="email" id="email" name="email"
					 value="${dto.email}"></td>
			</tr>
			<p>
			<tr>
				<td><label>전화번호</label></td>
				<td><input class="input-field" type="tel" name="hp" value="${dto.hp}"></td>
			</tr>
			<p>
			<tr>
				<td><label>주소</label></td>
				<td><input class="input-field-b" type="text" name="zipcode" id="zipcode" value="${dto.zipcode}">
					<input class="button-s" type="button" onclick="daumZipCode()" value="주소찾기"></td>
			</tr>
			<tr>
				<td></td>
				<td><input class="input-field" type="text" name="addr1" id="addr1" value="${dto.addr1}"></td>
			</tr>
			<tr>
				<td></td>
				<td><input class="input-field" type="text" name="addr2" id="addr2" value="${dto.addr2}"></td>
			</tr>
			<tr>
				<td colspan="2"><input type="button" id="btnUpdate" class="button" value="회원정보수정">
				<input type="button" class="button" value="취소" onclick="history.back(-1)">
				<input type="button" id="btnWithdrawal" class="button" value="회원탈퇴"></td>
			</tr>
		</table>
	</form>
</body>
</html>