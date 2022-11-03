<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<script type="text/javascript">

</script>

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
			<li><a href="${path}/shop/exhibition/list">EXHIBITION</a>
				<ul class="depth_1">
					<li><a href="${path}/shop/exhibition/list">현재전시</a></li>
					<li><a href="#">지난전시</a></li>
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

