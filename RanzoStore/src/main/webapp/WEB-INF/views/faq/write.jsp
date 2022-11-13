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
.content{
	display: flex;
	justify-content: space-between;
}
.faq{
	margin: auto;
	width: 80%;
	margin-top: 10px;
}
.faqtable3{
	width: 90%;
	margin: auto;
}
.faqtable3 td {
	padding: 5px;
	text-align: left;
}
#title{
	width: 50%;
}
#insertBtn{
	width: 80px;
	padding: 5px;
	background-color: black;
	color: white;
	margin-right: 280px;
}
footer{
	clear : both;
	bottom: 0;
}
html, body{
	height: 100%;
}
body {
	display: flex;
  flex-direction: column;
  margin: 0;
}
h3 a:link{text-decoration: none; color: black;}
h3 a:visited{text-decoration: none; color: black;}
h3 a:active{text-decoration: none; color: black;}
</style>
</head>
<body>
	<%@ include file="../include/menu.jsp"%>
		<section>
	<div class="content">
			<%@ include file="../include/adminDashboard.jspf"%>
			<div class="faq">
				<h3><a href="${path}/faq/list.do">FAQ 작성</a></h3>
				<form action="${path}/faq/insert.do" method="post">
					<table class="faqtable3">
						<tr>
							<td>카테고리</td>
							<td><select name="category" id="category">
									<option value="예매/취소">예매/취소</option>
									<option value="결제">결제</option>
									<option value="회원">회원</option>
									<option value="기타">기타</option>
							</select></td>
						</tr>
						<tr>
							<td>제목</td>
							<td><input id="title" name="title"></td>
						</tr>
						<tr>
							<td>내용</td>
							<td><textarea rows="15" cols="50" id="content"
									name="content"></textarea></td>
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td style="text-align: right;"><input type="submit"
								value="작성" id="insertBtn"></td>
						</tr>
					</table>
				</form>
			</div>
	</div>
		</section>
	<footer>
		<%@ include file="../include/footer.jsp"%>
	</footer>
</body>
</html>