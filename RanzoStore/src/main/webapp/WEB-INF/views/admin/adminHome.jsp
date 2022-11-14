<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자페이지</title>
<%@ include file="../include/header.jsp"%>
<%@ include file="../include/adminHeader.jspf"%>   
<style>
.adminTable1 {margin:0; width:40%;}
.adminTable1 td{
	border-top: 1px solid #e4e4e4;
	border-collapse: separate;	
}
.recentOrder, .recentWish {
	display: inline-block;
/* 	width: 100%; */
/* 	height: 100px; */
	margin: 20px;
}
.a2 {
	text-decoration: none;
	color: gray;
	font-size: 20px;
}
.a2:hover{
	color: black;
	text-decoration: none;
	font-weight: bold;	
}
/* h4{font-weight: bold; display: block;} */
</style>
</head>
<body>
	<%@ include file="../include/menu.jsp"%>
	<div class="content">
			<%@ include file="../include/adminDashboard.jspf"%>
			<div class="sectiondiv">
				<div class="recentOrder">
			<a class="a2" href="/power/reserv/list.do/kim">전시현황 ></a>
			</div>
				<table class="adminTable1">
					<tr>
						<th>전체 전시</th>
						<th>진행 중인 전시</th>
						<th>지난 전시</th>
					</tr>
					<tr>
						<td>${map.exb_count_all}개</td>
						<td>${map.exb_count_all}개</td>
						<td>${map.exb_count_ing}개</td>
					</tr>
				</table>
				
				<div class="recentOrder">
				<a class="a2" href="/power/reserv/list.do/kim">예약현황 ></a>
				</div>
				<table class="adminTable1">
					<tr>
						<th>전체 예약</th>
						<th>오늘 예약</th>
						<th>결제 완료 예약</th>
					</tr>
					<tr>
						<td>${map.exb_count_all}개</td>
						<td>${map.exb_count_all}개</td>
						<td>${map.exb_count_ing}개</td>
					</tr>
				</table>
		</div>
		</div>
	<footer>
		<%@ include file="../include/footer.jsp"%>
	</footer>
</body>
</html>