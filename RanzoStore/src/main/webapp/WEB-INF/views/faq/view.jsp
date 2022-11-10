<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAQ</title>
<%@ include file="../include/header.jsp"%>


<style type="text/css">
.faq{
	margin: auto;
	width: 80%;
	margin-top: 10px;
}
.faqtable2{
	width:75%;
	margin: auto;
}
.faqtable2 thead{
	font-weight: bold;
	border-top: 2px solid #ddd;
	background-color: #f8f9fa;
}
.faqtable2 td{
	padding: 10px;
	border-bottom: 1px solid #ddd;
}
#listBtn{
	float: right;
	width: 110px;
	height:40px;
	background-color: black;
	color: white;
	margin: 30px 150px 0 0;
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
</style>
<script type="text/javascript">
function faqlist(){
	location.href="${path}/faq/list.do";
}
/* $(function(){
	$("#btnUpdate").click(function(){
		document.formfaq.action="${path}/faq/update/${dto.no}";
		document.formfaq.submit();
	});
	$("#btnDelete").click(function(){
	  if(confirm("삭제하시겠습니까?")){
		document.formfaq.action="${path}/faq/delete/${dto.no}";
		document.formfaq.submit();
	  }
	});
}); */

</script>
</head>
<body>
<%@ include file="../include/menu.jsp"%>

<div class="faq">
<h2>FAQ</h2>

<form action="" name="formfaq">
<input type="hidden" name="no" value="${dto.no}">
<input type="button" value="수정" id="btnUpdate">
<input type="button" value="삭제" id="btnDelete">
<table class="faqtable2">
<thead>
 <tr>
  <td width="15%">${dto.category}</td>
  <td style="text-align: left;">${dto.title}</td>
 </tr>
 </thead>
 <tr>
  <td colspan="2">등록일: <fmt:formatDate value="${dto.reg_date}" pattern="yyyy-MM-dd" /></td>
 </tr>

 <tr>
  <td colspan="2">${dto.content}</td>
 </tr>
</table>
</form>
<button id="listBtn" onclick="faqlist()">목록보기</button>
</div>
<footer>
<%@ include file="../include/footer.jsp"%>
</footer>
</body>
</html>