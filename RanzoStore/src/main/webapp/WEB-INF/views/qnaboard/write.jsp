<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QNA 게시판</title>
<%@ include file="../include/header.jsp" %>

<!-- include libraries(jQuery, bootstrap) -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>

<script type="text/javascript">
$(function() {
	$("#content").summernote({
		width : 600,
		height : 200
	});
});
</script>

<script>
$(function(){ 
	$("#btnSave").click(function(){
		document.form1.submit();
	});
});
</script>
	

</head>
<body>
<%@ include file="../include/menu.jsp" %>
<div align="center">

<form id="form1" name="form1" method="post" action="${path}/board/qna/insert.do">
	<table class="table table-striped" style="width: 800px; border: 1px solid #dddddd">
		<tr>
			<th colspan="2" style="background-color: #eeeeee; text-align: center;">QNA 문의하기</th>
		</tr>		
		<tr>
			<th>제목</th>
			<td>
				<input name="title" id="title" size="80" value="${dto.title}" placeholder="제목을 입력하세요">	
			</td>
		</tr>
		<tr>
			<th>내용</th>
			<td>
				<textarea name="content" id="content" rows="2" cols="80" placeholder="내용을 입력하세요">${dto.content}</textarea>		
			</td>
		</tr>
		<!-- <tr>
			<th>첨부파일</th>
			<td>
				<input type="file" name="file1" id="file1">
			</td>
		</tr> -->
	</table>
	
	<br>
	<div style="width: 700px;" align="center">
		<button type="button" id="btnList" class="btn btn-secondary" onclick="location.href='${path}/board/qna/list.do'">목록</button>		
		<button type="button" id="btnSave" class="btn btn-primary">확인</button>
	</div>
</form>
</div>
</body>
</html>