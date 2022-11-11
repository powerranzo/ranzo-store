<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자페이지</title>
<%@ include file="../include/header.jsp"%>
<%@ include file="../include/adminHeader.jspf"%>
<style>
html, body {
	height: 100%;
}

body {
	display: flex;
	flex-direction: column;
	margin: 0;
}
</style>
<script type="text/javascript">
//popup
	$(function() {
		$.ajax({
			type : "POST",
			url : "${path}/admin/popup.do",
			data : {},
			contentType : "application/x-www-form-urlencoded; charset=utf-8",
			dataType : "json",
			success : function(data) {
				if(getStorage()){
					for (var i = 0; i < data.length; i++) 
						popup(data[i]);
				}
			},
			error : function(){
				console.log('error');
			}
		});
	}); //ready

	function popup(i) {
		console.log('popup() 호출');
	    var url = "${path}/admin/popup_img.do?no=" + i.no;
		var name = i.no;
		var today = new Date();
		var date = new Date(i.end_date);
		if (date.getTime() >= today.getTime()) {
			var option = "width = "
					+ i.img_width
					+ ", height = "
					+ i.img_height
					+ ", top = "
					+ i.pos_height
					+ ", left = "
					+ i.pos_width
					+ ", location = no, scrollbars = no, resizable=no, status=no, menubar=no";
			window.open(url, name, option);
		} else {
			return;
		}
	}
	
	function getStorage(){
		var key="exp";
		var exp=parseInt(localStorage.getItem(key));
		
		if(exp==null || exp=="")
			return true;
		else{
			var now = new Date();
		    now = now.setTime(now.getTime());
		    var exp=parseInt(localStorage.getItem(key));
		    console.log("exp:"+exp+", exp-now:"+(exp-now));
		    if(exp > now) 
		    	return false;
		    else 
		    	window.localStorage.removeItem(key);
		    	return true;
		}
	}
</script>
</head>
<body>
	<%@ include file="../include/menu.jsp"%>
	<div class="content">
		<%@ include file="../include/adminDashboard.jspf"%>
		<section>
			<div class="sectiondiv"></div>
		</section>
	</div>
	<footer>
		<%@ include file="../include/footer.jsp"%>
	</footer>
</body>
</html>
