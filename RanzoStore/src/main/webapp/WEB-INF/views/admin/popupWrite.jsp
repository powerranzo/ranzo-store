<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>팝업 등록</title>
<%@ include file="../include/header.jsp"%>
<%@ include file="../include/adminHeader.jspf"%>
<style type="text/css">
.adminTable3 input {
	float: left;
}

.adminTable3 {
	width: 90%;
}

#adminTB2_th {
	width: 20%;
}
form {
	margin-top: 3%;
}
#start_date, #start_time, #end_date, #end_time {width:34%;}
</style>
<script type="text/javascript">
	$(function() {
		$("#content").summernote({
			width : 880,
			height : 300
		});
		$("#btnWrite").click(function() {
			alertify.confirm("등록하시겠습니까?", function() {
				if (popCheck()) {
					document.form1.action = '${path}/admin/popup_write.do';
					document.form1.submit();
				}
			});
		});
		$("#btnResetFile").click(function(){
			$("#file").val('');
		});
	});	
	function fileSize(target) {
		const file = target.files[0];
		const maxsize = 2000 * 1024;
// 		console.log(file.size);
		var filesize = 0;
		if (file.size > maxsize) {
			$("#filesize").css('color', 'red');
			$("#filesize").html('&nbsp;&nbsp;용량을 초과했습니다.');
			$("#file").val('');
		} else {
			if (file.size >= 1024)
				filesize = Math.round(file.size / 1024);
			else
				filesize = file.size;
			$("#filesize").html('&nbsp;&nbsp;' + filesize + 'KB');
		}
	}
	function resetFile() {
		$("#file").val("");
		$("#filesize").html("0 KB");
	}
</script>
</head>
<body>
	<%@ include file="../include/menu.jsp"%>
	<div class="content">
		<section>
			<%@ include file="../include/adminDashboard.jspf"%>
			<div class=sectiondiv>
				<h2>팝업 등록</h2>
				<form name="form1" enctype="multipart/form-data" method="post">
					<table class="adminTable3">
						<tr>
							<th id="adminTB2_th">제목</th>
							<td><input name="title" id="title" placeholder=""></td>
						</tr>
						<tr>
							<th>시작일</th>
							<td><input type="date" name="start_date" id="start_date"> 
								<input type="time" name="start_time" id="start_time" value="00:00">
							</td>
						</tr>
						<tr>
							<th>마감일</th>
							<td>
								<input type="date" name="end_date" id="end_date"> 
								<input type="time" name="end_time" id="end_time" value="00:00">
							</td>
						</tr>
						<tr>
						<tr>
							<th>상단 위치</th>
							<td> 
								<input type="number" name="pos_height" id="pos_height" value="100">
							</td>
						</tr>
						<tr>
							<th>좌측 위치</th>
							<td> 
								<input type="number" name="pos_width" id="pos_width" value="100">
							</td>
						</tr>
						<tr>
							<th>가로 사이즈</th>
							<td>
								<input type="number" name="img_width" id="img_width" value="400">
							</td>
						</tr>
						<tr>
							<th>세로 사이즈</th>
							<td>
								<input type="number" name="img_height" id="img_height" value="500">
							</td>
						</tr>
						<tr>
							<th>이미지 URL</th>
							<td>
								<input name="img_src" id="img_src">
								<div>
								<img id="urlImage" style="width: 50%; height: 50%">
								</div>
							</td>
						</tr>
						<tr>
							<th>이미지 등록(10MB 이하)</th>
							<td>
								<input type="file" name="file" id="file" onchange="fileSize(this)">
								<span id="filesize"></span>
								<button class="btn btn-sm" type="button" onclick="resetFile()">
								<span class="glyphicon glyphicon-minus-sign">
								</span>&nbsp;파일 리셋</button>
							</td>
						</tr>
					</table>
					</form>
				<input id="btnWrite" name="btnWrite" type="button" value="등록하기" style="margin-right:10%;">
					
			</div>
		</section>
	</div>
	<%@ include file="../include/footer.jsp"%>
</body>
</html>