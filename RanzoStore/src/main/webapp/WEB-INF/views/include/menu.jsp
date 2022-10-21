<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<div style="text-align: center;"> 
	
 <a href="${path}/upload/uploadForm">업로드 테스트</a> | 
 <a href="${path}/upload/uploadAjax">업로드 테스트(ajax)</a> | 
 <a href="${path}/board/qna/list.do">QnA</a> | 
 <a href="${path}/board/review/list.do">Review</a> | 

</div>
<hr>
