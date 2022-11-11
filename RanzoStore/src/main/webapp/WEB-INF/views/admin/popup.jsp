<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${dto.title}</title>
<style type="text/css">
.checkDiv {
	position: fixed;
	bottom: 0;
	width: 100%;
	background-color: gray;
	color: white;
	left: 0;
	right: 0;
	bottom: 0;
}

.btnClose {
	width: 100%;
	height: 40px;
	background-color: #333;
	text-align: center;
	color: #fff;
	font-size: 14px;
	display: block; 
/* 	span { */
/* 	line-height: 35px; */
/* 	vertical-align: bottom; */
/* 	opacity: 0.8; */
/* 	} */
}

.popImg {
	position: fixed;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
}
</style>
</head>
<body>
	<div class="popImg">
		<img src="${dto.img_src}" width="100%" height="100%">
	</div>
	<div class="checkDiv">
		<button class="btnClose">
			<span>오늘 하루 보지 않기 X</span>
		</button>
		<!-- <input type="checkbox" name="noShow" id="noShow"> -->
	</div>
</body>
</html>