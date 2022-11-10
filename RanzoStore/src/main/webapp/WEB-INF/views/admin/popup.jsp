<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${dto.title}</title>
<style type="text/css">
.checkDiv {
	position: fixed; bottom : 0;
	width: 100%;
	background-color: gray;
	color: white;
	left:0;
	right:0;
	bottom: 0;
}

.popImg {
	position: fixed;
	top: 0;
	left:0;
	right:0;
	bottom: 0;
}
</style>
</head>
<body>
<!-- <img src="https://helpx.adobe.com/content/dam/help/en/photoshop/using/quick-actions/remove-background-before-qa1.png"> -->

<div class="popImg">
<img src="${dto.img_src}" width="100%" height="100%">
</div>
<div class="checkDiv">
하루 동안 보지 않기
<input type="checkbox" name="noShow" id="noShow">
</div>
</body>
</html>