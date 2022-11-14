<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Popup</title>
<%@ include file="../include/header.jsp"%>
<%@ include file="../include/adminHeader.jspf"%>
<script type="text/javascript">
	$(function() {
		optionSelect(1);
		optionSelect(2);
		optionSelect(3);
		
		$("#btnDel").click(function() {
			if(confirm('종료하시겠습니까?')){
				document.form1.action = "${path}/admin/popup_delete.do";
				document.form1.submit();
			}
		});
		$("#btnSearch").click(function() {
			document.form1.action = "${path}/admin/popup_list.do";
			document.form1.submit();
		});
	});
	function optionSelect(num) {
		
		var selected = "";
		var option = ''.concat('#searchOption', num);
		if (num == 1) {
			selected = '${pop.searchOp.searchOption1}'; 
		} else if (num == 2) {
			selected = '${pop.searchOp.searchOption2}';
		} else {
			selected = '${pop.searchOp.orderOption}'; 
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
			<%@ include file="../include/adminDashboard.jspf"%>
			<div class=sectiondiv>
				<h3>PopUp</h3>
				<form name="form1" class="form-inline" method="post">
<!-- 					<div class="form-group"> -->
						<table class="adminTable2">
							<tr>
								<th>검색옵션
								<td><label for="searchOption1"></label> <select
									name="searchOption1" class="form-control" id="searchOption1">
										<option value="no">번호</option>
										<option value="title">제목</option>
										<option value="filename">이미지명</option>
										<option value="all">전체</option>
								</select>
									<div class="input-group">
										<input type="text" class="form-control" name="searchKeyword"
											value="${ pop.searchOp.searchKeyword}">
									</div></td>
							</tr>
							<tr>
						<th>분류</th>
						<td><label for="searchOption2"></label> <select
							name="searchOption2" class="form-control" id="searchOption2">
								<option value="show_y">노출</option>
								<option value="show_n">종료</option>
								<option value="all">전체</option>
						</select></td>
					</tr>
							<tr>
								<th>노출기간</th>
								<td><input type="date" id="startDate" name="startDate"
									value="${ pop.searchOp.startDate}">&nbsp;&nbsp;~&nbsp;&nbsp;
									<input type="date" id="endDate" name="endDate"
									value="${ pop.searchOp.endDate}"></td>
							</tr>
							<tr>
								<th>정렬기준</th>
								<td><select name="orderOption" class="form-control"
									id="orderOption">
										<option value="reg_date">최근순</option>
										<option value="bno">번호순</option>
										<option value="title">제목순</option>
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
								<th>번호</th>
								<th>제목</th>
								<th>이미지</th>
								<th>시작일</th>
								<th>만료일</th>
								<th>상태</th>
								<th>처리</th>
							</tr>
						</thead>
						<c:forEach var="pop" varStatus="loop" items="${pop.popup_list}">
							<tbody>
								<tr>
									<td><input name="no" type="checkbox"
										value="${pop.no}"></td>
									<td>${pop.no}</td>
									<td><a href="#" onclick="popupView('${pop.no}')">${pop.title}</a></td>
									<td><img src="${pop.img_src}" width="50"></td>
									<td><fmt:formatDate value="${pop.start_date}" type="date" pattern="yyyy-MM-dd HH:mm:ss" /></td>
									<td><fmt:formatDate value="${pop.end_date}" type="date" pattern="yyyy-MM-dd HH:mm:ss" /></td>
									<td>${pop.show =='y'? '진행':'종료'}</td>
									<td>
									<c:choose>
									<c:when test="${pop.show =='y'}">
									<button class="btn btn-sm" type="button" id="btnUpdate" onclick="popupView('${pop.no}')">
									<span class="glyphicon glyphicon-check"></span>&nbsp;수정</button>
									<button class="btn btn-sm" type="button" id="btnDel2" onclick="popupDel('${pop.no}')">
									<span class="glyphicon glyphicon-minus-sign"></span>&nbsp;종료</button>
									</c:when>
									<c:otherwise>
									<button class="btn btn-sm" type="button" id="btnShow" onclick="popupShow('${pop.no}')">
									<span class="glyphicon glyphicon-minus-sign"></span>&nbsp;재개</button>
									</c:otherwise>
									</c:choose>
									</td>
									</tr>
							</tbody>
						</c:forEach>
					</table>
				
					<div class="row" align="center">
						<div class="col-sm-12">
							<ul class="pagination pagination">
								<c:if test="${pop.pager.curPage > 1}">
									<li><a href="#" onclick="popupList('1')">첫 페이지</a></li>
								</c:if>
								<c:if test="${pop.pager.curBlock > 1}">
									<li><a href="#" onclick="popupList('${pop.pager.prevPage}')">이전</a></li>
								</c:if>
								<c:forEach var="page" begin="${pop.pager.blockStartPage}"
									end="${pop.pager.blockEndPage}">
									<c:choose>
										<c:when test="${page == pop.pager.curPage}">
											<li><a href="#" style="text-decoration: underline;">${page}</a></li>
										</c:when>
										<c:otherwise>
											<li><a href="#" onclick="popupList('${page}')">${page}</a></li>
										</c:otherwise>
									</c:choose>
								</c:forEach>
								<c:if test="${pop.pager.curBlock < pop.pager.totBlock}">
									<li><a href="#" onclick="popupList('${pop.pager.nextPage}')">다음</a></li>
								</c:if>
								<c:if test="${pop.pager.curPage < pop.pager.totPage}">
									<li><a href="#" onclick="popupList('${pop.pager.totPage}')">마지막
											페이지</a></li>
								</c:if>
							</ul>
						</div>
					</div>
					<button id="btnDel" type="button" class="btn btn-default">종료 처리</button>
					<button id="btnWrite" type="button" 
					onclick="location.href='${path}/admin/popup_write.do'" class="btn btn-default">신규 등록</button>
				</form>
			</div>
	</div>
	<%@ include file="../include/footer.jsp"%>
</body>
</html>