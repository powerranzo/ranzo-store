<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>전시 수정</title>
<%@ include file="../include/header.jsp"%>
<%@ include file="../include/adminHeader.jspf"%>
<style type="text/css">
.form-group {
	width: 80%;
}
</style>
<script type="text/javascript">
	$(function() {
		$("#summary").summernote({
			width : 800,
			height : 300
		});
		$("#btnUpdate").click(function() {
			alertify.confirm("수정하시겠습니까?", function() {
				document.form1.action = "${path}/admin/exb_update.do";
				document.form1.submit();
			});
		});
		$("#btnDelete").click(function() {
			alertify.confirm("종료하시겠습니까?", function() {
				document.form1.action = "${path}/admin/exb_delete.do";
				document.form1.submit();
			});
		});
		$("#fileDel").click(function() {
			console.log('fileDel clicked');
			fileDel('thumnail');
		});
		$("#fileDel2").click(function() {
			fileDel('product_info');
		});
	});

	function fileDel(param) {
		console.log(param);
		if (confirm('삭제하시겠습니까?')) {
			$.ajax({
				type : "post",
				url : "${path}/admin/exb_file_delete.do",
				async : false,
				data : {
					"code" : "${dto.code}",
					"fileType" : param
				},
				success : function(result) {
					if (result == 'deleted') {
						if (param == "thumnail")
							$("#thumnailImg").remove();
						if (param == "product_info")
							$("#pdtInfoImg").remove();
						alert('삭제되었습니다.');
					}
				}
			})
		}
	}
</script>
</head>
<body>
	<%@ include file="../include/menu.jsp"%>
	<div class="content">
		<section>
			<%@ include file="../include/adminDashboard.jspf"%>
<!-- 			<div class="sectiondiv"> -->
				<h2>전시 수정</h2>
				<form name="form1" enctype="multipart/form-data" method="post">
					<div class="form-group">
						<label for="code">전시코드</label> <input name="code"
							class="form-control input-sm" id="code" value="${dto.code}"
							readonly>
					</div>
					<div class="form-group">
						<label for="title">전시명</label> <input name="title"
							class="form-control input-sm" id="title" value="${dto.title}">
					</div>
					<div class="form-group">
						<label for="gallery">전시관</label> <input name="gallery"
							class="form-control input-sm" id="gallery" value="${dto.gallery}">
					</div>
					<div class="form-group">
						<label for="location">전시지역</label> <input name=location
							class="form-control input-sm" id="location"
							value="${dto.location}">
					</div>
					<div class="form-group">
						<label for="start_date">전시 시작일</label> <input type="date"
							name="start_date" class="form-control input-sm" id="start_date"
							value="${fn:substring(startDate,0,10)}">
					</div>
					<div class="form-group">
						<label for="end_date">전시 마감일</label> <input type="date"
							name="end_date" class="form-control input-sm" id="end_date"
							value="${fn:substring(endDate,0,10)}">
					</div>
					<div class="form-group">
						<label for="summary">내용</label>
						<textarea name="summary" class="form-control input-sm"
							id="summary" placeholder="내용을 입력해주세요." rows="20">${dto.summary}</textarea>
					</div>
<div class="col-sm-4" style="padding: 3% 3% 3% 3%;">
					<div class="form-group">
						<label for="files">포스터(썸네일)</label> <input type="file" name="file"
							class="form-control input-" id="file">
					</div>
					</div>
					<div class="col-sm-4" style="padding: 3% 3% 3% 3%;">
					<div class="form-group">
					<label for="file2">전시 정보 이미지</label> <input type="file"
						name="file2" class="form-control input-" id="file2">
				</div>
				</div>
				</form>
				<c:if test="${dto.thumnail != '-'}">
				<div class="col-sm-4" style="padding: 3% 3% 3% 3%;">
<!-- 					<div class="form-group"> -->
						<label for="files">현재 포스터</label><br>
<!-- 						<div> -->
							${thumnailName} <img id="thumnailImg" src="${dto.thumnail}"
								width="100" height="100">
						<button class="btn btn-sm" name="fileDel" id="fileDel"
							type="button">
							<span class="glyphicon glyphicon-remove"></span>&nbsp;삭제
						</button>
<!-- 						</div> -->
<!-- 					</div> -->
					</div>
				</c:if>
				<c:if test="${dto.product_info != '-'}">
				<div class="col-sm-4" style="padding: 3% 3% 3% 3%;">
<!-- 					<div class="form-group"> -->
						<label for="file2">현재 전시정보</label><br>
<!-- 						<div class="sectiondiv"> -->
							${product_infoName}
							<%--       (${dto.filesize / 1024} KB) --%>
							<img id="pdtInfoImg" src="${dto.product_info}" width="100"
								height="100">
						<button class="btn btn-sm" id="fileDel2" name="fileDel2"
							type="button">
							<span class="glyphicon glyphicon-remove"></span>&nbsp;삭제
						</button>
<!-- 						</div> -->
<!-- 					</div> -->
					</div>
				</c:if>
				


				<div class="form-group" align="right">
					<button class="btn btn-sm" id="btnUpdate" type="button">
						<span class="glyphicon glyphicon-pencil"></span>&nbsp;수정
					</button>
					<button class="btn btn-sm" id="btnDelete" type="button">
						<span class="glyphicon glyphicon-minus-sign"></span>&nbsp;종료
					</button>
				</div>
				<br>
<!-- 			</div> -->
		</section>
	</div>
	<%@ include file="../include/footer.jsp"%>
</body>
</html>