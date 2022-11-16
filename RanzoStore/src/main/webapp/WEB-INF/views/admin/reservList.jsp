<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 목록</title>
<%@ include file="../include/header.jsp"%>
<%@ include file="../include/adminHeader.jspf"%>
<script type="text/javascript">
	$(function() {
		optionSelect(1);
		optionSelect(2);
		optionSelect(3);
		optionSelect(4);

		$("#btnDelete").click(function() {
			alertify.confirm("삭제하시겠습니까?", function() {
				document.form1.action = "${path}/admin/reserv_delete.do";
				document.form1.submit();
			});
		});
		$("#btnSearch").click(function() {
			document.form1.action = "${path}/admin/reserv_list.do";
			document.form1.submit();
		});
		$("#btnApproval").click(function() {
			location.href = "https://classic-admin.iamport.kr/payments";
		});
	});
	function optionSelect(num) {
		var selected = "";
		var option = ''.concat('#searchOption', num);
		if (num == 1) selected = '${reserv.searchOp.searchOption1}';
		else if (num == 2) selected = '${reserv.searchOp.searchOption2}';
		else if (num == 3) selected = '${reserv.searchOp.searchOption3}';
		else {
			selected = '${reserv.searchOp.orderOption}';
			option = '#orderOption';
		}
		//console.log(option);
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
		<h2>예약현황
		<button class="btn btn-sm" id="btnApproval">
		<span class="glyphicon glyphicon-check"></span>&nbsp;예약 처리
		</button>
		</h2>
		<p>
		<span style="color: #fa5041;">예매자</span> 또는 
		<span style="color: #fa5041;">전시명을</span> 클릭하면 상세 정보를 확인할 수 있습니다.
		</p>

		<form name="form1" class="form-inline" method="post">
		<table class="adminTable1">
			<tr>
			<th>전체 예약</th>
			<th>오늘 예약</th>
			<th>결제 완료 예약</th>
			</tr>
			<tr>
			<td>${reserv.reserv_all}개</td>
			<td>${reserv.reserv_today}개</td>
			<td>${reserv.reserv_pay}개</td>
			</tr>
		</table>
	
		<table class="adminTable2">
			<tr>
			<th id="adminTB2_th">검색 옵션</th>
			<td colspan="2" id="adminTB2_td1">
			<select	name="searchOption1" id="searchOption1">
				<option value="r.no">예약번호</option>
				<option value="r.userid">예매자ID</option>
				<option value="r.code">전시코드</option>
				<option value="e.title">전시명</option>
				<option value="all">전체</option>
			</select>
			<div id="" class="input-group" style="width:65%;">
			<input type="text" name="searchKeyword"	value="${ reserv.searchOp.searchKeyword}">
			</div>
			</td>
			</tr>
			<tr>
			<th>결제 분류</th>
			<td colspan="2">
			<select name="searchOption2" id="searchOption2">
				<option value="pay_y">결제완료</option>
				<option value="pay_n">결제 전</option>
				<option value="all">전체</option>
			</select>
			</td>
			</tr>
			<tr>
			<tr>
			<th>삭제 분류</th>
			<td colspan="2">
			<select name="searchOption3" id="searchOption3" style="width:45%;">
				<option value="show_y">진행</option>
				<option value="show_n">삭제</option>
				<option value="all">전체</option>
			</select>
			</td>
			</tr>
			<tr>
			<th>예약일</th>
			<td colspan="2">
				<input type="date" id="startDate" name="startDate" value="${ reserv.searchOp.startDate}">
				<span style="float:left; padding:7px;">~</span>
				<input type="date" id="endDate" name="endDate" value="${ reserv.searchOp.endDate}">
			</td>
			</tr>
			<tr>
			<th>정렬 기준</th>
			<td colspan="2">
			<select name="orderOption" id="orderOption">
				<option value="r.reg_date">최근순</option>
				<option value="r.no">예약순</option>
				<option value="r.quantity">예매수량순</option>
				<option value="e.title">전시명순</option>
			</select>
			</td>
			<td><input type="button" value="검색" id="btnSearch" 	name="btnSearch"></td>
			</tr>
		</table>

		<table class="adminTable3">
			<thead>
				<tr>
				<th>#</th>
				<th>예약번호</th>
				<th style="width:10%;">예매자</th>
				<th style="width:20;">전시명(전시코드)</th>
				<th style="width:50px;">성인/청소년/어린이</th>
				<th style="width:6%;">총 수량</th>
				<th style="width:6%;">총가격</th>
				<th style="width:8%;">배송지역</th>
				<th style="width:10%;">관람일</th>
				<th style="width:10%;">구매일</th>
				<th style="width:5%;">결제</th>
				<th style="width:5%;">상태</th>
				</tr>
			</thead>
			<c:forEach var="reserv" varStatus="loop" items="${reserv.reserv_list}">
			<tbody>
				<tr>
				<td><input name="no" type="checkbox" value="${reserv.no}"></td>
				<td>${reserv.no}</td>
				<td><a href="#" onclick="memberView('${reserv.userid}')">${reserv.r_name}(${reserv.userid})</a></td>
				<td><a href="#" onclick="location.href='${path}/shop/exhibition/detail/${reserv.code}'">${reserv.title}(${reserv.code})</a></td>
				<td>${reserv.adult}/${reserv.teen}/${reserv.kids}</td>
				<td>${reserv.quantity}</td>
				<td>${reserv.sub_total}</td>
				<td>${reserv.addr1}</td>
				<td><fmt:formatDate value="${reserv.res_date}" type="date" pattern="yyyy-MM-dd" /></td>
				<td><fmt:formatDate value="${reserv.reg_date}" type="date" pattern="yyyy-MM-dd" /></td>
				<td>${reserv.pay == 'y' ? '완료' : '결제 전'}</td>
				<td><c:choose>
					<c:when test="${reserv.show =='y'}">
				 	<button class="btn btn-sm" type="button" id="" onclick="rsvDel('${reserv.no}')">
					<span class="glyphicon glyphicon-minus-sign"></span>&nbsp;삭제
					</button>
					</c:when>
					<c:otherwise>삭제</c:otherwise>
					</c:choose>
				</td>
				</tr>
			</tbody>
			</c:forEach>
		</table> 

		<div class="row" align="center" id="paging">
		<div class="col-sm-12">
		<ul class="pagination pagination">
			<c:if test="${reserv.pager.curBlock > 1}">
			<a href="#" onclick="reservList('1')">
			<i class="fa-solid fa-less-than"></i><i class="fa-solid fa-less-than"></i>
			</a>&nbsp;&nbsp;
			</c:if>
			<c:if test="${reserv.pager.curBlock > 1}">
			<a href="#" onclick="reservList('${reserv.pager.prevPage}')"> 
			<i class="fa-solid fa-less-than"></i></a>
			</c:if>
			
			<c:forEach var="page" begin="${reserv.pager.blockStartPage}" end="${reserv.pager.blockEndPage}">
				<c:choose>
				<c:when test="${page == reserv.pager.curPage}">
				<!-- 현재 페이지인 경우 하이퍼링크 제거 -->
				<span id="numstyle">${page}</span>&nbsp;
				<input type="hidden" name="curPage" value="${page}">
				</c:when>
				<c:otherwise>
				<a href="#" onclick="reservList('${page}')">
				<span style="color: gray;">${page}</span></a>&nbsp;
				</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${reserv.pager.curBlock < reserv.pager.totBlock}">
			<a href="#" onclick="reservList('${reserv.pager.nextPage}')">
			<i class="fa-solid fa-greater-than"></i></a>&nbsp;
			</c:if>
			<c:if test="${reserv.pager.curPage < reserv.pager.totPage}">&nbsp;
			<a href="#" onclick="reservList('${reserv.pager.totPage}')">
			<i class="fa-solid fa-greater-than"></i>
			<i class="fa-solid fa-greater-than"></i></a>
			</c:if>
		</ul>
		</div>
		</div>
	</form>
	
	<input type="submit" value="삭제 처리" id="btnDelete" name="btnDelete">
</div>
</div>
<%@ include file="../include/footer.jsp"%>
</body>
</html>