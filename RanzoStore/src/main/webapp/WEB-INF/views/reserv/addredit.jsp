<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp"%>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style type="text/css">
.rdiv {
	padding: 20px;
  display: flex;
	justify-content: center;
	width: 80%;
}
.rtable {
	margin: auto;
}
.rtable td {
	padding: 8px;
}
.rtable input {
	padding: 8px;
}
#ebtn{
	padding: 10px;
	width: 100%;
	background-color: black;
	color: white;
}
</style>
<script>
    function daumZipCode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("r_addr1").value = extraAddr;
                
                } else {
                    document.getElementById("r_addr2").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('r_zipcode').value = data.zonecode;
                document.getElementById("r_addr1").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("r_addr2").focus();
            }
        }).open();
    }
</script>
</head>
<body>
<%@ include file="../include/menu.jsp"%>
<div class="rdiv">
<form name="addrform" method="post" action="${path}/reserv/update/${dto.no}">
<table class="rtable">
 <tr>
  <td colspan="2"><h2>배송정보 수정</h2></td>
 </tr>
 <tr>
  <td>받는 사람</td>
  <td><input id="r_name" name="r_name" value="${dto.r_name}"></td>
 </tr>
  <tr>
  <td>연락처</td>
  <td><input id="r_hp" name="r_hp" value="${dto.r_hp}"></td>
 </tr>
  <tr>
  <td>주소</td>
  <td><input name="r_zipcode" id="r_zipcode" size="10" value="${dto.r_zipcode}" readonly>
 <input type="button" onclick="daumZipCode()" value="우편번호 찾기"></td>
 </tr>
 <tr>
  <td>&nbsp;</td>
  <td><input id="r_addr1" name="r_addr1" size="40" value="${dto.r_addr1}"></td>
 </tr>
 <tr>
  <td><input type="hidden" id="edit" name="edit" value="1"></td>
  <td><input id="r_addr2" name="r_addr2" size="40" value="${dto.r_addr2}"></td>
 </tr>
 <tr>
  <td>&nbsp;</td>
  <td style="text-align: center;"><button id="ebtn">수정</button></td>
 </tr>
 <tr>
  <td>

</td>
 </tr>
 
</table>

</form>
</div>

</body>
</html>