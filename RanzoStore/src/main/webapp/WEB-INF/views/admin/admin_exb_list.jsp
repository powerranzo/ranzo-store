<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../include/admin_head.jspf"%>
<title>전시 목록</title>
<script type="text/javascript">
$(function(){
	
	optionSelect(1);
	optionSelect(2);
	optionSelect(3);
	
	
	$("#btnWrite").click(function(){
		location.href='${path}/admin/exb_write.do';
	});
	$("#btnDelete").click(function(){
		if(confirm('삭제 처리하시겠습니까?')){
		document.form1.action="${path}/admin/exb_delete.do";
		document.form1.submit();
		}
	});
	$("#btnSearch").click(function(){
		document.form1.action="${path}/admin/exb_list.do";
		document.form1.submit();
	});
});
function optionSelect(num){
	var selected="";
	var option=''.concat('#searchOption',num);
		if(num==1){
			selected='${exb.searchOp.searchOption1}';
		}else if(num==2) {
			selected='${exb.searchOp.searchOption2}';
		}else {
			selected='${exb.searchOp.orderOption}';
			option='#orderOption';
		}
		console.log(option);
	var length = $(option).children().length;
	console.log(length);
	for(i=1; i<=length; i++)	{
		var val = $(option+' option:eq('+i+')').val(); 
		if(selected==val) 
			$(option+' option:eq('+i+')').prop("selected", "selected");
	}
}
function exbList(param){
	document.form1.action="${path}/admin/member_list.do?curPage="+param;
	document.form1.submit();
}
</script>
</head>
<body>
	<div class="container">
		<h3>전시현황</h3>
		<form name="form1" class="form-inline" method="post">
		<div class="form-group">
		<table class="table table-striped">
		 <tr>
		  <th>전체 전시</th>
		  <th>진행 중인 전시</th>
		  <th></th>
		 </tr>
		 <tr>
		  <td>${ exb.exb_count_all}개</td>
		  <td>${ exb.exb_count_ing}개</td>
		  <td><td>
		 </tr>
		</table>
		 <table class="table table-bordered">
		 <tr><th>검색옵션
				<td>
				<label for="searchOption1"></label>
				<select name="searchOption1" class="form-control" id="searchOption1">
							<option value="code">전시코드</option>
							<option value="title">전시명</option>
							<option value="location">전시지역</option>
							<option value="gallery">전시관</option>
							<option value="all">코드/이름/지역/전시관</option>
						</select>
			<div class="input-group">
				<input type="text" class="form-control" name="searchKeyword"
					value="${ exb.searchOp.searchKeyword}">
			</div>
				</td>
				</tr>
				<tr>
				<th>전시 기간</th>
				<td>
				<input type="date" id="startDate" name="startDate" value="${ exb.searchOp.startDate}">&nbsp;&nbsp;~&nbsp;&nbsp; 
				<input type="date" id="endDate" name="endDate" value="${ exb.searchOp.endDate}">
				</td>
				</tr>
<!-- 				<tr> -->
<!-- 				<th>분류</th> -->
<!-- 				<td> -->
<!-- 				<label for="searchOption2"></label> -->
<!-- 				<select name="searchOption2" class="form-control" id="searchOption2"> -->
<!-- 							<option value="user">이용</option> -->
<!-- 							<option value="quit">탈퇴</option> -->
<!-- 							<option value="all">전체</option> -->
<!-- 						</select> -->
<!-- 				</td> -->
<!-- 				</tr> -->
				<tr>
				<th>정렬기준</th>
				<td>
				<select name="orderOption" class="form-control" id="orderOption">
								<option value="code">코드순</option>
								<option value="title">전시명순</option>
								<option value="hit">조회수</option>
								<option value="sales">판매량순</option>
								<option value="start_date">시작일기준</option>
								<option value="end_date">마감일기준</option>
							</select>
				</td>
				</tr>
			</table>
			</div>
			<div class="form-group" align="center">
					<button class="btn btn-default" type="button" id="btnSearch">
						검색  <i class="glyphicon glyphicon-search"></i>
					</button>
				</div>

			<table class="table table-hover">
				<thead>
					<tr>
						<th>#</th>
						<th>No</th>
						<th>전시코드</th>
						<th>전시명</th>
						<th>지역</th>
						<th>전시관</th>
						<th>전시기간</th>
						<th>페이지 조회수</th>
						<th>판매량</th>
					</tr>
				</thead>
				<c:forEach var="dto" varStatus="loop" items="${exb.list}">
					<tbody>
						<tr>
							<td><input name="code" type="checkbox"
								value="${dto.code}"></td>
							<td>${dto.rn}</td>
							<td>${dto.code}</td>
							<td><a href="#">${dto.title}</a></td>
							<td>${dto.location}</td>
							<td>${dto.gallery}</td>
							<td><fmt:formatDate value="${dto.start_date}" type="date"
									pattern="yyyy-MM-dd" /> ~ 
								<fmt:formatDate value="${dto.end_date}" type="date"
									pattern="yyyy-MM-dd" />					
							</td>
							<td>${dto.hit}</td>
							<td>${dto.sales}</td>
						</tr>
					</tbody>
				</c:forEach>
			</table>
			<div class="row" align="center">
				<div class="col-sm-12">
					<ul class="pagination pagination">
						<c:if test="${exb.pager.curPage > 1}">
							<li><a href="#" onclick="exbList('1')">첫 페이지</a></li>
						</c:if>
						<c:if test="${exb.pager.curBlock > 1}">
							<li><a href="#" onclick="exbList('${exb.pager.prevPage}')">이전</a></li>
						</c:if>
						<c:forEach var="page" begin="${exb.pager.blockStartPage}"
							end="${exb.pager.blockEndPage}">
							<c:choose>
								<c:when test="${page == exb.pager.curPage}">
									<li><a href="#" style="text-decoration: underline;">${page}</a></li>
								</c:when>
								<c:otherwise>
									<li><a href="#" onclick="exbList('${page}')">${page}</a></li>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						<c:if test="${exb.pager.curBlock < exb.pager.totBlock}">
							<li><a href="#" onclick="exbList('${exb.pager.nextPage}')">다음</a></li>
						</c:if>
						<c:if test="${exb.pager.curPage < exb.pager.totPage}">
							<li><a href="#" onclick="exbList('${exb.pager.totPage}')">마지막
									페이지</a></li>
						</c:if>
					</ul>
				</div>
			</div>
			<button id="btnDelete" type="button" class="btn btn-default">삭제처리</button>
			<button id="btnDelete" type="button" class="btn btn-default">신규등록</button>
		</form>
	</div>
</body>
</html>