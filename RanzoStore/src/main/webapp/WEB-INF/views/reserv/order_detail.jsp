<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예매상세정보</title>
<%@ include file="../include/header.jsp" %>
<link rel="stylesheet" href="${path}/include/CommonDashboard.css">
<style type="text/css">
* {
	margin:0px; 
}
.content{
	margin: 20px 80px 0 80px;
}
section {
	width: 75%;
	float: right;
	text-align: left;
}
.orderdiv {
	padding:5px;
	float: left;
	display: inline-block;
	min-height: 100%;
	width: 80%;
	flex: 1;
}
.orderdetail{
	padding: 10px;
	width: 100%;
	margin: 10px auto;
	border-collapse: collapse;
	text-align: left;
}
.orderdetail thead {
	border-top: 2px solid #e4e4e4;
	background-color: #f8f9fa;
	color: #7b7e83;
	text-align: left;
	font-size: 20px;
	font-weight: bold;
}
.orderdetail td{	border-bottom: 1px solid #e4e4e4;}
.orderdetail thead, .orderdetail td{ padding: 10px;}
.tdstyle {
	background-color: #f8f9fa;
}
#deldiv{
	color: gray;
	background-color: #f1f1f1;
	padding: 10px;
	font-size: 13px;
	margin: 10px 0 0 0;
}

</style>
<script type="text/javascript">
$(function(){
	$("#canclebtn").click(function(){
		if(confirm("예매를 취소하시겠습니까?")){			
		document.order.action="${path}/reserv/delete/${dto.no}";
		document.order.submit();
		}
	});
});


</script>
</head>
<body>
<%@ include file="../include/menu.jsp" %>

<div class="content">
<section>
<div class="orderdiv">
<form action="${path}/reserv/addr_edit/${dto.no}" method="post" name="order">
<h2>예매확인/취소</h2>

<table class="orderdetail">
<thead>
<tr>
<td colspan="3"> > ${dto.title}</td>
</tr>
</thead>
<tr>
 <td rowspan="7" width="30%"><img src="${dto.thumnail}" width="300px"> </td>
 <td class="tdstyle" width="20%">예매자</td>
 <td>${dto.name}</td>
</tr>
<tr>
 <td class="tdstyle">예약번호</td>
 <td>${dto.no}</td>
</tr>
<tr>
 <td class="tdstyle">관람일</td>
 <td><fmt:formatDate value="${dto.res_date}" pattern="yyyy-MM-dd" /></td>
</tr>
<tr>
 <td class="tdstyle">장소</td>
 <td>${dto.gallery}</td>
</tr>
<tr>
 <td class="tdstyle">예매내용</td>
 <td>${dto.quantity}장
  <ul style="font-size: 12px; color: gray;">
   <c:if test="${dto.adult>0}"><li>성인 ${dto.adult}장</li></c:if>
   <c:if test="${dto.teen>0}"><li>청소년 ${dto.teen}장</li></c:if>
   <c:if test="${dto.kids>0}"><li>유아 및 어린이${dto.kids}장</li></c:if>
  </ul>
 </td>
</tr>
<tr>
 <td class="tdstyle">총 결제금액</td>
 <td><fmt:formatNumber value="${dto.sub_total+2500}" pattern="#,###" />원</td>
</tr>
<tr>
 <td class="tdstyle">상태</td>
 <td>
 <c:choose>
  <c:when test="${dto.pay=='y'}">
   <span style="color: #fa5041;">예매완료</span>
    &nbsp;<input type="button" value="예매취소하기" id="canclebtn" name="canclebtn">
  </c:when>
  <c:otherwise>
   <p style="color: #fa5041;">취소(관리자 확인후 2~3일 이내로 결제취소됩니다.)</p>
  </c:otherwise>
 </c:choose>
 </td>
</tr>
<tr>
 <td>&nbsp;</td>
 <td class="tdstyle">티켓수령방법</td>
 <td>
 <p>배송 <button id="rbutton">배송정보 수정</button></p>
 <c:choose>
 <c:when test="${dto.edit==0}">
 <ul>
  <li>-받는 사람: ${dto.name}</li>
  <li>-연락처: ${dto.hp}</li>
  <li>-주소: (${dto.zipcode}) ${dto.addr1} ${dto.addr2}</li>
 </ul>
 </c:when>
 <c:otherwise>
 <ul>
  <li>-받는 사람: ${dto.r_name}</li>
  <li>-연락처: ${dto.r_hp}</li>
  <li>-주소: (${dto.r_zipcode}) ${dto.r_addr1} ${dto.r_addr2}</li>
 </ul>
 </c:otherwise>
 </c:choose>
 <div id="deldiv">
  <p><strong>배송유의사항</strong><br>
	예매완료(결제 익일)기준 4~5일 이내에 배송됩니다.(주말, 공휴일을 제외한 영업일 기준)
	배송 중 전달 불가사항이 발생할 시에는 반송되며, 본인 수령 불가 시 경우에 따라 대리 수령도 가능합니다.
	티켓 배송 (배송상태 : 배송 준비중 이후) 후에는 주소 변경이 불가합니다.
	부득이하게 주소 변경이 필요하신 경우 각 배송사에 수취 거절 요청 후, 고객센터(0000-0000)로 재배송 신청할 수 있습니다.(배송비 2,500원 추가 부과)</p>
 </div>
 </td>
</tr>
</table>
 </form>
</div>
</section>
<%@ include file="../include/CommonDashboard.jspf" %>
</div>


<%@ include file="../include/footer.jsp" %>
</body>
</html>