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
<script type="text/javascript">
$(function(){
	$("#btnClose").click(function(){
		var date = new Date();
		date = date.setTime(date.getTime() + exp * 24 * 60 * 60 * 1000);
		localStorage.setItem("exp", date);
	});
});
/* 스토리지 제어 함수 정의 */
var handleStorage = {
  // 스토리지에 데이터 쓰기(이름, 만료일)
  setStorage: function (name, exp) {
    // 만료 시간 구하기(exp를 ms단위로 변경)
    var date = new Date();
    date = date.setTime(date.getTime() + exp * 24 * 60 * 60 * 1000);

    // 로컬 스토리지에 저장하기
        // (값을 따로 저장하지 않고 만료 시간을 저장)
    localStorage.setItem(name, date)
  },
  // 스토리지 읽어오기
  getStorage: function (name) {
    var now = new Date();
    now = now.setTime(now.getTime());
    // 현재 시각과 스토리지에 저장된 시각을 각각 비교하여
    // 시간이 남아 있으면 true, 아니면 false 리턴
    return parseInt(localStorage.getItem(name)) > now
  }
};	

</script>
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