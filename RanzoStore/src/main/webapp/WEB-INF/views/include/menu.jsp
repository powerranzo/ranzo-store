<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<div style="text-align: center;">
 <a href="${path}">Home</a> |
 <div style="text-align: right;">
  <c:choose>
   <c:when test="${sessionScope.userid == null}">
     <!-- 로그인하지 않은 상태  -->
    <a href="${path}/member/join.do">회원가입</a> |
    <a href="${path}/member/login.do">로그인</a> |
    <a href="${path}/admin/login.do">관리자 로그인</a> |
   </c:when> 
   <c:otherwise>
     <!-- 로그인한 상태 -->
     ${sessionScope.name}님이 로그인 중입니다.
     <a href="${path}/member/view.do?userid=${sessionScope.userid}">회원정보</a> |
     <a href="${path}/member/logout.do">로그아웃</a> |
   </c:otherwise>
  </c:choose> 
 </div>
</div>
<hr>