<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QnA</title>
<%@ include file="../include/header.jsp"%>
<%@ include file="../include/adminHeader.jspf"%>
<script type="text/javascript">
	$(function() {
		optionSelect(1);
		optionSelect(2);
		optionSelect(3);
		
		$("#btnDelete").click(function() {
			if(confirm('삭제하시겠습니까?')){
				document.form1.action = "${path}/admin/qna_delete.do";
				document.form1.submit();
			}
		});
		$("#btnSearch").click(function() {
			document.form1.action = "${path}/admin/qna_list.do";
			document.form1.submit();
		});
	});
	function optionSelect(num) {
		
		var selected = "";
		var option = ''.concat('#searchOption', num);
		if (num == 1) {
			selected = '${qna.searchOp.searchOption1}'; 
		} else if (num == 2) {
			selected = '${qna.searchOp.searchOption2}';
		} else {
			selected = '${qna.searchOp.orderOption}'; 
			option = '#orderOption';
		}
		console.log(option);
		console.log(selected);
		var length = $(option).children().length;
		console.log(length);
		for (i = 1; i <= length; i++) {
			var val = $(option + ' option:eq(' + i + ')').val();
			if (selected == val)
				$(option + ' option:eq(' + i + ')')
						.prop("selected", "selected");
		}
	}
</script>
</head>
<body>
	<%@ include file="../include/menu.jsp"%>
	<div class="content">
		<section>
			<%@ include file="../include/adminDashboard.jspf"%>
			<div class=sectiondiv>
				<h3>QnA</h3>
				<form name="form1" class="form-inline" method="post">
<!-- 					<div class="form-group"> -->
						<table class="adminTable1">
							<tr>
								<th>신규 문의글</th>
								<th>삭제된 글</th>
							</tr>
							<tr>
								<td>${qna.qna_newcount}개</td>
								<td>${qna.qna_delcount}개</td>
								<td>
								<td>
							</tr>
						</table>
						<table class="adminTable2">
							<tr>
								<th>검색옵션
								<td><label for="searchOption1"></label> <select
									name="searchOption1" class="form-control" id="searchOption1">
										<option value="bno">글번호</option>
										<option value="writer">작성자ID</option>
										<option value="title">제목</option>
										<option value="content">내용</option>
										<option value="all">전체</option>
								</select>
									<div class="input-group">
										<input type="text" class="form-control" name="searchKeyword"
											value="${ qna.searchOp.searchKeyword}">
									</div></td>
							</tr>
							<tr>
						<th>분류</th>
						<td><label for="searchOption2"></label> <select
							name="searchOption2" class="form-control" id="searchOption2">
								<option value="reply_state_y">답변완료</option>
								<option value="reply_state_n">답변 전</option>
								<option value="all">전체</option>
						</select></td>
					</tr>
							<tr>
								<th>예약일</th>
								<td><input type="date" id="startDate" name="startDate"
									value="${ qna.searchOp.startDate}">&nbsp;&nbsp;~&nbsp;&nbsp;
									<input type="date" id="endDate" name="endDate"
									value="${ qna.searchOp.endDate}"></td>
							</tr>
							<tr>
								<th>정렬기준</th>
								<td><select name="orderOption" class="form-control"
									id="orderOption">
										<option value="reg_date">최근순</option>
										<option value="bno">글번호순</option>
										<option value="viewcnt">조회수순</option>
								</select>
								</td>
							</tr>
						</table>
						<br>
						<div class="sectiondiv" align="center">
						<button class="btn btn-default" type="button" id="btnSearch">
							검색 <i class="glyphicon glyphicon-search"></i>
						</button>
					</div>
<!-- 					</div> -->

					<table class="ordertable">
						<thead>
							<tr>
								<th>#</th>
								<th>글번호</th>
								<th style="width:30%;">제목</th>
								<th>작성자</th>
								<th>작성일자</th>
								<th>조회수</th>
								<th>답변상태</th>
							</tr>
						</thead>
						<c:forEach var="qna" varStatus="loop" items="${qna.qna_list}">
							<tbody>
								<tr>
									<td><input name="qna_bno" type="checkbox"
										value="${qna.bno}"></td>
									<td>${qna.bno}</td>
									<td>${qna.title}</td>
									<td><a href="#" onclick="memberView('${qna.writer}')">${qna.name}(${qna.writer})</a></td>
									<td><fmt:formatDate value="${qna.reg_date}" type="date" pattern="yyyy-MM-dd" /></td>
									<td>${qna.viewcnt}</td>
									<td>
									<c:choose>
									<c:when test="${qna.reply_state == 'y'}">완료</c:when>
									<c:otherwise>
									<button class="btn btn-sm" type="button" id="btnReply" onclick='location.href="${path}/board/qna/reply_write.do?bno=${qna.bno}"'>
									<span class="glyphicon glyphicon-check"></span>&nbsp;답글</button>
									</c:otherwise>
									</c:choose>
								</tr>
							</tbody>
						</c:forEach>
					</table>
				
					<div class="row" align="center">
						<div class="col-sm-12">
							<ul class="pagination pagination">
								<c:if test="${qna.pager.curPage > 1}">
									<li><a href="#" onclick="qnaList('1')">첫 페이지</a></li>
								</c:if>
								<c:if test="${qna.pager.curBlock > 1}">
									<li><a href="#" onclick="qnaList('${qna.pager.prevPage}')">이전</a></li>
								</c:if>
								<c:forEach var="page" begin="${qna.pager.blockStartPage}"
									end="${qna.pager.blockEndPage}">
									<c:choose>
										<c:when test="${page == qna.pager.curPage}">
											<li><a href="#" style="text-decoration: underline;">${page}</a></li>
										</c:when>
										<c:otherwise>
											<li><a href="#" onclick="qnaList('${page}')">${page}</a></li>
										</c:otherwise>
									</c:choose>
								</c:forEach>
								<c:if test="${qna.pager.curBlock < qna.pager.totBlock}">
									<li><a href="#" onclick="qnaList('${qna.pager.nextPage}')">다음</a></li>
								</c:if>
								<c:if test="${qna.pager.curPage < qna.pager.totPage}">
									<li><a href="#" onclick="qnaList('${qna.pager.totPage}')">마지막
											페이지</a></li>
								</c:if>
							</ul>
						</div>
					</div>
					<button id="btnDelete" type="button" class="btn btn-default">삭제
					처리</button>
				</form>
			</div>
		</section>
	</div>
<%@ include file="../include/footer.jsp"%>
</body>
</html>