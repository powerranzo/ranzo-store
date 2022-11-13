<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>팝업 등록</title>
<%@ include file="../include/header.jsp"%>
<%@ include file="../include/adminHeader.jspf"%>
<style type="text/css">
.adminTable3 input {
	float: left;
}

.adminTable3 {
	width: 90%;
}

#adminTB2_th {
	width: 20%;
}
form {
	margin-top: 3%;
}
#content {
	width:30% !important;
	height:30% !important;
}
#category, #title {float:left; width:90%;}
</style>
<script type="text/javascript">
	$(function() {
		$("#content").summernote({
			height : 300
		});
		$("#btnWrite").click(function() {
				if (faqCheck()) 
					document.form1.submit();
		});
	});	
</script>
</head>
<body>
	<%@ include file="../include/menu.jsp"%>
	<div class="content">
		<section>
			<%@ include file="../include/adminDashboard.jspf"%>
			<div class=sectiondiv>
				<h2><a href="${path}/faq/list.do">FAQ</a></h2>
				<form name="form1" action="${path}/faq/insert.do" method="post">
					<table class="adminTable3">
						<tr>
							<th id="adminTB2_th">카테고리</th>
							<td>
								 <select name="category" id="category">
									 <option value="예매/취소">예매/취소</option>
									 <option value="결제">결제</option>
									 <option value="회원">회원</option>
									 <option value="기타">기타</option> 
								</select>
							</td>
						</tr>
						<tr>
							<th>제목</th>
							<td><input type="text" name="title" id="title"></td>
						</tr>
						<tr>
							<th>내용</th>
							<td>
								<textarea rows="15" cols="80" id="content" name="content"></textarea>
							</td>
						</tr>
					</table>
					</form>
				<input id="btnWrite" name="btnWrite" type="button" value="등록하기" style="margin-right:10%;">
			</div>
		</section>
	</div>
	<%@ include file="../include/footer.jsp"%>
</body>
</html>