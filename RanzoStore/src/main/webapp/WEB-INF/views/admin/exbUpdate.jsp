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
#summary {
	width:30% !important;
	height:300px !important;
}
#tb3 td{width:25%;}
#tb3 th{width:25%;}
form{margin-top:3%;}
</style>
<script type="text/javascript">
	$(function() {
		$("#summary").summernote({
			height : 300
		});
		$("#btnUpdate").click(function() {
			alertify.confirm("수정하시겠습니까?", function() {
				document.form1.action = "${path}/admin/exb_update.do";
				document.form1.submit();
			});
		});
		$("#btnDelete").click(function() {
			alertify.confirm("종료하시겠습니까?", function() {
				document.form1.action = "${path}/admin/exb_delete.do";
				document.form1.submit();
			});
		});
		$("#btnShow").click(function() {
			alertify.confirm("재개하시겠습니까?", function() {
				document.form1.action = "${path}/admin/exb_show.do";
				document.form1.submit();
			});
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
							$("#thumnailImg").remove();
							$("#fileDel").remove();
						}
						if (param == "product_info"){
							$("#pdtInfoImg").remove();
							$("#fileDel2").remove();
						}
						alert('삭제되었습니다.');
					}
				}
			})
		});
	}
</script>
</head>
<body>
	<%@ include file="../include/menu.jsp"%>
	<div class="content">
		<section>
			<%@ include file="../include/adminDashboard.jspf"%>
			<div class="sectiondiv">
				<h2>전시 수정</h2>
				<form name="form1" enctype="multipart/form-data" method="post">
					<table class="adminTable3">
						<tr>
							<th id="adminTB2_th">전시코드</th>
							<td>
								<input name="code" id="code" value="${dto.code}" readonly>
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
							<th>포스터 이미지</th>
							<td>
								<input type="file" name="file" id="file">
							</td>
						</tr>
						<tr>
							<th>전시 정보 이미지</th>
							<td>
								<input type="file" name="file2"	id="file2">
							</td>
						</tr>
					</table>
					
					<table class="adminTable3">
						<tr>
							<th style="width:15%;">내용</th>
							<td>
								<textarea name="summary" id="summary" 
								placeholder="내용을 입력해주세요." rows="20">${dto.summary}</textarea>
							</td>
						</tr>
					</table>
				</form>
				
				<table class="adminTable3" id="tb3">
						<tr>
							<th id="adminTB2_th">현재 포스터</th>
							<td>
								<c:if test="${dto.thumnail != '-'}">
								${thumnailName} 
								<img id="thumnailImg" src="${dto.thumnail}" width="100" height="100">
								<button class="btn btn-sm" name="fileDel" id="fileDel" type="button">
									<span class="glyphicon glyphicon-remove"></span>&nbsp;삭제
								</button>
								</c:if>
							</td>
							<th>현재 전시정보</th>
							<td>
								<c:if test="${dto.product_info != '-'}">
								${product_infoName} 
								<img id="pdtInfoImg" src="${dto.product_info}" width="100" height="100">
								<button class="btn btn-sm" id="fileDel2" name="fileDel2" type="button">
									<span class="glyphicon glyphicon-remove"></span>&nbsp;삭제
								</button>
								</c:if>
							</td>
						</tr>
						</table>
						<input type="submit" value="수정하기" id="btnUpdate" name="btnUpdate" style="margin-right:10%;">
						<c:choose>
						<c:when test="${dto.show == 'y'}">
						<input type="submit" value="종료처리" id="btnDelete" name="btnDelete" style="margin-right:10px;">
						</c:when>
						<c:otherwise>
						<input type="submit" value="재개처리" id="btnShow" name="btnShow" style="margin-right:10px;">
						</c:otherwise>
						</c:choose>
				<br>
			</div>
		</section>
	</div>
	<footer>
	<%@ include file="../include/footer.jsp"%>
	</footer>
</body>
</html>