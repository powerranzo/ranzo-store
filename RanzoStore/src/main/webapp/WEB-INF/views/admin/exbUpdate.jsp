<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<%@ include file="../include/admin_head.jspf"%>
<title>전시 수정</title>
<script src="//cdn.ckeditor.com/4.20.0/standard/ckeditor.js"></script>
<script type="text/javascript">
$(function(){
	$("#btnUpdate").click(function(){
		if(confirm('수정하시겠습니까?')){
		document.form1.action="${path}/admin/exb_update.do";
		document.form1.submit();			
		}
	});
	$("#btnDelete").click(function(){
		if(confirm('삭제하시겠습니까?')){
		document.form1.action="${path}/admin/exb_delete.do";
		document.form1.submit();			
		}
	});
	$("#fileDel").click(function(){
		if(confirm('삭제하시겠습니까?')){
			$.ajax({
				url:"${path}/admin/thumnail_delete.do",
				type: "post",
				data: {"code":"${dto.code}"},
				dataType: "text",
				success: function(result){
					if(result=="deleted"){
					alert('파일이 삭제되었습니다.');
					$("#div_thumnail").remove();
					}
				}
			});
		}
	});
});
</script>
</head>
<body>
	<div class="container">
		<h2>전시 등록</h2>
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
					class="form-control input-sm" id="location" value="${dto.location}">
			</div>
			<div class="form-group">
				<label for="startDate">전시 시작일</label> <input type="date"
					name="startDate" class="form-control input-sm" id="startDate"
					value="${fn:substring(startDate,0,10)}">
			</div>
			<div class="form-group">
				<label for="endDate">전시 마감일</label> <input type="date"
					name="endDate" class="form-control input-sm" id="endDate"
					value="${fn:substring(endDate,0,10)}">
			</div>
			<div class="form-group">
				<label for="summary">내용</label>
				<textarea name="summary" class="form-control input-sm" id="summary"
					placeholder="내용을 입력해주세요." rows="20">${dto.summary}</textarea>
			</div>
			<c:if test="${dto.thumnail != '-'}">
				<div class="form-group">
					<label for="files">썸네일</label>
					<div id="div_thumnail">
						${fileName}
						<%--       (${dto.filesize / 1024} KB) --%>
						<img src="${dto.thumnail}" width="100" height="100">
						<button type="button" name="fileDel" id="fileDel">삭제</button>
					</div>
				</div>
			</c:if>
			<div class="form-group">
				<input type="file" name="file" class="form-control input-" id="file">
			</div>
		</form>
			<div class="form-group" align="right">
				<button class="btn btn-lg" id="btnUpdate">
					<span class="glyphicon glyphicon-pencil"></span>&nbsp;수정
				</button>
			</div>
			<div class="form-group" align="right">
				<button class="btn btn-lg" id="btnDelete">
					<span class="glyphicon glyphicon-remove"></span>&nbsp;삭제
				</button>
			</div>
			<br>
	</div>



</body>
</html>