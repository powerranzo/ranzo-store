<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>review 상세보기</title>
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
</head>
<body>
<%@ include file="../include/menu.jsp" %>
<h2>리뷰 수정하기</h2>
<form id="form1" name="form1" method="post" action="${path}/board/review/insert.do">
	<table>

		<tr>
			<th>전시명</th>
			<td>				
			<input id="product" name="product" value="${dto.product}" placeholder="전시명을 입력하세요.">
			</td>
		</tr>
		<tr>
			<th>제목</th>
			<td>
			<input id="title" name="title" value="${dto.title}" size="70" placeholder="제목을 입력하세요.">
			</td>
		</tr>
		<tr>
			<th>내용</th>
			<td>
			<textarea id="content" name="content" rows="2" cols="80" placeholder="내용을 입력하세요">${dto.content}</textarea>
			</td>
		</tr>
	</table>

	<div style="width: 700px;" align="center">
		<button type="button" id="btnList" onclick="location.href='${path}/board/qna/list.do'">목록</button>		
		<button type="button" id="btnDelete" onclick="location.href='${path}/board/qna/delete.do'">삭제</button>
		<button type="button" id="btnUpdate">수정</button>
	</div>
</form>
</body>
</html>