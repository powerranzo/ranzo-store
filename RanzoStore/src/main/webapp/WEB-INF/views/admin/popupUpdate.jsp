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
	margin-left:5%;
	width: 80%;
}
</style>
<script type="text/javascript">
	$(function() {
		$("#content").summernote({
			width : 880,
			height : 300
		});
		$("#btnUpdate").click(function() {
			if (confirm('수정하시겠습니까?')) {
				document.form1.action = '${path}/admin/popup_update.do';
				document.form1.submit();
			}
		});
		$("#btnDelete").click(function(){
			if (confirm('종료하시겠습니까?')) {
				document.form1.action = '${path}/admin/popup_delete.do';
				document.form1.submit();
		}
		});
		
		$("#fileDel").click(function(){
			if(confirm('삭제하시겠습니까?')){
				$.ajax({
					type:"post",
					url:"${path}/admin/popup_file_delete.do",
					async: false,
					data: {"no":"${dto.no}"},
					success: function(result){
						if(result=='deleted'){
							$("#fileImage").remove();
							alert('삭제되었습니다.');
					}
					}
				})
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
</script>
</head>
<body>
	<%@ include file="../include/menu.jsp"%>
	<div class="content">
		<section>
			<%@ include file="../include/adminDashboard.jspf"%>
			<div class=sectiondiv>
				<div class="panel panel-default">
					<div class="panel-body">
						<h2>팝업 수정</h2>
						<div class="panel panel-default">
							<div class="panel-body">
								<form name="form1" enctype="multipart/form-data" method="post">
									<div class="form-group">
										<label for="no">번호</label> <input name="no"
											class="form-control input-sm" id="no" value="${dto.no}" readonly>
									</div>
									<div class="form-group">
										<label for="title">제목</label> <input name="title"
											class="form-control input-sm" id="title" value="${dto.title}">
									</div>
									<div class="form-group">
										<label for="start_date">시작일</label> <input type="date"
											name="start_date" class="form-control input-sm"
											id="start_date" value="${fn:substring(startDate,0,10)}">
										<input type="time" class="form-control input-sm"
											name="start_time" id="start_time"
											value="${fn:substring(dto.start_date,11,19)}">
									</div>
									<div class="form-group">
										<label for="end_date">마감일</label> <input type="date"
											name="end_date" class="form-control input-sm" id="end_date"
											value="${fn:substring(endDate,0,10)}"> <input
											type="time" name="end_time" class="form-control input-sm"
											value="${fn:substring(dto.end_date,11,19)}">
									</div>
									<div class="form-group">
										<label for="img_width">가로 사이즈</label> <input type="number"
											name="img_width" id="img_width" class="form-control input-sm"
											value="${dto.img_width}">
									</div>
									<div class="form-group">
										<label for="img_height">세로 사이즈</label> <input type="number"
											name="img_height" id="img_height"
											class="form-control input-sm" value="${dto.img_height}">
									</div>
									<div class="form-group">
										<label for="title">이미지 URL</label>
										<c:choose>
											<c:when test="${dto.filesize==0}">
												<input name="img_src" class="form-control input-sm"
													id="img_src" value="${dto.img_src}">
												<div>
													<img id="urlImage" style="width: 50%; height: 50%">
												</div>
											</c:when>
											<c:otherwise>
												<input name="img_src" class="form-control input-sm"
													id="img_src">
												<div>
													<img id="urlImage" style="width: 50%; height: 50%">
												</div>
											</c:otherwise>
										</c:choose>
									</div>
									<div class="form-group">
										<label for="file">이미지 등록(10MB 이하)<span id="filesize"></span></label>
										<input type="file" name="file" class="form-control input-sm"
											id="file" onchange="fileSize(this)">
									</div>
									<c:if test="${dto.filesize > 0}">
										<div class="form-group">
											<label for="sectiondiv">썸네일</label>
											<div class="sectiondiv">
											<img src="${dto.img_src}" id="fileImage" width="100" height="100">
												${dto.filename} 
											</div>
											<button class="btn btn-sm" name="fileDel" id="fileDel">
												<span class="glyphicon glyphicon-remove"></span>&nbsp;삭제
											</button>
										</div>
									</c:if>
								</form>
							</div>
						</div>
						<div class="form-group" align="right">
				<button class="btn btn-sm" id="btnUpdate">
					<span class="glyphicon glyphicon-pencil"></span>&nbsp;수정
				</button>
				<button class="btn btn-sm" id="btnDelete">
					<span class="glyphicon glyphicon-minus-sign"></span>&nbsp;종료
				</button>
			</div>
						</div>
						<br>
					</div>
				</div>
		</section>
	</div>
<%@ include file="../include/footer.jsp"%>
</body>
</html>