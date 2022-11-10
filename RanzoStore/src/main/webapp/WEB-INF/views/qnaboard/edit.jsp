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
$(function(){ //페이지가 뜨자마자 실행
	$("#btnSave").click(function(){
		document.form1.submit();
	});
	
	//목록 버튼
	$("#btnList").click(function(){
		location.href="${path}/board/qna/list.do";
	});
	//수정 버튼
	$("#btnUpdate").click(function(){
		document.form1.action="${path}/board/qna/update.do";
		document.form1.submit();
	});
	//삭제 버튼
	$("#btnDelete").click(function(){
		if(confirm("삭제하시겠습니까?")){
			document.form1.action="${path}/board/qna/delete.do";
			document.form1.submit();
		}
	});
});
</script>

</head>
<body>
<div align="center">
<%@ include file="../include/menu.jsp" %>

<form id="form1" name="form1" method="post" action="${path}/board/qna/insert.do" enctype="multipart/form-data">
 <table  class="table table-striped" style="width: 800px; border: 1px solid #dddddd">
 	<tr>
 		<th colspan="2" style="background-color: #eeeeee; text-align: center;">문의 내역 보기</th>
 	</tr>
 	<tr>
 		<th>제목</th>
 		<td><input name="title" id="title" size="80" value="${dto.title}" placeholder="제목을 입력하세요"></td>
 	</tr>
 	<tr>
 		<th>글 번호</th>
 		<td>${dto.bno}</td>
 	</tr>
 	<tr>
 		<th>조회수</th>
 		<td>${dto.viewcnt}</td>
 	</tr>
	 <tr>
 		<th>내용</th>
 		<td>
 			<div style="width: 700px;">	
				<textarea name="content" id="content" rows="2" cols="80" placeholder="내용을 입력하세요">${dto.content}</textarea>
			</div>
 		</td>
 	</tr>
 	<tr>
 		<th>첨부파일</th>
 		<td>
 			<input type="file" name="uploadFile">
 		</td>
 	</tr> 
 	<!-- 첨부파일이 있다면-->
	<c:if test="${dto.fileName ne null}">
			<tr>
				<th>업로드된 파일</th>
				<td><a href="${path}/board/download/fileDownload.do?fileName=${dto.fileName}">${dto.fileName}</a></td>
			</tr>
	</c:if>
 </table>	

	<br>
	<div style="width: 700px;" align="center">
		<!-- 수정,삭제에 필요한 글번호를 hidden 태그에 저장 -->	
		<input type="hidden" name="bno" value="${dto.bno}">	
			
		<!-- 본인만 수정,삭제 버튼 표시 -->
		<c:if test="${sessionScope.userid == dto.writer}">
			<button type="button" id="btnUpdate" class="btn btn-primary">수정</button>
			<button type="button" id="btnDelete" class="btn btn-danger">삭제</button>
		</c:if>
		
		<!-- 관리자 권한이 있을 경우만 답변 가능 -->
		<c:if test="${sessionScope.admin == 'y' }">
			<button type="button" id="btnReply" onclick="location.href='${path}/board/qna/reply_write.do?bno=${dto.bno}'" class="btn btn-primary">답변</button>		
		</c:if>
		<button type="button" id="btnList" onclick="location.href='${path}/board/qna/list.do'" class="btn btn-secondary">목록</button>
	</div>
</form>
</div>

</body>
</html>