<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>전시 등록</title>
<%@ include file="../include/header.jsp" %>
<%-- <%@ include file="../include/adminHeader.jspf"%> --%>
<script src="//cdn.ckeditor.com/4.20.0/standard/ckeditor.js"></script>
<style type="text/css">
.form-group{
width:80%;
}
</style>
<script type="text/javascript">
$(function(){
	$("#btnWrite").click(function(){
		if(confirm('등록하시겠습니까?')){
		document.form1.action='${path}/admin/popup_write.do';
		document.form1.submit();			
		}
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
		<h2>팝업 등록</h2>
		<form name="form1" enctype="multipart/form-data" method="post">
			<div class="form-group">
				<label for="title">제목</label> 
				<input name="title" class="form-control input-sm" 
				id="title" placeholder="">
			</div>
			<div class="form-group">
				<label for="start_date">시작일</label> 
				<input type="date" name="start_date" class="form-control input-sm" 
				id="start_date"> 
				<input type="time" name="start_time" id="start_time">
			</div>
			<div class="form-group">
				<label for="end_date">마감일</label> 
				<input type="date" name="end_date" class="form-control input-sm" 
				id="end_date">
				<input type="time" name="end_time">
			</div>
			<div class="form-group">
				<textarea id="content" name="content" rows="80" cols="80"></textarea>
				<script type="text/javascript">
					CKEDITOR.replace("content", {
						filebrowserUploadUrl : "${path}/ck_imageUpload.do"
					});
				</script>
			</div>
			<div class="form-group">
				<label for="file">이미지 첨부</label> 
				<input type="file" name="file"	
				class="form-control input-sm" id="file">
			</div>
ㄴ		</form>
		<div class="form-group" align="right">
			<button class="btn btn-lg" id="btnWrite" type="button">
				<span class="glyphicon glyphicon-pencil"></span>&nbsp;등록
			</button>
		</div>
		<br>
	</div>
</section>
</div>

</body>
</html>