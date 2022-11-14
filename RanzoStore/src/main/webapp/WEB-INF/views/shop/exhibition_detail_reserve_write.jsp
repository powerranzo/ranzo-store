<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<script src="${path}/ckeditor/ckeditor.js"></script>
<link rel="stylesheet" href="${path}/resources/css/exhibition_detail_review.css">
</head>
<body>
   <script>
   CKEDITOR.replace("content",{
	  filebrowserUploadUrl: "${path}/imageUpload.do"
   });
   </script>
</body>
</html>