<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../include/header.jsp"%>
<%@ include file="../include/adminHeader.jspf"%>
<title>회원 정보</title>
<script type="text/javascript">
	$(function() {
		$("#btnDelete").click(function() {
			alertify.confirm("예약 목록을 삭제하시겠습니까?", function() {
				document.form1.action = "${path}/admin/reserv_delete.do";
				document.form1.submit();
			});
		});
		$("#btnDelete2").click(function() {
			alertify.confirm("게시글을 삭제하시겠습니까?", function() {
				document.form2.action = "${path}/admin/qna_delete.do";
				document.form2.submit();
			});
		});
	});
	function qnaView(param) {
		document.form1.action = "${path}/board/qna/view.do?bno=" + param;
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
				<h2>회원 정보</h2>
				<div style="margin: 5% 0 40% 0;">
					<table class="adminTable2" style="width:50%;">
						<tr>
							<th id="adminTB2_th" style="width:20%;">아이디</th>
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
							<td>${dto.addr1}${dto.addr2}</td>
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
					
					<h4>${dto.name}님의 최근 예약</h4>
					<table class="adminTable3">
						<thead>
							<tr>
								<th>#</th>
								<th>예약번호</th>
								<th>예매자</th>
								<th>전시명(전시코드)</th>
								<th>성인/청소년/어린이</th>
								<th>총 수량</th>
								<th>총가격</th>
								<th>구매일</th>
								<th>결제상태</th>
							</tr>
						</thead>
						<c:forEach var="reserv" varStatus="loop" items="${reserv_list}">
							<tbody>
								<tr>
									<td><input name="reserv_no" type="checkbox"
										value="${reserv.no}"></td>
									<td>${reserv.no}</td>
									<td>${reserv.name}(${reserv.userid})</td>
									<td>${reserv.title}(${reserv.code})</td>
									<td>${reserv.adult}/${reserv.teen}/ ${reserv.kids}</td>
									<td>${reserv.quantity}</td>
									<td>${reserv.sub_total}</td>
									<td><fmt:formatDate value="${reserv.res_date}" type="date"
											pattern="yyyy-MM-dd" /></td>
									<td>${reserv.pay == 'y' ? '완료' : '미납'}</td>
								</tr>
							</tbody>
						</c:forEach>
					</table>
				<form name="form1" class="form-inline" method="post">
					<input type="hidden" name="userid" value="${dto.userid}">
				</form>
				<input type="submit" value="삭제 처리" id="btnDelete" name="btnDelete"><br><br><br>
				<form name="form2" class="form-inline" method="post">
					<h4>${dto.name}님의 최근 문의글</h4>
					<table class="adminTable3">
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
									<td><a href="#" onclick="qnaView('${qna.bno}')">${qna.title}
											${qna.show == 'n' ? ' [삭제된 게시글] ' : ''}</a></td>
									<td>${qna.name}(${qna.writer})</td>
									<td>${qna.viewcnt}</td>
									<td><fmt:formatDate value="${qna.reg_date}" type="date"
											pattern="yyyy-MM-dd" /></td>
									<td>${qna.reply_state == 'y' ? '완료' : '미완'}</td>
								</tr>
							</tbody>
						</c:forEach>
					</table>
					<input type="hidden" name="userid" value="${dto.userid}">
					</form>
					<input type="submit" value="삭제 처리" id="btnDelete2" name="btnDelete2">
				</div>
		</section>
	</div>
	<%@ include file="../include/footer.jsp"%>
</body>
</html>