<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예매</title>
<%@ include file="../include/header.jsp"%>
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
#infodiv {
	padding: 10px;
	text-align: left;
	font-size: 12px;
	color: gray;
}
.diva1,.diva2,.diva3 {
	display: inline-block;
	width: 380px;
	padding: 5px;
	vertical-align: top;
}
.diva3{
	text-align: left;
}
.diva2 li{
	padding-bottom: 20px;
}
.diva4{
	margin-left: 12%;
}
#pdd{
	background-color: #f4f4f4;
	font-size: 13px;
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
						"<h3>" + "성인 " + result.adult + "명" + "<br>" + "청소년 "
								+ result.teen + "명" + "<br>" + "유아 및 어린이 "
								+ result.kids + "명" + "<br>" + "</h3>");
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
	<%@ include file="../include/menu.jsp"%>
	<form name="reserv" method="post" id="form"
		action="${path}/reserv/pay/${dto.code}">
		<div class="div1">
			<table class="table1">
				<thead>
					<tr>
						<td width="33%">01. 티켓 선택</td>
						<td width="33%">02. 관람일/인원 선택</td>
						<td
							style="background: none; color: silver; border: 1px solid silver;">03.
							결제</td>
					</tr>
				</thead>
			</table>
			<div class="diva1">
				<img src="${dto.thumnail}" width="90%">
			</div>

			<div class="diva2">
				<ul style="text-align: left;">
					<li><h2>${dto.title}</h2></li>
					<li>${dto.summary}</li>
					<li><strong>장소</strong> ${dto.gallery}</li>
					<li><strong>전시기간</strong> <fmt:formatDate
							value="${dto.start_date}" pattern="yyyy-MM-dd" /> ~ <fmt:formatDate
							value="${dto.end_date}" pattern="yyyy-MM-dd" /></li>
					<li><strong>관람등급</strong> 전체관람가</li>
					<li><strong>이용요금</strong><br> 성인 18,000원 <br> 초중고 학생
						9,000원 <br> 유아 6,000원</li>
				</ul>
			</div>

			<div class="diva3">
				<h2>관람일</h2>
				<input type="date" id="res_date" name="res_date" min="" max="
				<fmt:formatDate value="${dto.end_date}" pattern="yyyy-MM-dd" />">
				<script>
					document.getElementById("res_date").value = new Date()
							.toISOString().substring(0, 10);
					;
					document.getElementById("res_date").setAttribute("min",
							new Date().toISOString().substring(0, 10));
				</script>
				<br>
				<br>
				<hr noshade size="1px" color="#ddd">
				<br>
				<h2>회차</h2>
				전일 입장가능 10:00 ~ 19:00
				<br>
				<br>
				<hr noshade size="1px" color="#ddd">
				<br>
				<h2>관람인원 및 권종</h2>
				<div class="more">
					<span style="color: gray;">권종안내</span> <a><img
						src="${path}/resources/images/questionmark_icon.png" width="20"></a>

					<div id="pdd">
						<p>
							성인 20세 이상<br> 청소년 14세~19세<br> 유아 및 어린이 37개월~13세
						</p>
					</div>
				</div>
				<table>
					<tr>
						<td>성인</td>
						<td><input type="number" name="adult" id="adult" step="1"
							min="0" max="4" placeholder="0" value="0" onchange="user()"
							size="5">명</td>
					</tr>
					<tr>
						<td>청소년</td>
						<td><input type="number" name="teen" id="teen" step="1"
							min="0" max="4" placeholder="0" value="0" onchange="user()"
							size="5">명</td>
					</tr>
					<tr>
						<td>유아 및 어린이</td>
						<td><input type="number" name="kids" id="kids" step="1"
							min="0" max="4" placeholder="0" value="0" onchange="user()"
							size="5">명</td>
					</tr>
				</table>
				<br>
				<hr noshade size="1px" color="#ddd">
				<br>
				<input type="hidden" value="${dto.code}" id="code">
				<div id="result">
					<h3>
						성인 0명 <br> 청소년 0명 <br> 유아 및 어린이 0명 <br>
					</h3>
				</div>
				<br> <br> <input type="checkbox"
					onclick="check(this.form)" name="check2" id="check2"> 관람시
				유의 사항 동의 <input type="button" name="checkButton" id="checkButton"
					value="예매하기" disabled="disabled">
			</div>

			<div class="diva4">
				<h3 style="text-align: left;">관람 시 유의사항</h3>
				<div id="infodiv">
					<ol>
						<li>입장, 티켓 환불 & 취소</li>
						<ul>
							<li>• 예매하신 티켓의 변경, 취소, 환불은 전시 관람 또는 프로그램 하루 전 오후 5시까지만
								가능합니다. 이후에는 취소와 환불이 불가하오니 유의해 주세요.</li>
							<li>• 전시 관람 또는 프로그램 참여 당일 예매하신 티켓은 취소, 변경, 환불이 불가합니다. 꼭 기억해
								주세요.</li>
							<li>• 관람 및 참여 여부와 관계없이 예약시간에 사용하지 않은 티켓은 기간만료 처리 되어 취소,환불이
								불가능합니다.</li>
							<li>• 재관람은 ‘사용완료’ 처리된 티켓으로만 가능합니다. 티켓을 취소 했거나, 예매 후 미술관을
								방문하지 못해 기간만료 처리 된 티켓으로는 재관람이 어렵습니다.</li>
						</ul>
						<li>코로나19 예방과 확산 방지를 위한 관람객 유의 사항</li>
						<ul>
							<li>• 미술관 안에서는 안전한 관람을 위하여 관람객 모두 마스크를 착용해야 합니다.</li>
							<li>• 올바른 마스크 착용이 아니거나 마스크 착용을 거부할 경우 퇴장 조치 될 수 있습니다.</li>
						</ul>
						<li>미술관 방문과 전시 관람</li>
						<ul>
							<li>• 전시장 안으로는 물, 껌, 사탕을 포함한 모든 음식물 반입이 불가하오니 꼭 기억해 주세요.</li>
							<li>• 미술관 내에는 안내견을 제외한 반려동물은 입장할 수 없습니다.</li>
							<li>• 플래시, 삼각대 및 셀카봉을 이용한 촬영, 상업적 용도의 촬영, 동영상 촬영은 불가합니다.</li>
							<li>• 14세 미만 어린이의 경우, 보호자와 함께 입장하셔야 합니다. 전시장에서는 어린이들이 보호자의
								손을 잡고 전시를 관람할 수 있게 해 주세요.</li>
							<li>• 관람객이 전시 작품 및 시설물을 파괴하거나 훼손하였을 때에는 이에 상응하는 손해 배상을 하실 수
								있으니, 관람에 유의해 주세요.</li>
						</ul>
					</ol>
				</div>
			</div>
		</div>
	</form>


	<%@ include file="../include/footer.jsp"%>
</body>
</html>