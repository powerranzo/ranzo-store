<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>전시 등록</title>
<%@ include file="../include/header.jsp"%>
<%@ include file="../include/adminHeader.jspf"%>
<style type="text/css">
.adminTable3 input{float:left;}
.adminTable3{width:90%;}
#adminTB2_th{width: 20%;}
#content {
	width:30% !important;
	height:30% !important;
}
#adult_price, #teen_price, #kids_price{
	width:21%;
	margin-right:5px;
}
form{margin-top:3%;}
</style>
<script type="text/javascript">
	$(function() {
		$("#content").summernote({
			height : 300
		});
		$("#btnWrite").click(function() {
				if(exbCheck1()){
					document.form1.action = "${path}/admin/exb_write.do";
					document.form1.submit();
				}
		});
	});
	function fileSize(target, name) {
		console.log(name);
		const file = target.files[0];
		const maxsize = 2000 * 1024;
		var filesize = 0;
		if (file.size > maxsize) {
			$("#"+name).html('&nbsp;&nbsp;용량을 초과했습니다.');
			if(name=='filesize1')
			$("#file1").val('');
			if(name=='filesize2')
			$("#file2").val('');
		} else {
			if (file.size >= 1024)
				filesize = Math.round(file.size / 1024);
			else
				filesize = file.size;
			$("#"+name).html(filesize + 'KB');
		}
	}
	
	function resetFile(param) {
		$("#file"+param).val("");
		$("#filesize"+param).html("0 KB");
	}
</script>
</head>
<body>
	<%@ include file="../include/menu.jsp"%>
	<div class="content">
			<%@ include file="../include/adminDashboard.jspf"%>
			<div class=sectiondiv>
				<h2>전시 등록</h2>
				<form name="form1" enctype="multipart/form-data" method="post">
					<table class="adminTable3">
						<tr>
							<th id="adminTB2_th">전시코드</th>
							<td>
								<input name="code" id="code" placeholder="">
							</td>
						</tr>
						<tr>
							<th>전시명</th>
							<td>
								<input name="title" id="title" placeholder="">
							</td>
						</tr>
						<tr>
						<tr>
							<th>전시관</th>
							<td>
								<input name="gallery" id="gallery" placeholder="">
							</td>
						</tr>
						<tr>
							<th>전시지역</th>
							<td>
								<input name="location" id="location" placeholder="">
							</td>
						</tr>
						<tr>
							<th>전시 시작일</th>
							<td>
								<input type="date" name="start_date" id="start_date">
							</td>
						</tr>
						<tr>
							<th>전시 마감일</th>
							<td>
								<input type="date" name="end_date" id="end_date">
							</td>
						</tr>
						<tr>
							<th>전시 가격</th>
							<td>
								<input type="number" name="adult_price" id="adult_price" placeholder="성인">
								<input type="number" name="teen_price" id="teen_price" placeholder="청소년">
								<input type="number" name="kids_price" id="kids_price" placeholder="아동">
							</td>
						</tr>
						<tr>
							<th>포스터 이미지(10MB)</th>
							<td>
								<input type="file" name="file1" id="file1" onchange="fileSize(this, 'filesize1')">
								<span id="filesize1"></span>
								<button class="btn btn-sm" type="button" onclick="resetFile('1')">
									<span class="glyphicon glyphicon-minus-sign"></span>&nbsp;파일리셋
								</button>
							</td>
						</tr>
						<tr>
							<th>포스터 URL</th>
							<td>
								<input type="text" name="thumnail" id="thumnail">
								<div>
									<img id="urlImage1" style="width: 50%; height: 50%">
								</div>
							</td>
						</tr>
						<tr>
							<th>전시 정보 이미지(10MB)</th>
							<td>
								<input type="file" name="file2"	id="file2" onchange="fileSize(this, 'filesize2')">
								<span id="filesize2"></span>
								<button class="btn btn-sm" type="button" onclick="resetFile('2')">
									<span class="glyphicon glyphicon-minus-sign"></span>&nbsp;파일리셋
								</button>
							</td>
						</tr>
						<tr>
							<th>전시 정보 URL</th>
							<td>
								<input type="text" name="attach" id="attach">
								<div>
									<img id="urlImage2" style="width: 50%; height: 50%">
								</div>
							</td>
						</tr>
					</table>
					<table class="adminTable3">
						<tr>
							<th style="width:15%;">전시 요약</th>
							<td>
								<input name="summary" id="summary">
							</td>
						</tr>
						<tr>
							<th style="width:15%;">전시 정보</th>
							<td>
								<textarea name="content" id="content" 
								placeholder="내용을 입력해주세요." rows="20"></textarea>
							</td>
						</tr>
					</table>
				</form>
				<input type="submit" value="등록하기" id="btnWrite" name="btnWrite" style="margin-right:10%;">
				<br>
			</div>
	</div>

	<footer>
		<%@ include file="../include/footer.jsp"%>
	</footer>

</body>
</html>