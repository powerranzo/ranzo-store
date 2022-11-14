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
.form-group {
	width: 80%;
}
</style>
<script type="text/javascript">
	$(function() {
		$("#content").summernote({
			width : 880,
			height : 300
		});
		$("#btnWrite").click(function() {
			if (confirm('등록하시겠습니까?')) {
				if (popCheck()) {
					document.form1.action = '${path}/admin/popup_write.do';
					document.form1.submit();
				}
			}
		});

// 		$("#img_src").change(function() {
// 			console.log($("#img_src").val());
// 			if ($("#img_src").val() == "") {
// 				$("#urlImage").hide();
// 			} else {
// 				$("#urlImage").show();
// 				$("#urlImage").attr('src', $("#img_src").val());
// 			}
// 		});
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

	function popCheck() {
		if ($("#title").val() == "") {
			alert('제목을 입력하세요.');
			$("#title").focus();
			return;
		}
		if ($("#start_date").val() == "") {
			alert('시작일을 입력하세요.');
			$("#start_date").focus();
			return;
		}
		if ($("#end_date").val() == "") {
			alert('종료일을 입력하세요.');
			$("#end_date").focus();
			return;
		}
		if ($("#file").val() == "" && $("#img_src").val() == "") {
			alert('파일 등록 또는 URL을 입력하세요.');
			$("#img_src").focus();
			return;
		}
		return true;
	}
</script>
</head>
<body>
	<%@ include file="../include/menu.jsp"%>
	<div class="content">
			<%@ include file="../include/adminDashboard.jspf"%>
			<div class=sectiondiv>
				<div class="panel panel-default">
					<div class="panel-body">
						<h2>팝업 등록</h2>
						<form name="form1" enctype="multipart/form-data" method="post">
							<div class="panel panel-default">
								<div class="panel-body">
									<div class="form-group">
										<label for="title">제목</label> <input name="title"
											class="form-control input-sm" id="title" placeholder="">
									</div>
									<div class="form-group">
										<label for="start_date">시작일</label> <input type="date"
											name="start_date" class="form-control input-sm"
											id="start_date"> <input type="time"
											class="form-control input-sm" name="start_time"
											id="start_time" value="00:00">
									</div>
									<div class="form-group">
										<label for="end_date">마감일</label> <input type="date"
											name="end_date" class="form-control input-sm" id="end_date">
										<input type="time" name="end_time"
											class="form-control input-sm" value="00:00">
									</div>
									<div class="form-group">
										<label for="pos_height">상단 위치</label> <input type="number"
											name="pos_height" id="pos_height"
											class="form-control input-sm" value="100">
									</div>
									<div class="form-group">
										<label for="pos_width">좌측 위치</label> <input type="number"
											name="pos_width" id="pos_width" class="form-control input-sm"
											value="100">
									</div>
									<div class="form-group">
										<label for="img_width">가로 사이즈</label> <input type="number"
											name="img_width" id="img_width" class="form-control input-sm"
											value="400">
									</div>
									<div class="form-group">
										<label for="img_height">세로 사이즈</label> <input type="number"
											name="img_height" id="img_height"
											class="form-control input-sm" value="500">
									</div>
									<div class="form-group">
										<label for="img_src">이미지 URL</label> <input name="img_src"
											class="form-control input-sm" id="img_src">
										<div>
											<img id="urlImage" style="width: 50%; height: 50%">
										</div>
									</div>
									<div class="form-group">
										<label for="file">이미지 등록(10MB 이하)<span id="filesize"></span></label>
										<input type="file" name="file" class="form-control input-sm"
											id="file" onchange="fileSize(this)">
									</div>
								</div>
							</div>
						</form>
						<div class="form-group" align="right">
							<button class="btn btn-lg" id="btnWrite" type="button">
								<span class="glyphicon glyphicon-pencil"></span>&nbsp;등록
							</button>
						</div>
						<br>
					</div>
				</div>
			</div>
	</div>
<%@ include file="../include/footer.jsp"%>
</body>
</html>