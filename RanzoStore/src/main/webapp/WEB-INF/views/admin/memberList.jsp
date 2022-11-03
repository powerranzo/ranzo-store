<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/admin_head.jspf"%>
<title>회원 목록</title>
<script type="text/javascript">
	$(function() {

		optionSelect(1);
		optionSelect(2);
		optionSelect(3);

		$("#btnDelete").click(function() {
			if (confirm('탈퇴처리하시겠습니까?')) {
				document.form1.action = "${path}/admin/member_delete.do";
				document.form1.submit();
			}
		});
		$("#btnSearch").click(function() {
			document.form1.action = "${path}/admin/member_list.do";
			document.form1.submit();
		});
	});
	function optionSelect(num) {
		var selected = "";
		var option = ''.concat('#searchOption', num);
		if (num == 1) {
			selected = '${searchOp.searchOption1}';
		} else if (num == 2) {
			selected = '${searchOp.searchOption2}';
		} else {
			selected = '${searchOp.orderOption}';
			option = '#orderOption';
		}
		console.log(option);
		var length = $(option).children().length;
		console.log(length);
		for (i = 1; i <= length; i++) {
			var val = $(option + ' option:eq(' + i + ')').val();
			if (selected == val)
				$(option + ' option:eq(' + i + ')')
						.prop("selected", "selected");
		}
	}
	function memberList(param) {
		document.form1.action = "${path}/admin/member_list.do?curPage=" + param;
		document.form1.submit();
	}
	function memberView(param) {
		let frm = document.createElement('form');
		frm.setAttribute('method', 'post');
		frm.setAttribute('action', '${path}/admin/member_view.do');
		let ipt = document.createElement('input');
		ipt.setAttribute('type', 'hidden');
		ipt.setAttribute('name', 'userid');
		ipt.setAttribute('value', param);

		frm.appendChild(ipt);
		document.body.appendChild(frm);
		frm.submit();
	}
</script>
</head>
<body>
<%@ include file="../include/menu.jsp"%>
<div class="content">
<section>
<%@ include file="../include/adminDashboard.jspf"%>
			<div class="sectiondiv">
		<h3>회원관리</h3>
		<form name="form1" class="form-inline" method="post">
				<table class="adminTable1">
					<tr>
						<th>전체회원수</th>
						<th>오늘 가입한 회원수</th>
						<th>탈퇴 회원수</th>
					</tr>
					<tr>
						<td>${mcount.member_all}명</td>
						<td>${mcount.member_today}명</td>
						<td>${mcount.member_quit}명</td>
					</tr>
				</table>
				<table class="adminTable2">
					<tr>
						<th>검색옵션
						<td><label for="searchOption1"></label> <select
							name="searchOption1" class="form-control" id="searchOption1">
								<option value="userid">아이디</option>
								<option value="name">이름</option>
								<option value="addr1">주소</option>
								<option value="all">아이디/이름/주소</option>
						</select>
							<div class="input-group">
								<input type="text" class="form-control" name="searchKeyword"
									value="${searchOp.searchKeyword}">
							</div></td>
					</tr>
					<tr>
						<th>가입일</th>
						<td><input type="date" id="startDate" name="startDate"
							value="${searchOp.startDate}">&nbsp;&nbsp;~&nbsp;&nbsp; <input
							type="date" id="endDate" name="endDate"
							value="${searchOp.endDate}"></td>
					</tr>
					<tr>
						<th>분류</th>
						<td><label for="searchOption2"></label> <select
							name="searchOption2" class="form-control" id="searchOption2">
								<option value="user">이용</option>
								<option value="quit">탈퇴</option>
								<option value="all">전체</option>
						</select></td>
					</tr>
					<tr>
						<th>정렬기준</th>
						<td><select name="orderOption" class="form-control"
							id="orderOption">
								<option value="userid">아이디순</option>
								<option value="name">이름순</option>
								<option value="join_date">최근가입순</option>
						</select></td>
					</tr>
				</table>
				<br>
			
				<div class="sectiondiv" align="center">
					<button class="btn btn-default" type="button" id="btnSearch">
						검색 <i class="glyphicon glyphicon-search"></i>
					</button>
				</div>
			<table class="ordertable">
				<thead>
					<tr>
						<th>#</th>
						<th>No</th>
						<th>아이디</th>
						<th>이름</th>
						<th>이메일</th>
						<th>성별</th>
						<th>전화번호</th>
						<th>주소</th>
						<th>가입일</th>
						<th>탈퇴여부</th>
					</tr>
				</thead>
					<tbody>
				<c:forEach var="dto" varStatus="loop" items="${list}">
						<tr>
							<td><input name="userids" type="checkbox"
								value="${dto.userid}"></td>
							<td>${dto.rn}</td>
							<td><a href="#" onclick="memberView('${dto.userid}')">${dto.userid}</a></td>
							<td>${dto.name}</td>
							<td>${dto.email}</td>
							<td>${dto.gender}</td>
							<td>${dto.hp}</td>
							<td>${dto.addr1}</td>
							<td><fmt:formatDate value="${dto.join_date}" type="date"
									pattern="yyyy-MM-dd" /></td>
							<td>${dto.quit == 'y' ? '탈퇴':'회원'}</td>
						</tr>
				</c:forEach>
					</tbody>
			</table>
			<button id="btnDelete" type="button" class="btn btn-default">탈퇴처리</button>
			<div class="row" align="center">
				<div class="col-sm-12">
					<ul class="pagination pagination">
						<c:if test="${pager.curPage > 1}">
							<li><a href="#" onclick="memberList('1')">첫 페이지</a></li>
						</c:if>
						<c:if test="${pager.curBlock > 1}">
							<li><a href="#" onclick="memberList('${pager.prevPage}')">이전</a></li>
						</c:if>
						<c:forEach var="page" begin="${pager.blockStartPage}"
							end="${pager.blockEndPage}">
							<c:choose>
								<c:when test="${page == pager.curPage}">
									<li><a href="#" style="text-decoration: underline;">${page}</a></li>
								</c:when>
								<c:otherwise>
									<li><a href="#" onclick="memberList('${page}')">${page}</a></li>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						<c:if test="${pager.curBlock < pager.totBlock}">
							<li><a href="#" onclick="memberList('${pager.nextPage}')">다음</a></li>
						</c:if>
						<c:if test="${pager.curPage < pager.totPage}">
							<li><a href="#" onclick="memberList('${pager.totPage}')">마지막
									페이지</a></li>
						</c:if>
					</ul>
				</div>
				</div>
		</form>
			
	</div>
	</section>
	</div>
</body>
</html>