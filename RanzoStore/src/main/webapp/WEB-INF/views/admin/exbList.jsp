<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전시 목록</title>
<%@ include file="../include/header.jsp"%>
<%@ include file="../include/adminHeader.jspf"%>
<script type="text/javascript">
	$(function() {
		optionSelect(1);
		optionSelect(2);
		optionSelect(3);

		$("#btnWrite").click(function() {
			location.href = '${path}/admin/exb_write.do';
		});
		$("#btnDelete").click(function() {
			alertify.confirm("종료 처리하시겠습니까?", function() {
				document.form1.action = "${path}/admin/exbs_delete.do";
				document.form1.submit();
			});
		});
		$("#btnSearch").click(function() {
			document.form1.action = "${path}/admin/exb_list.do";
			document.form1.submit();
		});
	});
	function optionSelect(num) {
		var selected = "";
		var option = ''.concat('#searchOption', num);
		if (num == 1)
			selected = '${exb.searchOp.searchOption1}';
		else if (num == 2)
			selected = '${exb.searchOp.searchOption2}';
		else {
			selected = '${exb.searchOp.orderOption}';
			option = '#orderOption';
		}
		console.log(option);
		var length = $(option).children().length;
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
				<h2>전시현황</h2>
				<p><span style="color: #fa5041;">전시명</span>를 클릭하면 전시 정보를 수정할 수 있습니다.</p>
				<form name="form1" class="form-inline" method="post">
					<table class="adminTable1">
						<tr>
							<th>전체 전시</th>
							<th>진행 중인 전시</th>
						</tr>
						<tr>
							<td>${exb.exb_count_all}개</td>
							<td>${exb.exb_count_ing}개</td>
						</tr>
					</table>
					<table class="adminTable2">
						<tr>
							<th id="adminTB2_th">검색옵션</th>
							<td colspan="2" id="adminTB2_td1">
								<select name="searchOption1" id="searchOption1">
										<option value="code">전시코드</option>
										<option value="title">전시명</option>
										<option value="location">전시지역</option>
										<option value="gallery">전시관</option>
										<option value="all">코드/이름/지역/전시관</option>
								</select>
								<div id="" class="input-group" style="width:65%;">
									<input type="text" name="searchKeyword"
										value="${exb.searchOp.searchKeyword}">
								</div>
							</td>
						</tr>
						<tr>
							<th>전시 기간</th>
							<td colspan="2">
								<input type="date" id="startDate" name="startDate" 
								value="${exb.searchOp.startDate}">
								<span style="float:left; padding:7px;">~</span>
								<input type="date" id="endDate" name="endDate"
								value="${exb.searchOp.endDate}"></td>
						</tr>
						<tr>
							<th>분류</th>
							<td colspan="2">
							<select name="searchOption2" id="searchOption2">
									<option value="ing">진행</option>
									<option value="end">종료</option>
									<option value="all">전체</option>
							</select>
							</td>
						</tr>
						<tr>
							<th>정렬기준</th>
							<td id="adminTB2_td1">
							<select name="orderOption" id="orderOption">
									<option value="code">코드순</option>
									<option value="title">전시명순</option>
									<option value="hit">조회수</option>
									<option value="sales">판매량순</option>
									<option value="start_date">시작일기준</option>
									<option value="end_date">마감일기준</option>
							</select>
							</td>
							<td><input type="button" value="검색" id="btnSearch" 	name="btnSearch"></td>
						</tr>
					</table>

					<table class="adminTable3">
						<thead>
							<tr>
								<th>#</th>
								<th>No</th>
								<th>전시코드</th>
								<th style="width:5%;">포스터</th>
								<th style="width:30%;">전시명</th>
								<th style="width:5%;">지역</th>
								<th style="width:10%;">전시관</th>
								<th style="width:10%;">전시기간</th>
								<th style="width:5%;">조회수</th>
								<th style="width:5%;">판매량</th>
								<th style="width:10%;">상태</th>
							</tr>
						</thead>
						<c:forEach var="dto" varStatus="loop" items="${exb.list}">
							<tbody>
								<tr>
									<td><input name="code" type="checkbox" value="${dto.code}"></td>
									<td>${dto.rn}</td>
									<td>${dto.code}</td>
									<td><img src="${dto.thumnail}" width="50"></td>
									<td><a href="#" onclick="exbUpdate('${dto.code}')">${dto.title}</a></td>
									<td>${dto.location}</td>
									<td>${dto.gallery}</td>
									<td><fmt:formatDate value="${dto.start_date}" type="date" pattern="yyyy-MM-dd" />  <fmt:formatDate
											value="${dto.end_date}" type="date" pattern="yyyy-MM-dd" />
									</td>
									<td>${dto.hit}</td>
									<td>${dto.sales}</td>
									<td>${dto.show == 'y' ? '진행': '종료'}</td>
								</tr>
							</tbody>
						</c:forEach>
					</table>
					
				<div class="row" align="center" id="paging">
				<div class="col-sm-12">
					<ul class="pagination pagination">
						<c:if test="${exb.pager.curBlock > 1}">
							<a href="#" onclick="exbList('1')">
							<i class="fa-solid fa-less-than"></i><i class="fa-solid fa-less-than"></i>
							</a>&nbsp;&nbsp;
						</c:if>
						<c:if test="${exb.pager.curBlock > 1}">
							<a href="#" onclick="exbList('${exb.pager.prevPage}')"> <i
								class="fa-solid fa-less-than"></i></a>
						</c:if>
						<c:forEach var="page" begin="${exb.pager.blockStartPage}"
							end="${exb.pager.blockEndPage}">
							<c:choose>
								<c:when test="${page == exb.pager.curPage}">
									<!-- 현재 페이지인 경우 하이퍼링크 제거 -->
									<span id="numstyle">${page}</span>&nbsp;
								</c:when>
								<c:otherwise>
									<a href="#" onclick="exbList('${page}')"><span
										style="color: gray;">${page}</span></a>&nbsp;
								</c:otherwise>
							</c:choose>
						</c:forEach>
						<c:if test="${exb.pager.curBlock < exb.pager.totBlock}">
							<a href="#" onclick="exbList('${exb.pager.nextPage}')">
							<i class="fa-solid fa-greater-than"></i></a>&nbsp;
						</c:if>
						<c:if test="${exb.pager.curPage < exb.pager.totPage}">&nbsp;
						<a href="#" onclick="exbList('${exb.pager.totPage}')">
						<i class="fa-solid fa-greater-than"></i><i class="fa-solid fa-greater-than"></i>
						</a>
						</c:if>
					</ul>
				</div>
			</div>
				</form>
				<input type="submit" value="종료 처리" id="btnDelete" name="btnDelete">
				<input type="submit" value="신규 등록" id="btnWrite" name="btnWrite">
			</div>
	</div>
	<%@ include file="../include/footer.jsp"%>
</body>
</html>