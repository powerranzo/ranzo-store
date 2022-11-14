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

.adminTable3 input {float: left;}
.adminTable3 {width: 90%;}
#adminTB2_th {width: 20%;}
form {margin-top: 3%;}
#category, #title {float:left; width:90%;}

</style>
<script type="text/javascript">
	$(function() {
		$("#content").summernote({
			height : 300
		});
		$("#btnUpdate").click(function() {
				if (faqCheck()) document.form1.submit();
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
				<form name="form1" action="${path}/faq/update/${dto.no}" method="post">
					<table class="adminTable3">
						<tr>
							<th id="adminTB2_th">카테고리</th>
							<td>
								 <select name="category" id="category">
									<option value="예매/취소" <c:if test="${dto.category == '예매/취소'}"> selected </c:if> >예매/취소</option>
 									<option value="결제" <c:if test="${dto.category == '결제'}"> selected </c:if> >결제</option>
 									<option value="회원" <c:if test="${dto.category == '회원'}"> selected </c:if> >회원</option>
									<option value="기타" <c:if test="${dto.category == '기타'}"> selected </c:if> >기타</option> 
								</select>
							</td>
						</tr>
						<tr>
							<th>제목</th>
							<td><input id="title" name="title" value="${dto.title}"></td>
						</tr>
						<tr>
							<th>내용</th>
							<td>
								<textarea rows="15" cols="80" id="content" name="content">${dto.content}</textarea>
							</td>
						</tr>
					</table>
					</form>
				<input id="btnUpdate" name="btnUpdate" type="button" value="수정하기" style="margin-right:10%;">
			</div>
		</section>
	</div>
	<%@ include file="../include/footer.jsp"%>
</body>
</html>