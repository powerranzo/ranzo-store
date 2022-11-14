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
@media screen and (max-width: 800px) {
	.content{
		display: block;
		
	}
	.profile{
		width: 100%;
		
	}
}
@media screen and (max-width: 1100px) {
	.profile{
		display: block;	
		height: 400px;
	}
	.recentOrder, .recentWish {
		display: block;
		width: 100%;
		height: 300px;
		margin: 20px;
	}
}

.section {
	width: 90%;
	float: left;
	text-align: left;
}
.sectiondiv {
	float: left;
	margin-left:5%;
	margin-top:5%;
}
.profile {
	width: 80%;
	height: 30%;
	background-color: #ecedf2;
	display: flex;
	justify-content: space-between;
	padding: 50px;
}
.welcome {
	font-size: 30px;
}
.myreview, .myinfo {
	padding: 30px;
	font-size: 22px;
}
.adminTable1 {margin:0; width:100%;}
.adminTable1 td{
	border-top: 1px solid #e4e4e4;
	border-collapse: separate;	
}
.recentOrder, .recentWish {
	display: inline-block;
 	width: 40%; 
/* 	height: 100px; */
	margin: 20px;
	margin-top: 3%;
}
.a2 {
	color: gray !important;
	margin-bottom:0;
	font-size: 20px;
}
.a2:hover{
	color: black !important;
	text-decoration: none;
	font-weight: bold;	
}
hr{margin-top:0;}
/* h4{font-weight: bold; display: block;} */
</style>
</head>
<body>
	<%@ include file="../include/menu.jsp"%>
	<div class="content">
			<%@ include file="../include/adminDashboard.jspf"%>
			<div class="sectiondiv">
				
		<section>
		<div class="profile">
			<div class="welcome">
			<strong>TODAY</strong> <p>리포트
			</div>
			<div class="myreview">
			<img src="${path}/resources/images/pencil_icon.png" height="20">
			<a class="a2" href="${path}/member/myReview.do">나의 후기</a>
			</div>
			<div class="myinfo">
			<img src="${path}/resources/images/user_icon.png" height="20">
			<a class="a2" href="${path}/member/infoEnter.do">회원 정보</a>
			</div>
		</div>
		<div class="profile2">
		<div class="recentOrder">
			<a class="a2" href="${path}/reserv/list.do/${sessionScope.userid}">전시 현황</a>
 			<hr noshade size="1px" color="black"> 
 			<div id="resultList">
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
 			</div>
		</div>
		<div class="recentWish">
			<a class="a2" href="${path}/member/wishlist.do">예약 현황</a>
 			<hr noshade size="1px" color="black"> 
 		<div id="miniWish">
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
		</div>
		<div class="profile2">
		<div class="recentOrder">
			<a class="a2" href="${path}/reserv/list.do/${sessionScope.userid}">전시 현황</a>
 			<hr noshade size="1px" color="black"> 
 			<div id="resultList">
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
 			</div>
		</div>
		<div class="recentWish">
			<a class="a2" href="${path}/member/wishlist.do">예약 현황</a>
 			<hr noshade size="1px" color="black"> 
 		<div id="miniWish">
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
		</div>
		
		</section>
		</div>
		</div>
	<footer>
		<%@ include file="../include/footer.jsp"%>
	</footer>
</body>
</html>
