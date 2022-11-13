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
html, body {
	height: 100%;
}

body {
	display: flex;
	flex-direction: column;
	margin: 0;
}
.tableSet{margin-bottom: 10%; display:block; }
.adminTable1{width:45%; margin:0 2% 0 2%;}
.adminTable3{width:100%; margin-left:5%;}
</style>
</head>
<body>
	<%@ include file="../include/menu.jsp"%>
	<div class="content">
		<section>
			<%@ include file="../include/adminDashboard.jspf"%>
			<div class="sectiondiv">
			<div class="tableSet">
				<table class="adminTable1" id="">
					<tr>
						<th>전체 전시</th>
						<th>진행 중인 전시</th>
					</tr>
					<tr>
						<td>${map.exb_count_all}개</td>
						<td>${map.exb_count_ing}개</td>
					</tr>
				</table>
				<table class="adminTable1" id="">
					<tr>
						<th>전체 전시</th>
						<th>진행 중인 전시</th>
					</tr>
					<tr>
						<td>${map.exb_count_all}개</td>
						<td>${map.exb_count_ing}개</td>
					</tr>
				</table>
			</div>
			<div class="tableSet">
			<table class="adminTable3">
			<tr>
			<th></th>
			<th></th>
			<th></th>
			<th></th>
			</tr>
			<tr>
			<td></td>
			<td></td>
			<td></td>
			</tr>
			</table>
			</div>
			<div class="tableSet">
				<table class="adminTable1" id="">
					<tr>
						<th>전체 전시</th>
						<th>진행 중인 전시</th>
					</tr>
					<tr>
						<td>${map.exb_count_all}개</td>
						<td>${map.exb_count_ing}개</td>
					</tr>
				</table>
				<table class="adminTable1" id="">
					<tr>
						<th>전체 전시</th>
						<th>진행 중인 전시</th>
					</tr>
					<tr>
						<td>${map.exb_count_all}개</td>
						<td>${map.exb_count_ing}개</td>
					</tr>
				</table>
			</div>
			</div>
		</section>
	</div>
	<footer>
		<%@ include file="../include/footer.jsp"%>
	</footer>
</body>
</html>
