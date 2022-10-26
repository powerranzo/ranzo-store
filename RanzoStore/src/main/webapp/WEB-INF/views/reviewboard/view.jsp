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

<script>
$(function(){
	//댓글 목록 출력
	listReply();
	//listReply2();
	
	//댓글 쓰기
	$("#btnReply").click(function(){
		var replytext=$("#replytext").val(); //댓글 내용
		var bno="${dto.bno}"; //게시물 번호
		var param={ "replytext": replytext, "bno": bno};
		//var param="replytext="+replytext+"&bno="+bno;
		$.ajax({
			type: "post",
			url: "${path}/board/reply/insert.do",
			data: param,
			success: function(){
				alert("댓글이 등록되었습니다.");
				listReply();
				//listReply2(); //댓글 목록 출력
			}
		});
	});
	
	$(".fileDrop").on("dragenter dragover",function(e){
		//기본 효과 막음
		e.preventDefault();
	});
	$(".fileDrop").on("drop",function(e){
		e.preventDefault();
		//첫번째 첨부파일
		var files=e.originalEvent.dataTransfer.files;
		var file=files[0];
		//폼 데이터에 첨부파일 추가
		var formData=new FormData();
		formData.append("file",file);
		$.ajax({
			url: "${path}/upload/uploadAjax",
			data: formData,
			dataType: "text",
			processData: false,
			contentType: false,
			type: "post",
			success: function(data){
				//console.log(data);
				//data : 업로드한 파일 정보와 Http 상태 코드
				var fileInfo=getFileInfo(data);
				//console.log(fileInfo);
				var html="<a href='"+fileInfo.getLink+"'>"+
					fileInfo.fileName+"</a><br>";
				html += "<input type='hidden' class='file' value='"
					+fileInfo.fullName+"'>";
				$("#uploadedList").append(html);
			}
		});
	});
	
	
	//목록 버튼
	$("#btnList").click(function(){
		location.href="${path}/board/review/list.do";
	});
	//수정 버튼
	$("#btnUpdate").click(function(){
		//첨부파일 이름들을 폼에 추가
		var str="";
		$("#uploadedList .file").each(function(i){
//#id이름(공백).클래스이름 : id가 uploadeList인 태그의 자식태그 중에서 class가 file인 태그들
			str+=
				"<input type='hidden' name='files["+i+"]' value='"
				+$(this).val()+"'>";
		});
		$("#form1").append(str);
		document.form1.action="${path}/board/review/update.do";
		document.form1.submit();
	});
	//삭제 버튼
	$("#btnDelete").click(function(){
		if(confirm("삭제하시겠습니까?")){
			document.form1.action="${path}/board/review/delete.do";
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
	$("#btnSave").click(function(){
		var str="";
		// uploadedList 내부의 .file 태그 각각 반복
		$("#uploadedList .file").each(function(i){
			console.log(i);
			//hidden 태그 구성
			str += 
"<input type='hidden' name='files["+i+"]'	value='"
	+ $(this).val()+"'>";
		});
		//폼에 hidden 태그들을 붙임
		$("#form1").append(str);
		document.form1.submit();
	});
	
});
//댓글 목록 출력 함수
function listReply(){
	$.ajax({
		type: "get",
		url: "${path}/board/reply/list.do?bno=${dto.bno}",
		success: function(result){
			//result : responseText 응답텍스트(html)
			$("#listReply").html(result);
		}
	});
}
//타임스탬프값(숫자형)을 문자열 형식으로 변환
function changeDate(date){
	date = new Date(parseInt(date));
	year=date.getFullYear();
	month=date.getMonth();
	day=date.getDate();
	hour=date.getHours();
	minute=date.getMinutes();
	second=date.getSeconds();
	strDate = 
		year+"-"+month+"-"+day+" "+hour+":"+minute+":"+second;
	return strDate;
}
function listReply2(){
	$.ajax({
		type: "get",
		contentType: "application/json",
		url: "${path}/board/reply/list_json.do?bno=${dto.bno}",
		success: function(result){
//view를 만들지 않는 대신에 자바스크립트로 table등을 만들어야 한다.
			console.log(result);
			var output="<table>";
			for(var i in result){
				var repl=result[i].replytext;
				// /정규식/(규칙) => 정규표현식
				// 규칙 g: global 전역검색, i: 대소문자 무시
				// ex) /java/gi => JAVA 또는 java를 모두 찾음
				repl = repl.replace(/  /gi,"&nbsp;&nbsp;");//공백처리
				repl = repl.replace(/</gi,"&lt;"); //태그문자 처리
				repl = repl.replace(/>/gi,"&gt;");
				repl = repl.replace(/\n/gi,"<br>"); //줄바꿈 처리
				
				output += "<tr><td>"+result[i].name;
				date = changeDate(result[i].regdate);
				output += "("+date+")";
				output += "<br>"+repl+"</td></tr>";
			}
			output+="</table>";
			$("#listReply").html(output);
		}
	});
}
//첨부파일 리스트를 출력하는 함수
function listAttach(){
	$.ajax({
		type: "post",
		url: "${path}/board/review/getAttach/${dto.bno}",
		success: function(list){
// Controller에서 List<String>타입으로 넘어온 값을 처리하기 위해 json으로 처리
			// list : json
			//console.log(list);
			$(list).each(function(){
				var fileInfo=getFileInfo(this);
				//console.log(fileInfo);
				var html="<div><a href='"+fileInfo.getLink+"'>"
					+fileInfo.fileName+"</a>&nbsp;&nbsp;";
				<c:if test="${sessionScope.userid == dto.writer}">	
				html+="<a href='#' class='file_del' data-src='"
					+this+"'>[삭제]</a></div>";
			</c:if>
			$("#uploadedList").append(html);
		});
	}
});
}

</script>
</head>
<body>
<%@ include file="../include/menu.jsp" %>
<h2>Review 수정</h2>
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
			<input id="product" name="product" value="${dto.product}" placeholder="전시명을 입력하세요.">
			</td>
		</tr>
		<tr>
			<th>제목</th>
			<td>
			<input id="subject" name="subject" value="${dto.subject}" size="70" placeholder="제목을 입력하세요.">
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
	<!-- 수정, 삭제에 필요한 글번호를 hidden 태그에 저장 -->
	<input type="hidden" name="bno" value="${dto.bno}">
		
		<!-- 본인만 수정, 삭제 버튼 표시 -->		
		<c:if test="${sessionScope.userid == dto.writer}">
			<button type="button" id="btnUpdate">수정</button>
			<button type="button" id="btnDelete">삭제</button>
		</c:if>
	<button type="button" id="btnList">목록</button>
	</div>
</form>
<!-- 댓글 작성 -->
<div style="width:700px; text-align:center;">
	 <c:if test="${sessionScope.userid != null }">
	 	<textarea rows="5" cols="80" id="replytext" placeholder="댓글을 작성하세요"></textarea><br>
	 	<button type="button" id="btnReply">댓글 작성</button>
	 </c:if>
</div>
<!-- 댓글 목록 -->
<div id="listReply"></div>

</body>
</html>