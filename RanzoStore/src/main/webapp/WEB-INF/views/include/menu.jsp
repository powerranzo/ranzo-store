<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
/* .navbar-inverse{
	background-color: #f4f4f4;
	border: none;
	color: black;
} */
/* #bootstrap-overrides .navbar-nav>li>a {
    color: black;
} */
</style>
<script>
 	$(function() {	
		$("#searchbtn2").click(function() {
			var keyword = $("#keyword").val();
			if (keyword == "") {
				alert("검색어를 입력하세요.");
				$("#keyword").focus();
				return;
			}
			document.searchform.action = "${path}/shop/exhibition/search.do";
			document.searchform.submit();
		});
	
	}); 
 	function datesearch(){
 		document.dateform.action = "${path}/shop/exhibition/searchDate.do";
 		document.dateform.submit();
 	}
	function datesearch2(){
 		document.dateform2.action = "${path}/shop/exhibition/searchDate.do";
 		document.dateform2.submit();
 	}
</script>
<c:set var="path" value="${pageContext.request.contextPath}" />
	<nav class="nav">
		<div class="logo">
			<a href="${path}"><i class="fa-sharp fa-solid fa-ticket"></i>
			Ranzo</a>
		</div>

		<ul class="menu">
			<li><a href="${path}">HOME</a></li>
			<li><a href="${path}/about.do">ABOUT</a></li>
			<li><a href="${path}/shop/exhibition/list/current">EXHIBITION</a>
				<ul class="depth_1">
					<li><a href="${path}/shop/exhibition/list/current">현재전시</a></li>
					<li><a href="${path}/shop/exhibition/list/past">지난전시</a></li>
				</ul></li>		
			<li><a href="${path}/board/review/list.do">REVIEW</a></li>
			<li><a href="#">고객센터</a>
				<ul class="depth_1">
					<li><a href="${path}/faq/list.do">FAQ</a></li>
					<li><a href="${path}/board/qna/list.do">QNA</a></li>
				</ul></li>
		</ul>
		

				<li><form action="${path}/shop/exhibition/searchDate.do" id="dateform" name="dateform" method="post">
				<i class="fa-solid fa-calendar-days" style="color: black;"></i> 
				<input type="date" name="searchDate" id="searchDate" onchange="datesearch()" value="${map.searchDate}">
					</form></li>
				<li><button class="btn-open-popup"><i class="fa-solid fa-magnifying-glass"></i></button></li>
				</ul>

		<div>
	 </div> 	
	<ul class="my">
	<c:choose>
    <c:when test="${sessionScope.userid == null}">
	   <li><a href="${path}/member/login.do">LOGIN</a></li>
	   <li><a href="${path}/member/join.do">SIGN UP</a></li>
	  </c:when>
	  <c:otherwise>
	   <li><a href="${path}/member/logout.do">LOGOUT</a></li>
		 <li><a href="${path}/member/mypage.do">MY PAGE</a></li>
		 <c:if test="${sessionScope.admin == 'y'}">
			 <li><a href="${path}/admin/home.do">ADMIN PAGE</a></li>
		 </c:if>
	  </c:otherwise>
	 </c:choose>
	 </ul>
	</nav>
	
	<nav class="nav2">
		<div class="logo">
			<a href="${path}"><i class="fa-sharp fa-solid fa-ticket"></i>
			Ranzo</a>
		</div>

		<ul class="menu">
			<li><a href="${path}">HOME</a></li>
			<li><a href="${path}/about.do">ABOUT</a></li>
			<li><a href="${path}/shop/exhibition/list/current">EXHIBITION</a>
				<ul class="depth_1">
					<li><a href="${path}/shop/exhibition/list/current">현재전시</a></li>
					<li><a href="${path}/shop/exhibition/list/past">지난전시</a></li>
				</ul></li>		
			<li><a href="${path}/board/review/list.do">REVIEW</a></li>
			<li><a href="#">고객센터</a>
				<ul class="depth_1">
					<li><a href="${path}/faq/list.do">FAQ</a></li>
					<li><a href="${path}/board/qna/list.do">QNA</a></li>
				</ul></li>
				<li><form action="${path}/shop/exhibition/searchDate.do" id="dateform2" name="dateform2" method="post">
				<i class="fa-solid fa-calendar-days" style="color: black;"></i> 
				<input type="date" name="searchDate" id="searchDate" onchange="datesearch2()" value="${map.searchDate}">
					</form></li>
				<li>
				<form action="${path}/shop/exhibition/search.do?keyword="${map.keyword}" name="searchform2">
				 <input type="text" placeholder="검색어를 입력하세요." value="${map.keyword}" name="keyword">
				 <button id="sBtn"><img src="${path}/resources/images/searchicon.png" height="20"></button>
				</form>
				</li>
				</ul>
		<div>
	 </div> 	
	<ul class="my">
	<c:choose>
    <c:when test="${sessionScope.userid == null}">
	   <li><a href="${path}/member/login.do">LOGIN</a></li>
	   <li><a href="${path}/member/join.do">SIGN UP</a></li>
	  </c:when>
	  <c:otherwise>
	   <li><a href="${path}/member/logout.do">LOGOUT</a></li>
		 <li><a href="${path}/member/mypage.do">MY PAGE</a></li>
		 <c:if test="${sessionScope.admin == 'y'}">
			 <li><a href="${path}/admin/home.do">ADMIN PAGE</a></li>
		 </c:if>
	  </c:otherwise>
	 </c:choose>
	 </ul>
	</nav>
	
<div class="searchHeader">

<!-- 키워드검색 -->
   <div class="modal">
      <div class="modal_body">
      <form action="${path}/shop/exhibition/search.do" id="searchform" name="searchform" method="post">
			 <div class="modal_body2">
       <input type="text" id="keyword" name="keyword" placeholder="검색어를 입력하세요."value="${map.keyword}">
			 <button id="searchbtn2" type="button"><img src="${path}/resources/images/searchicon.png" height="25"></button>
			</div>
      </form>
     </div>
     <script>
      const body = document.querySelector('body');
      const modal = document.querySelector('.modal');
      const btnOpenPopup = document.querySelector('.btn-open-popup');

      btnOpenPopup.addEventListener('click',() => {
        modal.classList.toggle('show');
       /*  if (modal.classList.contains('show')) {
          body.style.overflow = 'hidden';
        } */
      });

      modal.addEventListener('click', (event) => {
        if (event.target === modal) {
          modal.classList.toggle('show');

          if (!modal.classList.contains('show')) {
            body.style.overflow = 'auto';
          }
        }
      });
    </script>
   </div>
</div>