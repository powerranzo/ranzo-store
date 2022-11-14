<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>팝업 수정</title>
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
#tb3 td{width:25%;}
#tb3 th{width:25%;}
</style>
<script type="text/javascript">
	$(function() {
		$("#btnUpdate").click(function() {
			alertify.confirm("수정하시겠습니까?", function() {
				if(popCheck()){
				document.form1.action = '${path}/admin/popup_update.do';
				document.form1.submit();
				}
			});
		});
		$("#btnDelete").click(function(){
			alertify.confirm("종료하시겠습니까?", function() {
				document.form1.action = '${path}/admin/popup_delete.do';
				document.form1.submit();
			});
		});
		$("#btnResetFile").click(function(){
			$("#file").val('');
		});
		$("#fileDel").click(function(){
			alertify.confirm("삭제하시겠습니까?", function() {
				$.ajax({
					type:"post",
					url:"${path}/admin/popup_file_delete.do",
					async: false,
					data: {"no":"${dto.no}"},
					success: function(result){
						if(result=='deleted'){
							$("#fileImage").remove();
						}
					}
				})
			});
		});
	});

	function fileSize(target) {
		const file = target.files[0];
		const maxsize = 2000 * 1024;
		console.log(file.size);
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
			<%@ include file="../include/adminDashboard.jspf"%>
			<div class=sectiondiv>
				<h2>팝업 수정</h2>
				<form name="form1" enctype="multipart/form-data" method="post">
					<table class="adminTable3">
						<tr>
							<th id="adminTB2_th">번호</th>
							<td><input name="no" id="no" value="${dto.no}" readonly></td>
						</tr>
						<tr>
							<th id="adminTB2_th">제목</th>
							<td><input name="title" id="title" value="${dto.title}"></td>
						</tr>
						<tr>
							<th>시작일</th>
							<td><input type="date" name="start_date" id="start_date"
								value="${fn:substring(startDate,0,10)}"> 
								<input type="time" name="start_time" id="start_time"
								value="${fn:substring(dto.start_date,11,19)}"></td>
						</tr>
						<tr>
							<th>마감일</th>
							<td><input type="date" name="end_date" id="end_date"
								value="${fn:substring(endDate,0,10)}"> 
								<input type="time" name="end_time" id="end_time"
								value="${fn:substring(dto.end_date,11,19)}"></td>
						</tr>
						<tr>
						<tr>
							<th>상단 위치</th>
							<td><input type="number" name="pos_height" id="pos_height"
								value="${dto.pos_height}"></td>
						</tr>
						<tr>
							<th>좌측 위치</th>
							<td><input type="number" name="pos_width" id="pos_width"
								value="${dto.pos_width}"></td>
						</tr>
						<tr>
							<th>가로 사이즈</th>
							<td><input type="number" name="img_width" id="img_width"
								value="${dto.img_width}"></td>
						</tr>
						<tr>
							<th>세로 사이즈</th>
							<td><input type="number" name="img_height" id="img_height"
								value="${dto.img_height}"></td>
						</tr>
						<tr>
							<th>이미지 URL</th>
							<td><input name="img_src" id="img_src">
								<div>
									<img id="urlImage" style="width: 50%; height: 50%">
								</div>
							</td>
						</tr>
						<tr>
							<th>이미지 등록(10MB 이하)</th>
							<td><input type="file" name="file" id="file"
								onchange="fileSize(this)">
								<span id="filesize"></span>
								<button class="btn btn-sm" type="button" onclick="resetFile()">
									<span class="glyphicon glyphicon-minus-sign"></span>&nbsp;파일리셋
								</button>
							</td>
						</tr>
					</table>

					<table class="adminTable3" id="tb3">
						<tr>
							<th id="adminTB2_th">현재 이미지</th>
							<td><c:if test="${dto.filesize > 0}">
									<img id="fileImage" src="${dto.img_src}" width="100"
										height="100">
								${dto.filename} 
								<button class="btn btn-sm" name="fileDel" id="fileDel"
										type="button">
										<span class="glyphicon glyphicon-remove"></span>&nbsp;삭제
									</button>
								</c:if></td>
						</tr>
					</table>
					</form>
					<input id="btnUpdate" name="btnUpdate" type="button" value="수정하기" style="margin-right:10%;">
					<input id="btnDelete" name="btnDelete" type="button" value="팝업종료" style="margin-right:10px;">
			</div>
	</div>
<%@ include file="../include/footer.jsp"%>
</body>
</html>