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
</script>

<c:set var="path" value="${pageContext.request.contextPath}" />
<nav class="navbar navbar-inverse" id="bootstrap-overrides">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="${path}"><img src="${path}/resources/images/rlogo2.png" width="25"></a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li><a href="#">ABOUT</a></li>
        <li class="dropdown">
        <a class="dropdown-toggle" data-toggle="dropdown" href="#">EXHIBITION<span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="${path}/shop/exhibition/list">현재 전시</a></li>
          <li><a href="#">지난 전시</a></li>
        </ul>
      </li>
        <li><a href="#">FAQ</a></li>
				<li><a href="${path}/board/qna/list.do">QNA</a></li>
				<li><a href="${path}/board/review/list.do">REVIEW</a></li>
				<li><a href="${path}/upload/uploadForm">업로드 테스트</a></li>
				<li><a href="${path}/upload/uploadAjax">업로드 테스트(ajax)</a></li>
      </ul>
   <!--    <form class="navbar-form navbar-left" action="#">
				<div class="input-group">
        <input type="text" class="form-control" placeholder="Search" name="search">
        <div class="input-group-btn">
          <button class="btn btn-default" type="submit">
            <i class="glyphicon glyphicon-search"></i>
          </button>
        </div>
      </div>
    </form> -->
      <ul class="nav navbar-nav navbar-right">    
        <c:choose>
        <c:when test="${sessionScope.userid == null}">
        <li><a href="${path}/member/login.do"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
        <li><a href="${path}/member/join.do"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
        </c:when>
        <c:otherwise>
			  <li><a href="${path}/member/logout.do"><span class="glyphicon glyphicon-log-out"></span> Logout</a></li>
				<li><a href="${path}/member/mypage.do">MY PAGE</a></li>
				<c:if test="${sessionScope.admin == 'y'}">
			   <li><a href="${path}/admin/home.do">ADMIN PAGE</a></li>
			  </c:if>
				</c:otherwise>
        </c:choose>
      </ul>
    </div>
  </div>
</nav>

<div class="searchHeader">
<a href="#"><img src="${path}/resources/images/calendar_icon.png" height="20"></a> 
<button class="btn-open-popup"><img src="${path}/resources/images/searchicon.png" height="20"></button>
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