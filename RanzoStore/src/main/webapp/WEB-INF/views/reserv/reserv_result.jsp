<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<style type="text/css">
.div1{
	text-align: center;
	margin: auto;
	padding: 20px;
}
.table1{
	margin: auto;
	padding: 10px;
	width: 80%;
	text-align: center;
}
.table1 thead td{
	border: 1px solid black;
	padding: 15px;
	background-color: black;
	color: white;	
}

.table1 td{
	padding:10px;
}
.paydiv{
	border-bottom: 1px solid #ddd;
	padding: 10px;
}
.paydiv2{
	border: 1px solid #ddd;
	padding: 10px;
}
#payButton{
	margin: 5px;
	padding: 10px;
	width: 97%;
	height: 50px;
	background:#eeeeee;
	color:#cccccc;
	border: none;
}
</style>
<script type="text/javascript">
/* 버튼 활성화 */
function check(frm){
  if(frm.payButton.disabled==true){
    frm.payButton.disabled=false
    $("#payButton").css({"backgroundColor":"black","color":"white"});
   }
   else {
    frm.payButton.disabled=true
    $("#payButton").css({"backgroundColor":"#eeeeee","color":"#cccccc"});
   }
}

</script>
</head>
<body>
<%@ include file="../include/menu.jsp" %>

<form name="pay" method="post" id="form" action="">
<div class="div1">
<table class="table1">
<thead>
 <tr>
  <td width="33%">01. 티켓 선택</td>
  <td width="33%">02. 관람일/인원 선택</td>
  <td width="33%">03. 결제</td>
 </tr>
 </thead>
 <tr>
  <td colspan="2" style="text-align: left;"> 
   <div class="paydiv"><h2>티켓정보</h2></div>
   <div class="paydiv">
   <table>
    <tr>
     <td>전시명</td>
     <td><h1>${dto.title}</h1><input type="hidden" id="code" name="code" value="${dto.code}"></td>
    </tr>
    <tr>
     <td>관람일시</td>
     <td>${res_date}<input type="hidden" id="res_date" name="res_date" value="${res_date}"></td>
   </tr>
   <tr>
     <td>장소</td>
     <td>${dto.gallery}</td>
   </tr>
   </table>

   </div>
   <div class="paydiv">
    <table width="100%">
    <c:if test="${adult>0}">
    <tr>
     <td>성인</td>
     <td>18,000원</td>
     <td>${adult}인<input type="hidden" id="adult" name="adult" value="${adult}"></td>
     <td style="text-align: right;"><strong>${adult*18000}원</strong></td>
    </tr>
    </c:if>
     <c:if test="${teen>0}">
    <tr>
     <td>청소년</td>
     <td>9,000원</td>
     <td>${teen}인<input type="hidden" id="teen" name="teen" value="${teen}"></td>
     <td style="text-align: right;"><strong>${teen*9000}원</strong></td>
    </tr>
    </c:if>
    <c:if test="${kids>0}">
    <tr>
     <td>유아 및 어린이</td>
     <td>6,000원</td>
     <td>${kids}인<input type="hidden" id="kids" name="kids" value="${kids}"></td>
     <td style="text-align: right;"><strong>${kids*6000}원</strong></td>
    </tr>
    </c:if>
   </table>
   </div>
  </td>
  <td style="text-align: left;">
   <div class="paydiv2">
     <table width="100%">
      <tr>
       <td style="text-align: left;"><h2>결제정보</h2></td>
      </tr>
      <tr>
       <td style="text-align: left;">총금액/${adult + teen + kids}매
       <input type="hidden" id="quantity" name="quantity" value="${adult + teen + kids}"></td>
       <td style="text-align: right;">${(adult*18000)+(teen*9000)+(kids*6000)}원
       <input type="hidden" id="sub_total" name="sub_total" value="${(adult*18000)+(teen*9000)+(kids*6000)}"></td>
      </tr>
      <tr>
       <td style="text-align: left;">최종결제금액</td>
       <td style="text-align: right;"><h2>${(adult*18000)+(teen*9000)+(kids*6000)}원</h2></td>
      </tr>
     </table>
   </div>
		<br>
   <input type="checkbox" onclick="check(this.form)" name="check3" id="check3"> 예약 티켓 정보에 대한 동의
   <p style="font-size: 14px; color: gray;">예약하신 티켓의 가격, 할인 내역, 취소 정책을 최종확인 하였으며, 구매에 동의합니다.
		<br>(전자거래법 제8조 제2항)</p>
		<br>
		<button id="payButton" name="payButton" type="button" disabled="disabled">결제하기</button>
	<script>
		$("#payButton").click(function() {
			var IMP = window.IMP;
			var price = ${(adult*18000)+(teen*9000)+(kids*6000)};
			var quantity = ${adult+teen+kids};
			IMP.init('imp63178535');
			IMP.request_pay({
				pg : "kakaopay",
				pay_method : 'card',
				merchant_uid : 'merchant_' + new Date().getTime(),
				name : '란조스토어 티켓 '+quantity+'인',
				amount : price,
				buyer_email : '구매자 이메일',
				buyer_name : '구매자 이름',
				buyer_tel : '구매자 번호',
				buyer_addr : '구매자 주소',
				buyer_postcode : '구매자 주소',
				m_redirect_url : 'redirect url'
			}, function(rsp) {
				if (rsp.success) {
					var msg = '결제가 완료되었습니다.';
 					document.pay.action="${path}/reserv/reservInsert.do";
					document.pay.submit();
				} else {
					var msg = '결제에 실패하였습니다.';
					rsp.error_msg;
					alert(msg);
				}
			});
		});
	</script>
		
  </td>
 </tr>
 </table>
 </div>
</form>
<%@ include file="../include/footer.jsp" %>
</body>
</html>