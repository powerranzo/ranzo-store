<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAQ 수정</title>
<%@ include file="../include/header.jsp" %>
<style type="text/css">
.faq{
	margin: auto;
	width: 80%;
	margin-top: 10px;
}
.faqtable3{
	width: 80%;
	margin: auto;
}
.faqtable3 td {
	padding: 5px;

}
#title{
	width: 600px;
}
#insertBtn{
	width: 80px;
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
h2 a:link{text-decoration: none; color: black;}
h2 a:visited{text-decoration: none; color: black;}
h2 a:active{text-decoration: none; color: black;}
</style>
<script type="text/javascript">
$(function(){
	$("#btnUpdate2").click(function(){
		document.formfaq2.action="${path}/faq/update/${dto.no}";
		document.formfaq2.submit();
	});
});
</script>



</head>
<body>
<%@ include file="../include/menu.jsp"%>
<div class="faq">
<h2><a href="${path}/faq/list.do">FAQ</a></h2>
<form action="${path}/faq/update/${dto.no}" method="post" name="formfaq2">
<table class="faqtable3">
<tr>
 <td>카테고리</td>
 <td><select name="category" id="category">
 <option value="예매/취소" <c:if test="${dto.category == '예매/취소'}"> selected </c:if> >예매/취소</option>
 <option value="결제" <c:if test="${dto.category == '결제'}"> selected </c:if> >결제</option>
 <option value="회원" <c:if test="${dto.category == '회원'}"> selected </c:if> >회원</option>
 <option value="기타" <c:if test="${dto.category == '기타'}"> selected </c:if> >기타</option> 
</select></td>
</tr>
<tr>
 <td>제목</td>
 <td><input id="title" name="title" value="${dto.title}"></td>
</tr>
<tr>
<td>내용</td>
<td>
<textarea rows="15" cols="80" id="content" name="content">${dto.content}</textarea>
</td>
</tr>
<tr>
 <td>&nbsp;</td>
 <td style="text-align: center;"><input type="button" value="작성" id="btnUpdate2"></td>
</tr>
</table>
</form>
</div>
<footer>
<%@ include file="../include/footer.jsp"%>
</footer>
</body>
</html>