<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../include/admin_head.jspf"%>
<title>회원 정보</title>
<script type="text/javascript">
$(function(){
	$("#btnDelete").click(function(){
		if(confirm('게시글을 삭제하시겠습니까?')){
		document.form1.action="${path}/admin/qna_delete.do";
		document.form1.submit();
		}
	});
});
</script>
</head>
<body>
	<div class="container">
		<h3>회원관리</h3>
		<form name="form1" class="form-inline" method="post">
			<div class="form-group">
				<table class="table table-bordered">
					<tr>
						<th>아이디</th> 
						<td>${dto.userid}</td>
					</tr>
					<tr>
						<th>이름</th>
						<td>${dto.name}</td>
					</tr>
					<tr>
						<th>이메일</th>
						<td>${dto.email}</td>
					</tr>
					<tr>
						<th>전화번호</th>
						<td>${dto.hp}</td>
					</tr>
					<tr>
						<th>성별</th>
						<td>${dto.gender}</td>
					</tr>
					<tr>
						<th>주소</th>
						<td>${dto.addr1}  ${dto.addr2}</td>
					</tr>
					<tr>
						<th>가입일</th>
						<td><fmt:formatDate value="${dto.join_date}" type="date"
								pattern="yyyy-MM-dd" /></td>
					</tr>
					<tr>
						<th>탈퇴여부</th>
						<td>${dto.quit=="y" ? "탈퇴":"회원"}</td>
					</tr>
					<c:if test="${dto.quit eq 'y'}">
					<tr>
					<th>탈퇴일</th>
					<td>${dto.quit_date}</td>
					</tr>
					</c:if>
				</table>
				</div>
				<h4>${dto.name}님의 최근 예약
<!-- 				<button type="button" class="btn btn-default" data-toggle="collapse" data-target="#demo">최근 예약</button></h4> -->
<!--   				<div id="demo" class="collapse"> -->
<!-- 				<table class="table table-hover"> -->
<!-- 				<thead> -->
<!-- 					<tr> -->
<!-- 						<th>#</th> -->
<!-- 						<th>글번호</th> -->
<!-- 						<th>제목</th> -->
<!-- 						<th>작성자</th> -->
<!-- 						<th>조회수</th> -->
<!-- 						<th>작성일</th> -->
<!-- 						<th>답변여부</th> -->
<!-- 					</tr> -->
<!-- 				</thead> -->
<%-- 				<c:forEach var="qna" varStatus="loop" items="${qna_list}"> --%>
<!-- 					<tbody> -->
<!-- 						<tr> -->
<!-- 							<td><input name="qna_bno" type="checkbox" -->
<%-- 								value="${qna.bno}"></td> --%>
<%-- 							<td>${qna.bno}</td> --%>
<%-- 							<td><a href="#" onclick="qnaView('${qna.bno}')">${qna.title} ${qna.show == 'n' ? ' [삭제된 게시글] ' : ''}</a></td> --%>
<%-- 							<td>${qna.name} (${qna.writer}) </td> --%>
<%-- 							<td>${qna.viewcnt}</td> --%>
<%-- 							<td><fmt:formatDate value="${qna.reg_date}" type="date" --%>
<%-- 									pattern="yyyy-MM-dd" /></td> --%>
<%-- 							<td>${qna.reply_state}</td> --%>
<!-- 						</tr> -->
<!-- 					</tbody> -->
<%-- 				</c:forEach> --%>
<!-- 			</table> -->
<!-- 				</div> -->
				
				<h4>${dto.name}님의 최근 문의글</h4>
<!-- 				<button type="button" class="btn btn-default" data-toggle="collapse" data-target="#qna">최근 문의글</button></h4> -->
<!--   				<div id="qna" class="collapse"> -->
				 <table class="table table-hover">
				<thead>
					<tr>
						<th>#</th>
						<th>글번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>조회수</th>
						<th>작성일</th>
						<th>답변여부</th>
					</tr>
				</thead>
				<c:forEach var="qna" varStatus="loop" items="${qna_list}">
					<tbody>
						<tr>
							<td><input name="qna_bno" type="checkbox"
								value="${qna.bno}"></td>
							<td>${qna.bno}</td>
							<td><a href="#" onclick="qnaView('${qna.bno}')">${qna.title} ${qna.show == 'n' ? ' [삭제된 게시글] ' : ''}</a></td>
							<td>${qna.name} (${qna.writer}) </td>
							<td>${qna.viewcnt}</td>
							<td><fmt:formatDate value="${qna.reg_date}" type="date"
									pattern="yyyy-MM-dd" /></td>
							<td>${qna.reply_state}</td>
						</tr>
					</tbody>
				</c:forEach>
			</table>
			<input type="hidden" name="userid" value="${dto.userid}">
			<button id="btnDelete" type="button" class="btn btn-default">게시글  삭제</button>	
<!-- 			</div> -->
				
				
			
		</form>
	</div>

</body>
</html>