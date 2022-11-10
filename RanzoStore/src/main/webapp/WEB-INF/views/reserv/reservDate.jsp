<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>날짜별 예매</title>
<%@ include file="../include/header.jsp"%>
</head>
<script type="text/javascript">
function datesearch(){
	document.dateform.action = "${path}/shop/exhibition/searchDate.do";
	document.dateform.submit();
}

</script>

<body>
<%@ include file="../include/menu.jsp"%>

<!-- 날짜검색 -->
<form action="${path}/shop/exhibition/searchDate.do" id="dateform" name="dateform" method="post">
<input type="date" name="searchDate" id="searchDate" onchange="datesearch()" value="${map.searchDate}">
</form>


</body>
</html>