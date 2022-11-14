<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>위시리스트</title>
<%@ include file="../include/header.jsp" %>
<link rel="stylesheet" href="${path}/resources/css/exhibition_list.css">
<link rel="stylesheet" href="${path}/resources/css/CommonDashboard.css">
<script type="text/javascript">

function emptyWish() {
	$.ajax({
		url :"${path}/member/emptyWish.do",
		type :"POST",
		dataType : "json",
		data : {"userid": "${sessionScope.userid}"},
		success : function(data){
			if(data == 0){
				alert("위시리스트를 채워주세요.");
			}else{
				alert("총 "+data+"개의 좋아요가 지워졌습니다.");
			}
			$('.sec-exhibition').load(location.href+' .sec-exhibition');
		}
	});
}

</script>
<style>
* {box-sizing: content-box;}

* {
	margin:0px; 
}
.content{
	margin: 0 80px 0 80px;

}
section {
	width: 75%;
	float: right;
	text-align: left;
}
.orderdiv {
	padding: 50px 0 0 0;
	float: left;
	display: inline-block;
	min-height: 100%;
	width: 80%;
	flex: 1;
}
.p {
	margin: 15px 0 15px 0;
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

.wish-title{
	display: block;
	margin-bottom: 8px;
	font-size: 15px;
	font-weight: bolder;
	color: #424242;
}

.a{
	display: block;
	text-align: right;
	color: black;
	margin-bottom: 20px;
}

</style>
</head>
<body>
<%@ include file="../include/menu.jsp" %>
<div class="content">
<%@ include file="../include/CommonDashboard.jspf" %>
	<section>
	 <div class="orderdiv">
		<div class="title">위시리스트</div>
		<p class="p">위시리스트는 최대 12개까지만 보여집니다.</p>
		<a class="a" onclick="emptyWish()">위시리스트 비우기</a>
		<div class="sec-exhibition">
		<ul class="shop-list">
			<c:forEach var="dto" items="${list}" varStatus="status" begin="0" end="11">
				<li>
					<a href="${path}/shop/exhibition/detail/${dto.code}">
						<div class="prd-imgbox">
							<img class="prd-img" src="${dto.thumnail}">
						</div>
						<br>
						<div class="prd-info">
							<span class="wish-title">${dto.title}</span>
							<span class="prd-place">${dto.gallery}</span>
						</div> 
					</a>
				</li>
			</c:forEach>
		</ul>
		</div>
		</div>
	</section>

</div>
<footer>
<%@ include file="../include/footer.jsp" %>
</footer>
</body>
</html>