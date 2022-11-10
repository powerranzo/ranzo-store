<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자페이지</title>
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/adminHeader.jspf" %>
<script type="text/javascript">
$(function(){
	//
	//날짜체크
// 	$.ajaxSettings.traditional = true;
$.ajax({
    type: "POST",
    url : "${path}/admin/popup.do",
    data : {},
    contentType : "application/x-www-form-urlencoded; charset=utf-8",
    dataType : "json",
    success : function(data){
    	
    	var list=data.list;
    	var img_src="";
    	var start_date="";
    	var end_date="";
    	var img_width="";
    	var img_height="";
    	var pos_width="";
    	var pos_height="";
    	var tmp="";
    	
    	for(var i=0; i<list.length; i++){
    		popup(list[i]);
    	}
    	//여러개일 수 있음.
    	var option = "width = 400, height = 500, top = 100, left = 200, location = no, scrollbars = no";
    	popup(url, name, option);
    },error : function(){
        //Ajax 실패시
    }
});
	popup();
});
function popup(i){
	
    var url = "${path}/admin/popup.do";
	var img_src=i.img_src;
	var start_date=i.start_date;
	var end_date=i.end_date;
	var img_width=i.img_width;
	var img_height=i.img_height;
	var pos_width=i.pos_width;
	var pos_height=i.pos_height;
	
    var name = "popup test";
    var option = "width = 400, height = 500, top = 100, left = 200, location = no, scrollbars = no";
    window.open(url, name, option);
} 
</script>
</head>
<body>
<%@ include file="../include/menu.jsp"%>

<div class="content">

<section>
<%@ include file="../include/adminDashboard.jspf" %>
 <div class="sectiondiv">
		<article class="profile">
			<div class="welcome">
			<strong>${sessionScope.name}</strong>님 <p>
			안녕하세요.
			</div>
			<div class="myreview">
			<img src="${path}/resources/images/pencil_icon.png" height="20">
			<a class="a1" href="#">나의 후기</a>
			</div>
			<div class="myinfo">
			<img src="${path}/resources/images/user_icon.png" height="20">
			<a class="a1" href="${path}/member/infoEnter.do">회원 정보</a>
			</div>
		</article>
		<article class="recentOrder">
			<div class="title-s">
			<img src="${path}/resources/images/ticket_icon.png" height="25">
			<a class="a1" href="#">최근 예매 내역 ></a></div>
 			<hr noshade size="1px" width="310px" color="black"> 
 			<div>최근 예매 내역이 없습니다.</div>
		</article>
		<article class="recentWish">
			<div class="title-s">
			<img src="${path}/resources/images/favorite1.png" height="25">
			<a class="a1" href="#">최근 찜한 상품 ></a></div>
 			<hr noshade size="1px" width="310px" color="black"> 
 			<div>아직</div>
		</article>
	 </div>
	</section>

<div class="orderdiv2">
 	<div class="welcome">
			<article class="profile">
			<div class="welcome">
			<strong>${sessionScope.name}</strong>님 <p>
			안녕하세요.
			</div>
			<div class="myreview">
			<img src="${path}/resources/images/pencil_icon.png" height="20">
			<a class="a1" href="#">나의 후기</a>
			</div>
			<div class="myinfo">
			<img src="${path}/resources/images/user_icon.png" height="20">
			<a class="a1" href="${path}/member/infoEnter.do">회원 정보</a>
			</div>
		</article>
		<article class="recentOrder">
			<div class="title-s">
			<img src="${path}/resources/images/ticket_icon.png" height="25">
			<a class="a1" href="#">최근 예매 내역 ></a></div>
 			<hr noshade size="1px" width="310px" color="black"> 
 			<div>최근 예매 내역이 없습니다.</div>
		</article>
		<article class="recentWish">
			<div class="title-s">
			<img src="${path}/resources/images/favorite1.png" height="25">
			<a class="a1" href="#">최근 찜한 상품 ></a></div>
 			<hr noshade size="1px" width="310px" color="black"> 
 			<div>아직</div>
		</article>
	 </div>
	</div>
	</div>
<%@ include file="../include/footer.jsp"%>
</body>
</html>