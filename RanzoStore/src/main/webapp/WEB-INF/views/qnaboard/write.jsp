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

<style>
.fileDrop {
	width: 600px;
	height: 100px;
	border: 1px dotted gray;
	background-color: gray;
}
</style>

<script>
function checkImageType(fileName){
	var pattern=/jpg|png|gif/i; //정규표현식(i는 대소문자 무시)
	return fileName.match(pattern); //규칙에 맞으면 true가 리턴
}
function getOriginalName(fileName){
	if(checkImageType(fileName)){//이미지 파일이면 skip
		return;
	}
	var idx=fileName.indexOf("_")+1; //uuid를 제외한 파일이름만 뽑음
	return fileName.substr(idx);
}
function getImageLink(fileName){
	if(!checkImageType(fileName)){ //이미지 파일이 아니면 skip
		return;
	}
	var front=fileName.substr(0,12)//연월일 경로(0~11번째 까지 자르고)
	var end=fileName.substr(14);// 14번째 문자열 앞의 s_ 제거
	return front+end;
}

$(function(){ //페이지가 뜨자마자 실행
	$("#btnSave").click(function(){
		var str="";
   //uploadedList 영역에 클래스이름이 file인 히든타입의태그를 각각 반복
		$(".uploadedList .file").each(function(i){
			console.log(i);
			//hidden 태그 구성
			str += "<input type='hidden' name='files["+i+"]'	value='"
	+ $(this).val()+"'>";
		});
		//폼에 hidden 태그들을 붙임
		$("#form1").append(str);
		document.form1.submit();
	});
	
	
	
	
	//dragenter : 마우스가 대생 객체의 위로 처음 진입할 때,
	//dragover : 드래그하면서 마우스가 대상 객체의 위에 자리 잡고 있을 때
	$(".fileDrop").on("dragenter dragover", function(event){
		event.preventDefault();// 파일을 여는 기본효과를 막음
	});
	$(".fileDrop").on("drop", function(event){
		event.preventDefault();// 파일을 여는 기본효과를 막음
		//첨부파일 배열(여러개를 동시에 선택해서 드래그 할 수도 있기때문에 한개만 처리하도록 조처)
		var files=event.originalEvent.dataTransfer.files;
		var file=files[0]; //첫번째 첨부파일
		//FormData()는 Ajax방식의 파일업로드의 핵심인 객체로
		//브라우저에서 지원하는 클래스이며 form태그와 같은 역할을 함
		var formData=new FormData();
		formData.append("file",file); //폼에 file변수 추가
		//서버에 파일 업로드(백그라운드에서 실행)
		$.ajax({
			type: "post",
			url: "${path}/upload/uploadAjax",
			data: formData,
			dataType: "text",
			processData: false, //파일전송시 자동으로 쿼리스트링형식으로 전송되지 않도록 막는 처리
			contentType: false, //multipart/form-data로 처리되는것과 같음
			success: function(data,status,req){
				console.log("data : " + data);//업로된 파일 이름
				console.log("status : " + status);//성공,실패 여부
				console.log("req : " + req.status);//요청코드값
				
				var str="";
				if(checkImageType(data)){ //이미지 파일
					str="<div><a href='${path}/upload/displayFile?fileName="
						+getImageLink(data)+"'>";
					str+="<img src='${path}/upload/displayFile?fileName="
						+data+"'></a>";	
				}else{//이미지가 아닌 경우
					str="<div>";
					str+="<a href='${path}/upload/displayFile?fileName="
						+data+"'>"+getOriginalName(data)+"</a>";
				}
				str+="<span data-src="+data+">[삭제]</span></div>";
				
				
				$(".uploadedList").append(str);
			}
		});
		
		//첨부파일 삭제 함수
		$(".uploadedList").on("click","span",function(event){//내부적으로 span태그가 클릭되면
			var that=$(this); //this는 현재 클릭한 태그, 즉 span태그
			$.ajax({
				url: "${path}/upload/deleteFile",
				type: "post",
				data: {
					fileName: $(this).attr("data-src")
				},
				dataType: "text",
				success: function(result){
					if(result=="deleted"){
						that.parent("div").remove();//파일삭제되면 행전체<div>를 삭제처리
					}
				}
			});
		});
	});
});
</script>
	

</head>
<body>
<div align="center">
<%@ include file="../include/menu.jsp" %>
<h2>QNA 문의하기</h2><br>
<form id="form1" name="form1" method="post" action="${path}/board/qna/insert.do">
	<table style="width: 700px;">
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
	</table>
	<div> 첨부파일을 등록하세요
		<div class="fileDrop"></div>
		<div class="uploadedList"></div>
	</div>
	<br>
	<div style="width: 700px;" align="center">
		<button type="button" id="btnList" onclick="location.href='${path}/board/qna/list.do'">목록</button>		
		<button type="button" id="btnSave">확인</button>
	</div>
</form>
</div>
</body>
</html>