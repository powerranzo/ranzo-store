<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Review 게시판</title>
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
		var str="";
   //uploadedList 영역에 클래스이름이 file인 히든타입의태그를 각각 반복
		$("#uploadedList .file").each(function(i){
			console.log(i);
			//hidden 태그 구성
			str += "<input type='hidden' name='files["+i+"]'	value='"
	+ $(this).val()+"'>";
		});
		//폼에 hidden 태그들을 붙임
		$("#form1").append(str);
		document.form1.submit();
	});

});
</script>

<style>
.fileDrop {
width: 600px;
height: 100px;
border: 1px dotted gray;
background-color: gray;
}
</style>

</head>
<body>
<%@ include file="../include/menu.jsp" %>
<h2>Review 작성</h2>
<form id="form1" name="form1" method="post" action="${path}/board/review/insert.do">
	<table>
		<tr>
			<th>별점</th>
			<td>
				<select name="rating">
					<option value="5" selected="selected"> ★★★★★</option>
					<option value="4"> ★★★★</option>
					<option value="3"> ★★★</option>
					<option value="2"> ★★</option>
					<option value="1"> ★</option>
				</select>
			</td>
		</tr>
		<tr>
			<th>전시코드</th>
			<td>				
			<input id="product" name="product" value="${dto.product}" placeholder="전시코드를 입력하세요">
			</td>
		</tr>
		<tr>
			<th>제목</th>
			<td>
			<input id="subject" name="subject" value="${dto.subject}" size="70" placeholder="제목을 입력하세요">
			</td>
		</tr>
		<tr>
			<th>내용</th>
			<td>
			<textarea id="content" name="content" rows="2" cols="80" placeholder="내용을 입력하세요">${dto.content}</textarea>
			</td>
		</tr>
		<tr>
			<th>첨부파일</th>
			<td colspan="2">
				<input type="file" name="file1">
			</td>
		</tr>
	</table>

	<div style="width: 700px;" align="center">
		<button type="button" id="btnList" onclick="location.href='${path}/board/qna/list.do'">목록</button>		
		<button type="button" id="btnSave">확인</button>
	</div>
</form>
</body>
</html>