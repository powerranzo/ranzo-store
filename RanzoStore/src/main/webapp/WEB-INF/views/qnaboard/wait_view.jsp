<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>qna 게시판</title>
<%@ include file="../include/header.jsp"%>
<script type="text/javascript">
$(function () {
	//목록 버튼
	$("#btnList").click(function(){
		location.href="${path}/board/qna/list.do";
	});
	//수정 버튼
	$("#btnUpdate").click(function(){
		location.href="${path}/board/qna/detail.do";
	});
	//삭제 버튼
	$("#btnDelete").click(function(){
		if(confirm("삭제하시겠습니까?")){
			document.form1.action="${path}/board/qna/delete.do";
			document.form1.submit();
		}
	});
	
	listAttach();
	//첨부파일 삭제
	//id가 uploadedList인 태그의 class가 file_del인 태그 클릭
	$("#uploadedList").on("click",".file_del",function(e){
		var that=$(this); //클릭한 태그
	//data: {fileName: $(this).attr("data-src") },		
		$.ajax({
			type: "post",
			url: "${path}/upload/deleteFile",
			data: "fileName="+	$(this).attr("data-src"),		
			dataType: "text",
			success: function(result){
				if(result=="deleted"){
					//화면에서 태그 제거
					that.parent("div").remove();
				}
			}
		});
	});
});
</script>

</head>
<body>
	<%@ include file="../include/menu.jsp"%>
	<div align="center">
		<h2>문의내역 보기</h2><br>
		
		<form id="form1" name="form1" method="post" action="${path}/board/qna/insert.do">
		
		
		<table border="1">
			<tr>
				<th>글번호</th>
				<td>${dto.bno}</td>
			</tr>
			<tr>
				<th>제목</th>
				<td>${dto.title}</td>
			</tr>
			<tr>
				<th>내용</th>
				<td style="width: 700px; height: 300px;">${dto.content}</td>
			</tr>
		</table>

		<input type="hidden" name="bno" value="${dto.bno}">
		<!-- 본인만 수정,삭제 버튼 표시 -->
		<c:if test="${sessionScope.userid == dto.writer}">
			<button type="button" id="btnUpdate">수정</button>
			<button type="button" id="btnDelete">삭제</button>
		</c:if>
		<button type="button" id="btnList">목록</button>
		
	</form>

	</div>	
</body>
</html>