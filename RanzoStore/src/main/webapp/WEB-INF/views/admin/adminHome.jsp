<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자페이지</title>
<%@ include file="../include/header.jsp"%>
<%@ include file="../include/adminHeader.jspf"%>
<script type="text/javascript">
	$(function() {
		$.ajax({
			type : "POST",
			url : "${path}/admin/popup.do",
			data : {},
			contentType : "application/x-www-form-urlencoded; charset=utf-8",
			dataType : "json",
			success : function(data) {
				console.log('success');
				var list = data;
				for (var i = 0; i < list.length; i++) {
					//     		console.log(list[i]);
					popup(list[i]);
				}
			},
			error : function() {
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
			// 			console.log('option:' + option);
			window.open(url, name, option);
		} else {
			return;
		}
	}
</script>
</head>
<body>
	<%@ include file="../include/menu.jsp"%>
	<div class="content">
			<%@ include file="../include/adminDashboard.jspf"%>
		<section>
			<div class="sectiondiv">
				<article class="profile">
					<div class="welcome">
						<strong>${sessionScope.name}</strong>님
						<p>안녕하세요.
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
						<a class="a1" href="#">최근 예매 내역 ></a>
					</div>
					<hr noshade size="1px" width="310px" color="black">
					<div>최근 예매 내역이 없습니다.</div>
				</article>
				<article class="recentWish">
					<div class="title-s">
						<img src="${path}/resources/images/favorite1.png" height="25">
						<a class="a1" href="#">최근 찜한 상품 ></a>
					</div>
					<hr noshade size="1px" width="310px" color="black">
					<div>아직</div>
				</article>
			</div>
		</section>

		<div class="orderdiv2">
			<div class="welcome">
				<article class="profile">
					<div class="welcome">
						<strong>${sessionScope.name}</strong>님
						<p>안녕하세요.
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
						<a class="a1" href="#">최근 예매 내역 ></a>
					</div>
					<hr noshade size="1px" width="310px" color="black">
					<div>최근 예매 내역이 없습니다.</div>
				</article>
				<article class="recentWish">
					<div class="title-s">
						<img src="${path}/resources/images/favorite1.png" height="25">
						<a class="a1" href="#">최근 찜한 상품 ></a>
					</div>
					<hr noshade size="1px" width="310px" color="black">
					<div>아직</div>
				</article>
			</div>
		</div>
	</div>
	<footer>
		<%@ include file="../include/footer.jsp"%>
	</footer>
</body>
</html>
