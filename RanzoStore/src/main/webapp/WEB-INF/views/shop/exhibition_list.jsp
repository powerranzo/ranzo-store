<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전시</title>
<%@ include file="../include/header.jsp" %>	
<link rel="stylesheet" href="${path}/resources/css/exhibition_list.css">
<style type="text/css">
/* .prd-imgbox{
	position: relative;
	margin: auto;
}
.image_child{
	position: absolute;
	top: 8px;
	right: 8px;
	z-index: 1000;
} */

</style>


<!-- <script type="text/javascript">
$(function(){
	$(".imgch").mouseover(function(){
		$(this).attr("src","${path}/resources/images/favorite2.png");			
	});
	$(".imgch").mouseout(function(){
		$(this).attr("src","${path}/resources/images/favorite1.png");
	});
	$(".imgch").click(function(){
		$(this).attr("src","${path}/resources/images/favorite2.png");
		location.href="${path}/wish.do";
	});
}); -->

</script>
</head>
<body>
		<div class="sec-exhibition">
		<ul class="shop-list">
			<c:forEach var="dto" items="${list}">
				<li>
					<a href="${path}/shop/exhibition/detail/${dto.code}">
						<div class="prd-imgbox">
							<img class="prd-img" src="${dto.thumnail}">
							<%-- <div class="image_child">
	  					 <img src="${path}/resources/images/favorite1.png" class="imgch">
	  					</div> --%>
						</div>
						<div class="prd-info">
							<span class="prd-title">${dto.title}</span>
							<span class="prd-place">${dto.gallery}</span>
							<span class="prd-period">
								<fmt:formatDate value="${dto.start_date}" pattern="yyyy-MM-dd"/> ~ 
								<fmt:formatDate value="${dto.end_date}" pattern="yyyy-MM-dd"/>
							</span>
						</div> 
						<div class="admin"> <!-- 관리자용 -->
							<c:if test="${sessionScope.admin_userid != null }">
								<br><a href="#">[편집]</a>
							</c:if>
						</div>
					</a>
				</li>
			</c:forEach>
		</ul>
		</div>
</body>
</html>

