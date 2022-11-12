<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>전시 등록</title>
<%@ include file="../include/header.jsp"%>
<%@ include file="../include/adminHeader.jspf"%>
<style type="text/css">
.adminTable3 input{float:left;}
.adminTable3{width:90%;}
#adminTB2_th{width: 20%;}
#summary {
	width:30% !important;
	height:300px !important;
}
form{margin-top:3%;}
</style>
<script type="text/javascript">
	$(function() {
		$("#summary").summernote({
			height : 300
		});
		$("#btnWrite").click(function() {
			alertify.confirm("등록하시겠습니까?", function() {
				document.form1.action = "${path}/admin/exb_write.do";
				document.form1.submit();
			});
		});
	});
</script>
</head>
<body>
	<%@ include file="../include/menu.jsp"%>
	<div class="content">
		<section>
			<%@ include file="../include/adminDashboard.jspf"%>
			<div class=sectiondiv>
				<h2>전시 등록</h2>
				<form name="form1" enctype="multipart/form-data" method="post">
					<table class="adminTable3">
						<tr>
							<th id="adminTB2_th">전시코드</th>
							<td>
								<input name="code" id="code" placeholder="">
							</td>
						</tr>
						<tr>
							<th>전시명</th>
							<td>
								<input name="title" id="title" placeholder="">
							</td>
						</tr>
						<tr>
						<tr>
							<th>전시관</th>
							<td>
								<input name="gallery" id="gallery" placeholder="">
							</td>
						</tr>
						<tr>
							<th>전시지역</th>
							<td>
								<input name="location" id="location" placeholder="">
							</td>
						</tr>
						<tr>
							<th>전시 시작일</th>
							<td>
								<input type="date" name="start_date" id="start_date">
							</td>
						</tr>
						<tr>
							<th>전시 마감일</th>
							<td>
								<input type="date" name="end_date" id="end_date">
							</td>
						</tr>
						<tr>
							<th>포스터 이미지</th>
							<td>
								<input type="file" name="file" id="file">
							</td>
						</tr>
						<tr>
							<th>전시 정보 이미지</th>
							<td>
								<input type="file" name="file2"	id="file2">
							</td>
						</tr>
					</table>
					<table class="adminTable3">
						<tr>
							<th style="width:15%;">내용</th>
							<td>
								<textarea name="summary" id="summary" 
								placeholder="내용을 입력해주세요." rows="20"></textarea>
							</td>
						</tr>
					</table>
				</form>
				<input type="submit" value="등록하기" id="btnWrite" name="btnWrite" style="margin-right:10%;">
				<br>
			</div>
		</section>
	</div>
	<footer>
		<%@ include file="../include/footer.jsp"%>
	</footer>
</body>
</html>