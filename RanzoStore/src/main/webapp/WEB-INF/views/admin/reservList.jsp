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
		
		$("#btnDelReserv").click(function() {
			if (confirm('삭제 처리하시겠습니까?')) {
				document.form1.action = "${path}/admin/reserv_delete.do";
				document.form1.submit();
			}
		});
		$("#btnSearch").click(function() {
			document.form1.action = "${path}/admin/reserv_list.do";
			document.form1.submit();
		});
	});
	function optionSelect(num) {
		
		var selected = "";
		var option = ''.concat('#searchOption', num);
		if (num == 1) {
			selected = '${reserv.searchOp.searchOption1}'; 
		} else if (num == 2) {
			selected = '${reserv.searchOp.searchOption2}';
		} else {
			selected = '${reserv.searchOp.orderOption}'; 
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
	function reservList(param) { 
		document.form1.action = "${path}/admin/reserv_list.do?curPage=" + param;
		document.form1.submit();
	}
</script>
</head>
<body>
	<%@ include file="../include/menu.jsp"%>
	<div class="content">
		<section>
			<%@ include file="../include/adminDashboard.jspf"%>
			<div class=sectiondiv>
				<h3>예약현황 <button class="btn btn-sm" id="btnApproval">
							<span class="glyphicon glyphicon-check"></span>&nbsp;예약 처리
						</button></h3>
				<form name="form1" class="form-inline" method="post">
<!-- 					<div class="form-group"> -->
						<table class="adminTable1">
							<tr>
								<th>전체 예약</th>
								<th>진행 중인 전시</th>
								<th></th>
							</tr>
							<tr>
								<td>${ reserv.reserv_count_all}개</td>
								<td>${ reserv.reserv_count_ing}개</td>
								<td>
								<td>
							</tr>
						</table>
						<table class="adminTable2">
							<tr>
								<th>검색옵션
								<td><label for="searchOption1"></label> <select
									name="searchOption1" class="form-control" id="searchOption1">
										<option value="r.no">주문번호</option>
										<option value="r.userid">예매자ID</option>
										<option value="r.code">전시코드</option>
										<option value="e.title">전시명</option>
										<option value="all">전체</option>
								</select>
									<div class="input-group">
										<input type="text" class="form-control" name="searchKeyword"
											value="${ reserv.searchOp.searchKeyword}">
									</div></td>
							</tr>
							<tr>
						<th>분류</th>
						<td><label for="searchOption2"></label> <select
							name="searchOption2" class="form-control" id="searchOption2">
								<option value="pay_y">결제완료</option>
								<option value="pay_n">결제 전</option>
								<option value="all">전체</option>
						</select></td>
					</tr>
							<tr>
								<th>예약일</th>
								<td><input type="date" id="startDate" name="startDate"
									value="${ reserv.searchOp.startDate}">&nbsp;&nbsp;~&nbsp;&nbsp;
									<input type="date" id="endDate" name="endDate"
									value="${ reserv.searchOp.endDate}"></td>
							</tr>
							<tr>
								<th>정렬기준</th>
								<td><select name="orderOption" class="form-control"
									id="orderOption">
										<option value="r.res_date">최근순</option>
										<option value="r.no">과거순</option>
										<option value="r.quantity">예매수량순</option>
										<option value="e.title">전시명순</option>
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
								<th>예약번호</th>
								<th>예매자</th>
								<th style="width:30%;">전시명(전시코드)</th>
								<th>성인/청소년/어린이</th>
								<th>총 수량</th>
								<th>총가격</th>
								<th>구매일</th>
								<th>배송지역</th>
								<th>결제상태</th>
							</tr>
						</thead>
						<c:forEach var="reserv" varStatus="loop" items="${reserv.reserv_list}">
							<tbody>
								<tr>
									<td><input name="reserv_no" type="checkbox"
										value="${reserv.no}"></td>
									<td>${reserv.no}</td>
									<td><a href="#" onclick="memberView('${reserv.userid}')">${reserv.r_name}(${reserv.userid})</a></td>
									<td>${reserv.title}(${reserv.code})</td>
									<td>${reserv.adult}/${reserv.teen} / ${reserv.kids}</td>
									<td>${reserv.quantity}</td>
									<td>${reserv.sub_total}</td>
									<td><fmt:formatDate value="${reserv.res_date}" type="date"
											pattern="yyyy-MM-dd" /></td>
									<td>${reserv.addr1}</td>
									<td>${reserv.pay == 'y' ? '완료' : '미납'}</td>
								</tr>
							</tbody>
						</c:forEach>
					</table>
				
					<div class="row" align="center">
						<div class="col-sm-12">
							<ul class="pagination pagination">
								<c:if test="${reserv.pager.curPage > 1}">
									<li><a href="#" onclick="reservList('1')">첫 페이지</a></li>
								</c:if>
								<c:if test="${reserv.pager.curBlock > 1}">
									<li><a href="#" onclick="reservList('${reserv.pager.prevPage}')">이전</a></li>
								</c:if>
								<c:forEach var="page" begin="${reserv.pager.blockStartPage}"
									end="${reserv.pager.blockEndPage}">
									<c:choose>
										<c:when test="${page == reserv.pager.curPage}">
											<li><a href="#" style="text-decoration: underline;">${	page}</a></li>
										</c:when>
										<c:otherwise>
											<li><a href="#" onclick="reservList('${page}')">${page}</a></li>
										</c:otherwise>
									</c:choose>
								</c:forEach>
								<c:if test="${reserv.pager.curBlock < reserv.pager.totBlock}">
									<li><a href="#" onclick="reservList('${reserv.pager.nextPage}')">다음</a></li>
								</c:if>
								<c:if test="${reserv.pager.curPage < reserv.pager.totPage}">
									<li><a href="#" onclick="reservList('${reserv.pager.totPage}')">마지막
											페이지</a></li>
								</c:if>
							</ul>
						</div>
					</div>
					<button id="btnDelReserv" type="button" class="btn btn-default">삭제
					처리</button>
				</form>
			</div>
		</section>
	</div>
</body>
</html>