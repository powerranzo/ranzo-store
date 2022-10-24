<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<style type="text/css">
.div1 {
	text-align: center;
	margin: auto;
	padding: 20px;
}

.table1 {
	margin: auto;
	padding: 10px;
	width: 80%;
	text-align: center;
}

.table1 thead td {
	border: 1px solid black;
	padding: 15px;
	background-color: black;
	color: white;
}

.table1 td {
	padding: 10px;
}

.more a {
	cursor: pointer;
}

.more #pdd {
	display: none;
}

.table1 ul li {
	padding: 10px;
}

#checkButton {
	margin: 5px;
	padding: 10px;
	width: 97%;
	height: 50px;
	backgroundColor: #eeeeee;
	color: #cccccc;
	border: none;
}

.tdstyle {
	text-align: left;
	border-bottom: 1px solid #ddd;
}
#infodiv{
	padding: 10px;
	text-align: left;
	font-size: 12px; 
	color: gray;
}
</style>
<script type="text/javascript">
	/* 권종더보기  */
	$(document).ready(function() {
		$(".more>a").click(function() {
			var submenu = $(this).next("#pdd");
			if (submenu.is(":visible")) {
				submenu.slideUp();
			} else {
				submenu.slideDown();
			}
		});
	});
	/* 티켓인원수적용 */
	function user() {
		$.ajax({
			type : "post",
			data : "res_date=" + $("#res_date").val() + "&adult="
					+ $("#adult").val() + "&teen=" + $("#teen").val()
					+ "&kids=" + $("#kids").val(),
			url : "${path}/reserv/result.do",
			success : function(result) {
				$("#result").html(
						"성인 " + result.adult + "명" + "<br>" + "청소년 "
								+ result.teen + "명" + "<br>" + "유아 및 어린이 "
								+ result.kids + "명" + "<br>");
			}
		});
	}
	/* 필수입력 및 제출 */
	$(function() {
		$("#checkButton").click(function() {
			var res_date = $("#res_date").val();
			var adult = $("#adult").val();
			var teen = $("#teen").val();
			var kids = $("#kids").val();
			if (res_date == "") {
				alert("관람일을 선택하세요.");
				return;
			}
			if (adult == 0 && teen == 0 && kids == 0) {
				alert("관람인원을 선택하세요.");
				return;
			}
			//폼 데이터를 서버로 제출
			document.reserv.action = "${path}/reserv/pay/${dto.code}";
			document.reserv.submit();
		});
	});
	/* 버튼 활성화 */
	function check(frm) {
		if (frm.checkButton.disabled == true) {
			frm.checkButton.disabled = false
			$("#checkButton").css({
				"backgroundColor" : "black",
				"color" : "white"
			});
		} else {
			frm.checkButton.disabled = true
			$("#checkButton").css({
				"backgroundColor" : "#eeeeee",
				"color" : "#cccccc"
			});
		}
	}

</script>
</head>
<body>
<%@ include file="../include/menu.jsp" %>
<form name="reserv" method="post" id="form" action="${path}/reserv/pay/${dto.code}">
<div class="div1">
<table class="table1">
<thead>
 <tr>
  <td>01. 티켓 선택</td>
  <td>02. 관람일/인원 선택</td>
  <td style="background: none; color: silver; border: 1px solid silver;">03. 결제</td>
 </tr>
 </thead>
 <tr>
  <td width="33%" rowspan="3"><img src="${dto.thumnail}" width="100%"></td>
  <td width="33%" rowspan="3">
  <ul style="text-align: left;">
  <li><h1>${dto.title}</h1></li>
  <li>${dto.summary}</li>
  <li><strong>장소</strong> ${dto.gallery} </li>
  <li><strong>전시기간</strong> ${dto.start_date} ~ ${dto.end_date}</li>
  <li><strong>관람등급</strong> 전체관람가</li>
  <li><strong>이용요금</strong><br>
  		성인 20,000원 <br>
  		초중고 학생 17,000원 <br>
  		유아 14,000원</li>
  </ul>
  </td>
  
 <td class="tdstyle">
 <h2>관람일</h2>
 <input type="date" id="res_date" name="res_date" min="" max="${dto.end_date}">
 <script>
	document.getElementById("res_date").value = new Date().toISOString().substring(0, 10);;
  document.getElementById("res_date").setAttribute("min", new Date().toISOString().substring(0, 10));
</script>
 </td>
 <tr>
 <td class="tdstyle">
 <h2>회차</h2>
  전일 입장가능 10:00 ~ 19:00
  </td>
 </tr>
 
 <tr>
 
 <td class="tdstyle">
 <h2>관람인원 및 권종</h2> 
  <div class="more"><span style="color: gray;">권종안내</span>
 <a><img src="${path}/resources/images/questionmark_icon.png" width="20"></a>

 <div id="pdd">
 <p>성인 20세 이상<br>
청소년 14세~19세<br>
유아 및 어린이 37개월~13세</p>
 </div>
 </div>
 <table>
  <tr>
  <td>성인</td>
  <td><input type="number" name="adult" id="adult" step="1" min="0" max="4" placeholder="0" value="0" onchange="user()">명</td>
  </tr>
  <tr>
  <td>청소년</td>
  <td><input type="number" name="teen" id="teen" step="1" min="0" max="4" placeholder="0" value="0" onchange="user()">명</td>
  </tr>
  <tr>
  <td>유아 및 어린이</td>
  <td><input type="number" name="kids" id="kids" step="1" min="0" max="4" placeholder="0" value="0" onchange="user()">명</td>
  </tr>
 </table>
 </td>
 </tr>
 <tr>
  <td><input type="hidden" value="${dto.code}" id="code"></td>
  <td> &nbsp; </td>
  <td class="tdstyle">
  <div id="result">
   성인 0명 <br>
   청소년 0명 <br>
   유아 및 어린이 0명 <br></div>
  </td>
 </tr>
 <tr>
  <td colspan="2"> &nbsp;</td>
   
  <td class="tdstyle"><input type="checkbox" onclick="check(this.form)" name="check2" id="check2"> 관람시 유의 사항 동의
    <input type="button" name="checkButton" id="checkButton" value="예매하기" disabled="disabled">
  </td>
 </tr>
</table>
</div>
</form>


<%@ include file="../include/footer.jsp" %>
</body>
</html>