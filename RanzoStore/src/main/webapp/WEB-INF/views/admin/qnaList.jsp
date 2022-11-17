<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QnA</title>
<%@ include file="../include/header.jsp"%>
<%@ include file="../include/adminHeader.jspf"%>
<style type="text/css">
</style>
<script type="text/javascript">
	$(function() {
		optionSelect(1);
		optionSelect(2);
		optionSelect(3);
		
		$("#btnDelete").click(function() {
			alertify.confirm("삭제하시겠습니까?", function() {
				document.form1.action = "${path}/admin/qna_delete.do";
				document.form1.submit();
			});
		});
		$("#btnSearch").click(function() {
			document.form1.action = "${path}/admin/qna_list.do";
			document.form1.submit();
		});
	});
	function optionSelect(num) {
		var selected = "";
		var option = ''.concat('#searchOption', num);
		if (num == 1) selected = '${qna.searchOp.searchOption1}'; 
		else if (num == 2) selected = '${qna.searchOp.searchOption2}';
	 	else {
			selected = '${qna.searchOp.orderOption}'; 
			option = '#orderOption';
		}
		// console.log(option); console.log(selected);
		var length = $(option).children().length;
		//console.log(length);
		for (i = 1; i <= length; i++) {
			var val = $(option + ' option:eq(' + i + ')').val();
			if (selected == val) 
				$(option + ' option:eq(' + i + ')').prop("selected", "selected");
		}
	}
</script>
</head>
<body>
	<%@ include file="../include/menu.jsp"%>
	<div class="content">
	<%@ include file="../include/adminDashboard.jspf"%>
	
		<div class=sectiondiv>
		<h2>QnA</h2>
		<p><span style="color: #fa5041;">제목</span>을 클릭하면 게시글을 볼 수 있습니다.</p>
		<form name="form1" class="form-inline" method="post">
		<table class="adminTable1">
			<tr>
			<th>신규 문의글</th>
			<th>오늘 문의글</th>
			</tr>
			<tr>
			<td>${qna.qna_new}개</td>
			<td>${qna.qna_today}개</td>
			</tr>
		</table>
		
		<table class="adminTable2">
			<tr>
			<th id="adminTB2_th">검색옵션</th>
			<td colspan="2" id="adminTB2_td1">
			<select name="searchOption1" id="searchOption1" >
				<option value="bno">글번호</option>
				<option value="writer">작성자ID</option>
				<option value="title">제목</option>
				<option value="content">내용</option>
				<option value="all">전체</option>
			</select>
			<div id="" style="width: 65%;" class="input-group">
			<input type="text" name="searchKeyword" value="${ qna.searchOp.searchKeyword}">
			</div>
			</td>
			</tr>
			<tr>
			<th>분류</th>
			<td colspan="2">
			<select	name="searchOption2" id="searchOption2">
				<option value="reply_state_y">답변완료</option>
				<option value="reply_state_n">답변 전</option>
				<option value="all">전체</option>
			</select>
			</td>
			</tr>
			<tr>
			<th>예약일</th>
			<td colspan="2">
				<input type="date" id="startDate" name="startDate" value="${qna.searchOp.startDate}">
				<span style="float:left; padding:7px;">~</span>
				<input type="date" id="endDate" name="endDate" value="${qna.searchOp.endDate}">
			</td>
			</tr>
			<tr>
			<th>정렬기준</th>
			<td colspan="2" id="adminTB2_search">
			<select name="orderOption" id="orderOption">
				<option value="reg_date">최근순</option>
				<option value="bno">글번호순</option>
				<option value="viewcnt">조회수순</option>
			</select>
			</td>
			<td><input type="button" value="검색" id="btnSearch"	name="btnSearch"></td>
			</tr>
		</table>

		<table class="adminTable3">
		<thead>
			<tr>
			<th>#</th>
			<th>글번호</th>
			<th style="width: 30%;">제목</th>
			<th>작성자</th>
			<th>작성일자</th>
			<th>조회수</th>
			<th>답변상태</th>
			</tr>
		</thead>
		<c:forEach var="qna" varStatus="loop" items="${qna.qna_list}">
		<tbody>
			<tr>
			<td><input name="bno" type="checkbox" value="${qna.bno}"></td>
			<td>${qna.bno}</td>
			<td><a href="#" onclick="location.href='${path}/board/qna/view.do?bno=${qna.bno}'">${qna.title}</a></td>
			<td><a href="#" onclick="memberView('${qna.writer}')">${qna.name}(${qna.writer})</a></td>
			<td><fmt:formatDate value="${qna.reg_date}" type="date" pattern="yyyy-MM-dd" /></td>
			<td>${qna.viewcnt}</td>
			<td><c:choose>
				<c:when test="${qna.reply_state == 'y'}">완료</c:when>
				<c:otherwise>
				<button class="btn btn-sm" type="button" id="btnReply"
				onclick='location.href="${path}/board/qna/reply_write.do?bno=${qna.bno}"'>
				<span class="glyphicon glyphicon-pencil"></span>&nbsp;답변하기</button>
				</c:otherwise>
				</c:choose>
			</td>
			</tr>
		</tbody>
		</c:forEach>
		</table>

		<div class="row" align="center" id="paging">
		<div class="col-sm-12">
		<ul class="pagination pagination">
			<c:if test="${qna.pager.curBlock > 1}">
			<a href="#" onclick="qnaList('1')">
			<i class="fa-solid fa-less-than"></i><i class="fa-solid fa-less-than"></i>
			</a>&nbsp;&nbsp;
			</c:if>
			<c:if test="${qna.pager.curBlock > 1}">
			<a href="#" onclick="qnaList('${qna.pager.prevPage}')"> 
			<i class="fa-solid fa-less-than"></i></a>
			</c:if>
	
			<c:forEach var="page" begin="${qna.pager.blockStartPage}" end="${qna.pager.blockEndPage}">
	 			<c:choose>
				<c:when test="${page == qna.pager.curPage}">
				<!-- 현재 페이지인 경우 하이퍼링크 제거 -->
				<span id="numstyle">${page}</span>&nbsp;
				<input type="hidden" name="curPage" value="${page}">
				</c:when>
				<c:otherwise>
				<a href="#" onclick="qnaList('${page}')">
				<span style="color: gray;">${page}</span></a>&nbsp;
				</c:otherwise>
				</c:choose>
			</c:forEach>
	
			<c:if test="${qna.pager.curBlock < qna.pager.totBlock}">
			<a href="#" onclick="qnaList('${qna.pager.nextPage}')">
			<i class="fa-solid fa-greater-than"></i></a>&nbsp;
			</c:if>
			<c:if test="${qna.pager.curPage < qna.pager.totPage}">&nbsp;
			<a href="#" onclick="qnaList('${qna.pager.totPage}')">
			<i class="fa-solid fa-greater-than"></i>
			<i class="fa-solid fa-greater-than"></i></a>
			</c:if>
		</ul>
		</div>
		</div>
		</form>

		<input type="submit" id="btnDelete" value="삭제 처리">
</div>
</div>
<%@ include file="../include/footer.jsp"%>
</body>
</html>