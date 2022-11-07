<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<script type="text/javascript">

</script>

<nav class="navbar navbar-inverse navbar-fixed-top">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="${path}/index.jsp">Momo Magazine</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li><a href="${path}/cafe_servlet/cafe_list.do">Brown Stars</a></li>
        <li><a href="${path}/reviewboard_servlet/board_list.do">Cafe Review</a></li>
        <li><a href="${path}/product_servlet/product_list.do">Magazine</a></li>
      </ul>
      <form class="navbar-form navbar-left" action="#">
<!--       <div class="input-group"> -->
<!--         <input type="text" class="form-control" placeholder="Search" name="search"> -->
<!--         <div class="input-group-btn"> -->
<!--           <button class="btn btn-default" type="submit"> -->
<!--             <i class="glyphicon glyphicon-search"></i> -->
<!--           </button> -->
<!--         </div> -->
<!--       </div> -->
    </form>
      <ul class="nav navbar-nav navbar-right">
     
        <c:choose>
        <c:when test="${sessionScope.userid == null}">
        <li><a href="${path}/join.jsp"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
        <li><a href="${path}/login.jsp"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
        </c:when>
        <c:when test="${not empty sessionScope.admin}">
        <li><a href="${path}/cart_servlet/cart_list.do"><span class="glyphicon glyphicon-shopping-cart"></span> Cart</a></li>
        <li class="dropdown">
        <a class="dropdown-toggle" data-toggle="dropdown" href="#"><span class="glyphicon glyphicon-user"></span> Admin Page
        <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="${path}/product_servlet/admin_product.do">상품 관리</a></li>
          <li><a href="${path}/member_servlet/admin_list.do">회원 관리</a></li>
          <li><a href="${path}/memberDetail.jsp">내 정보 수정</a></li>
        </ul>
      </li>
        <li><a href="#" onclick='logoutConfirm("${path}")'><span class="glyphicon glyphicon-log-out"></span> Logout</a></li>
        </c:when>  
        <c:otherwise>
        <li><a href="${path}/cart_servlet/cart_list.do"><span class="glyphicon glyphicon-shopping-cart"></span> Cart</a></li>
        <li class="dropdown">
        <a class="dropdown-toggle" data-toggle="dropdown" href="#"><span class="glyphicon glyphicon-user"></span> My Page
        <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="${path}/memberDetail.jsp">회원정보 수정</a></li>
          <li><a href="${path}/reviewboard_servlet/mylist.do">나의 리뷰</a></li>
        </ul>
      </li>
        <li><a href="#" onclick='logoutConfirm("${path}")'><span class="glyphicon glyphicon-log-out"></span> Logout</a></li>
        </c:otherwise>
        </c:choose>
      </ul>
    </div>
  </div>
</nav>
<div style="margin-bottom:50px;"></div>





<div style="text-align: center;">

	<a href="${path}/upload/uploadForm">업로드 테스트</a> |
	<a href="${path}/upload/uploadAjax">업로드 테스트(ajax)</a> |

	<a href="${path}/reserv/list/${sessionScope.userid}">주문내역 확인하기 test</a>

</div>
<hr>
<c:set var="path" value="${pageContext.request.contextPath}" />
<div class="header1">
	<ul>
		<c:choose>
			<c:when test="${sessionScope.userid == null}">
				<!-- 로그인하지 않은 상태  -->
				<li><a href="${path}/member/login.do">LOGIN</a></li>
				<li><a href="${path}/member/join.do">BECOME A MEMBER</a></li>
			</c:when>
		<c:otherwise>
			<!-- 로그인한 상태 -->
     		<span style="font-weight: bold;">${sessionScope.name}</span>님이 로그인 중입니다.
			  <li><a href="${path}/member/logout.do">LOGOUT</a></li>
				<li><a href="${path}/member/mypage.do">MY PAGE</a></li>
			</c:otherwise>
		</c:choose>
				<li><a href="#">NOTICE</a></li>
				<li><a href="#">FAQ</a></li>
				<li><a href="${path}/board/qna/list.do">QNA</a></li>
				<li><a href="${path}/board/review/list.do">REVIEW</a></li>
				<li><a href="#">고객센터</a></li>
			 <!-- 관리자아이디일 경우 -->
			  <c:if test="${sessionScope.admin == 'y'}">
			   <li><a href="${path}/admin/home.do">관리자 페이지</a></li>
			  </c:if>
	</ul>
</div>
<div class="header2">
	<div class="menu2" style="float: left;">
		<a href="${path}">
		<img src="${path}/resources/images/rlogo.png" height="35"></a>
	</div>
	<div class="menu1">
		<ul class="menu">
			<li><a href="#">ABOUT</a></li>
			<li><a href="${path}/shop/exhibition/list/current">EXHIBITION</a>
				<ul class="depth_1">
					<li><a href="${path}/shop/exhibition/list/current">현재전시</a></li>
					<li><a href="${path}/shop/exhibition/list/past">지난전시</a></li>
				</ul></li>
			<li><a href="#">MENU 2</a></li>
		</ul>
	</div>
	<div class="menu3" style="float: right;">
		<a href="#"><img src="${path}/resources/images/calendar_icon.png" height="20"></a> 
		<button class="btn-open-popup"><img src="${path}/resources/images/searchicon.png" height="20"></button>
	</div>
	
	 <div class="modal">
      <div class="modal_body">
      <form action="${path}/shop/exhibition/list.do" id="searchform" name="searchform">
			 <div class="modal_body2">
       <input type="text" id="keyword" name="keyword" placeholder="검색어를 입력하세요.">
			 <button id="searchbtn"><img src="${path}/resources/images/searchicon.png" height="25"></button>
			</div>
      </form>
      </div>
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

