<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<%@ include file="../include/admin_head.jspf"%>
<title>전시 등록</title>
<script src="//cdn.ckeditor.com/4.20.0/standard/ckeditor.js"></script>
<script type="text/javascript">
$(function(){
	$("#btnWrite").click(function(){
		if(confirm('등록하시겠습니까?')){
		document.form1.action="${path}/admin/exb_write.do";
		document.form1.submit();			
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
				<label for="code">전시코드</label> 
				<input name="code" class="form-control input-sm" 
				id="code" placeholder="">
			</div>
			<div class="form-group">
				<label for="title">전시명</label> 
				<input name="title" class="form-control input-sm" 
				id="title" placeholder="">
			</div>
			<div class="form-group">
				<label for="gallery">전시관</label> 
				<input name="gallery" class="form-control input-sm" 
				id="gallery" placeholder="">
			</div>
			<div class="form-group">
				<label for="location">전시지역</label> 
				<input name=location class="form-control input-sm" 
				id="location" placeholder="">
			</div>
			<div class="form-group">
				<label for="startDate">전시 시작일</label> 
				<input type="date" name="startDate" class="form-control input-sm" 
				id="startDate"> 
			</div>
			<div class="form-group">
				<label for="endDate">전시 마감일</label> 
				<input type="date" name="endDate" class="form-control input-sm" 
				id="endDate">
			</div>
			<div class="form-group">
				<label for="summary">내용</label>
				<textarea name="summary" class="form-control input-sm" id="summary"
					placeholder="내용을 입력해주세요." rows="20"></textarea>
			</div>
			<div class="form-group">
				<label for="files">썸네일</label> 
				<input type="file" name="file"	
				class="form-control input-lg" id="file">
			</div>
		</form>
		<div class="form-group" align="right">
			<button class="btn btn-lg" id="btnWrite">
				<span class="glyphicon glyphicon-pencil"></span>&nbsp;등록
			</button>
		</div>
		<br>
	</div>



</body>
</html>