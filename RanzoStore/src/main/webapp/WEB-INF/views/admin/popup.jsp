<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${dto.title}</title>
<script src="${pageContext.request.contextPath}/include/jquery-3.6.0.min.js"></script>
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
<script type="text/javascript">
$(function(){
	$("#btnClose").click(function(){
		var date = new Date();
		date = date.setTime(date.getTime() + 60 * 1000); //테스트용
// 		date = date.setTime(date.getTime() + 24 * 60 * 60 * 1000);
		window.localStorage.setItem("exp"+'${dto.no}', date);
		window.close();
	});
});
</script>
</head>
<body>
	<div class="popImg">
		<img src="${dto.img_src}" width="100%" height="100%">
	</div>
	<div class="checkDiv">
		<button id="btnClose" class="btnClose" type="button">
			<span>오늘 하루 보지 않기 X</span>
		</button>
	</div>
</body>
</html>