<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>전시 수정</title>
<%@ include file="../include/header.jsp"%>
<%@ include file="../include/adminHeader.jspf"%>
<style type="text/css">
.adminTable3 input{float:left;}
.adminTable3{width:90%;}
#adminTB2_th{width: 20%;}
#content {
	width:30% !important;
	height:300px !important;
}
#tb3 td{width:25%;}
#tb3 th{width:25%;}
#adult_price, #teen_price, #kids_price{
	width:21%;
	margin-right:5px;
}
form{margin-top:3%;}
</style>
<script type="text/javascript">
	$(function() {
		if("${dto.show=='n'}") $("#btnDelete").hide();
		else $("#btnShow").hide();
		
		$("#content").summernote({
			height : 300
		});
		$("#btnUpdate").click(function() {
				if(exbCheck2()){
					document.form1.action = "${path}/admin/exb_update.do";
					document.form1.submit();
				}
		});
		$("#btnDelete").click(function() {
			$.ajax({
				type : "post",
				url : "${path}/admin/exb_delete.do",
			//	async : false,
				data : {"code" : "${dto.code}"},
				success : function() {
						alertify.confirm("종료되었습니다.", function() {
							$("#btnShow").show();
							$("#btnDelete").hide();
					});
				}
			})
			
			alertify.confirm("종료하시겠습니까?", function() {
				document.form1.action = "${path}/admin/exb_delete.do";
				document.form1.submit();
			});
		});
		$("#btnShow").click(function() {
			$.ajax({
				type : "post",
				url : "${path}/admin/exb_show.do",
				async : false,
				data : {"code" : "${dto.code}"},
				success : function() {
						alertify.confirm("재개되었습니다.", function() {
							$("#btnDelete").show();
							$("#btnShow").hide();
					});
				}
			})
		});
		$("#fileDel").click(function() {
			console.log('fileDel clicked');
			fileDel('thumnail');
		});
		$("#fileDel2").click(function() {
			fileDel('product_info');
		});
	});

	function fileDel(param) {
		console.log(param);
		alertify.confirm("삭제하시겠습니까?", function() {
			$.ajax({
				type : "post",
				url : "${path}/admin/exb_file_delete.do",
				async : false,
				data : {
					"code" : "${dto.code}",
					"fileType" : param
				},
				success : function(result) {
					if (result == 'deleted') {
						if (param == "thumnail"){
							$("#thumnailImg").attr('src', null);
							$("#thumnailImg").hide();
							$("#fileDel").hide();
						}
						if (param == "product_info"){
							$("#pdtInfoImg").attr('src', null);
							$("#pdtInfoImg").hide();
							$("#fileDel2").hide();
						}
					}
				}
			})
		});
	}
	
	function fileSize(target, name) {
		console.log(name);
		const file = target.files[0];
		const maxsize = 2000 * 1024;
		var filesize = 0;
		if (file.size > maxsize) {
			$("#"+name).html('&nbsp;&nbsp;용량을 초과했습니다.');
			if(name=='filesize1')
			$("#file").val('');
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
			<div class="sectiondiv">
				<h2>전시 수정</h2>
				<form name="form1" enctype="multipart/form-data" method="post">
					<table class="adminTable3">
						<tr>
							<th id="adminTB2_th">전시코드</th>
							<td>
								<input name="code" id="code" value="${dto.code}" readonly style="background-color:#e4e4e4;">
							</td>
						</tr>
						<tr>
							<th>전시명</th>
							<td>
								<input name="title" id="title" value="${dto.title}">
							</td>
						</tr>
						<tr>
						<tr>
							<th>전시관</th>
							<td>
								<input name="gallery" id="gallery" value="${dto.gallery}">
							</td>
						</tr>
						<tr>
							<th>전시지역</th>
							<td>
								<input name="location" id="location" value="${dto.location}">
							</td>
						</tr>
						<tr>
							<th>전시 시작일</th>
							<td>
								<input type="date" name="start_date" id="start_date" 
								value="${fn:substring(startDate,0,10)}">
							</td>
						</tr>
						<tr>
							<th>전시 마감일</th>
							<td>
								<input type="date" name="end_date" id="end_date"
								value="${fn:substring(endDate,0,10)}">
							</td>
						</tr>
						<tr>
							<th>전시 가격</th>
							<td>
								<input type="number" name="adult_price" id="adult_price" placeholder="성인"
								value="${dto.adult_price}">
								<input type="number" name="teen_price" id="teen_price" placeholder="청소년"
								value="${dto.teen_price}">
								<input type="number" name="kids_price" id="kids_price" placeholder="아동"
								value="${dto.kids_price}">
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
							<c:choose>
							<c:when test="${dto.thumnail == '-' || mark1 == 1}">
								<input type="text" name="thumnail" id="thumnail">
							</c:when>
							<c:otherwise>
								<input type="text" name="thumnail" id="thumnail" value="${dto.thumnail}">
							</c:otherwise>
							</c:choose>
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
							<c:choose>
							<c:when test="${idto.attach == '-' || mark2 == 1}">
								<input type="text" name="attach" id="attach">
							</c:when>
							<c:otherwise>
								<input type="text" name="attach" id="attach" value="${idto.attach}">
							</c:otherwise>
							</c:choose>
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
								<input name="summary" id="summary" value="${dto.summary}">
							</td>
						</tr>
						<tr>
							<th style="width:15%;">전시 정보</th>
							<td>
								<textarea name="content" id="content" 
								placeholder="내용을 입력해주세요." rows="20">${idto.content}</textarea>
							</td>
						</tr>
					</table>
				</form>
				
				<table class="adminTable3" id="tb3">
						<tr>
							<th id="adminTB2_th">현재 포스터</th>
							<td>
								<img id="thumnailImg" src="${dto.thumnail}" width="100" height="100">
								<c:if test="${mark1 == 1}">
								<button class="btn btn-sm" name="fileDel" id="fileDel" type="button">
									<span class="glyphicon glyphicon-remove"></span>&nbsp;삭제
								</button>
								</c:if>
							</td>
							<th>현재 전시정보</th>
							<td>
								<img id="pdtInfoImg" src="${idto.attach}" width="100" height="100">
								<c:if test="${mark2 == 1}">
								<button class="btn btn-sm" id="fileDel2" name="fileDel2" type="button">
									<span class="glyphicon glyphicon-remove"></span>&nbsp;삭제
								</button>
								</c:if>
							</td>
						</tr>
						</table>
						<input type="submit" value="수정하기" id="btnUpdate" name="btnUpdate" style="margin-right:10%;">
						<input type="submit" value="종료처리" id="btnDelete" name="btnDelete" style="margin-right:10px;">
						<input type="submit" value="재개처리" id="btnShow" name="btnShow" style="margin-right:10px;">
						<input type="submit" value="목록으로" id="btnList" name="btnList" onclick="location.href='${path}/admin/exb_list.do'" style="margin-right:10%;">
		</div>
	</div>
	<footer>
	<%@ include file="../include/footer.jsp"%>
	</footer>
</body>
</html>