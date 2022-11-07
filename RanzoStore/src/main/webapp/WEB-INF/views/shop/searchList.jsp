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
	.resultdiv{
		font-size: 20px;
		color: gray;
	}
	</style>
	<script type="text/javascript">
		$(function(){
			
			$(window).scroll(function(){
				var scrollNow = $(window).scrollTop();
				  if (scrollNow + $(window).height() + 100 >= $('#mainPage').height()){
			            getList(scrollPage);
			        }
			    })
			})
/* 
		function getList(page){
		    if (!loading){
		        loading = true;
		        $.ajax({
		            url:"shop/exhibition/getList",
		            type:"get",
		            data:{"page":page},
		            dataType:"html",
		            success:function(res){
		                $("#mainPage > #sv_wrap > .sv_ct").append(res);
		                loading = false;
		                scrollPage += 1;
		            }
		        })
		    }
		}
*/
	</script>
</head>
<body>
<%@ include file="../include/menu.jsp" %>
<h2>Search: ${map.keyword} (${map.count} 건)</h2>
<hr>
	<section class="sec-content">
		
	
	<c:choose>
	 <c:when test="${map.count==0}">
	  <div class="resultdiv">검색 결과가 없습니다.</div>
	 </c:when>
	 <c:otherwise>
	  <div class="sec-exhibition">
		<ul class="shop-list">
			<c:forEach var="dto" items="${map.list}">
				<li>
					<a href="${path}/shop/exhibition/detail/${dto.code}">
						<div class="prd-imgbox">
							<img class="prd-img" src="${dto.thumnail}">
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
	 
	 
	 </c:otherwise>
	</c:choose>
	
		
	</section>
</body>
</html>

