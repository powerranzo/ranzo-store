<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>REVIEW</title>
<%@ include file="../include/header.jsp" %>
<!-- include libraries(jQuery, bootstrap) -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>


<script type="text/javascript">
$(function() {
	$("#content").summernote({
		width : 600,
		height : 200,
		
		 callbacks: {
			 onImageUpload: function(image) {
				 var file = image[0];
         var reader = new FileReader();
         reader.onloadend = function() {
        	 var image = $('<img>').attr('src',  reader.result);
        	 image.attr('width','30%');
           $('#content').summernote("insertNode", image[0]);
					}
         	reader.readAsDataURL(file);
				}
		 }
	});
});
$(function(){
	$("#btnSave").click(function(){
		var product = $("#product").val();
		var subject = $("#subject").val();
		var content = $("#content").val();
		if(product ==""){
			alert("전시를 선택하세요.");
			return;
		}
		if(subject ==""){
			alert("제목을 입력하세요.");
			return;
		}
		if(content ==""){
			alert("내용을 입력하세요.");
			return;
		}
		document.form1.submit();
	});
});

</script>

</head>
<body>
<div align="center">
<%@ include file="../include/menu.jsp" %>

<form id="form1" name="form1" method="post" action="${path}/board/review/insert.do" enctype="multipart/form-data">
	<table class="table table-striped" style="width: 800px; border: 1px solid #dddddd">
		<tr>
			<th colspan="2" style="background-color: #eeeeee; text-align: center;">Review 작성</th>
		</tr>
		<tr>
			<th>별점</th>
			<td>
				<select name="rating">
					<option value="5" selected="selected"> ★★★★★</option>
					<option value="4"> ★★★★</option>
					<option value="3"> ★★★</option>
					<option value="2"> ★★</option>
					<option value="1"> ★</option>
				</select>
			</td>
		</tr>
		<tr>
			<th width="15%">전시명</th>
			<td>				
				<select id="product" name="product">
					<option value="testcode01">루이스 웨인展 in 일산</option>
					<option value="testcode03">데미안</option>
					<option value="testcode04">합스부르크 600년, 매혹의 걸작들</option>
					<option value="testcode05">앙드레 브라질리에</option>
					<option value="testcode06">장 줄리앙</option>
					<option value="testcode07">화중서가(畵中抒歌) 환기의 노래, 그림이 되다</option>
					<option value="testcode08">어노니머스 프로젝트</option>
					<option value="testcode09">(북촌)2022년 10,11,12월-어둠속의대화(DIALOGUE IN THE DARK)</option>
					<option value="testcode10">나탈리 카르푸셴코 사진전</option>
					<option value="testcode11">프랑코 폰타나：컬러 인 라이프</option>
					<option value="testcode12">모네 인사이드</option>
					<option value="testcode13">빈센트 발 : The Art of Shadow</option>
					<option value="testcode14">(동탄)2022년 10,11,12월-어둠속의대화(DIALOGUE IN THE DARK)</option>
					<option value="testcode15">영천시 보현산천문과학관</option>
					<option value="testcode16">하리보 골드베렌 100주년 생일 기념전</option>
					<option value="testcode17">외규장각 의궤, 그 고귀함의 의미</option>
					<option value="testcode18">비비안 마이어 사진전</option>
					<option value="testcode19">로그아웃</option>
					<option value="testcode20">드림어빌리티 - Dreamability</option>
					<option value="testcode21">내셔널지오그래픽 ＇포토아크, 너의 이름은＇사진전</option>
					<option value="testcode22">〈어린왕자 인 서울〉 스토리몰입형 미디어아트</option>
					<option value="testcode23">셰퍼드 페어리, 행동하라!</option>
					<option value="testcode24">제21회 서울카페쇼 2022 얼리버드 티켓</option>
					<option value="testcode25">에바 알머슨 특별전：Andando</option>
					<option value="testcode26">어쨌든, 사랑：Romantic Days</option>
					<option value="testcode27">2022 코엑스 푸드위크</option>
					<option value="testcode28">바티망</option>
					<option value="testcode29">시간의 조각：계절</option>
					<option value="testcode30">한국만화박물관 입장권</option>
					<option value="testcode31">뒤뷔페전 - 프랑스 현대미술의 거장</option>
					<option value="testcode32">내셔널지오그래픽 사진전 〈포토아크, 너의 이름은〉</option>
					<option value="testcode33">63아트 에릭요한슨 사진전</option>
					<option value="testcode34">(강릉)아르떼뮤지엄</option>
					<option value="testcode35">강릉 참소리축음기＆에디슨과학박물관</option>
					<option value="testcode36">프랑스 자연사박물관 특별전 〈바다, 미지로의 탐험2〉</option>
					<option value="testcode37">원더래빗 입장권</option>
					<option value="testcode38">다이노베이 DINO BAY</option>
					<option value="testcode39">월드아트 서커스</option>
					<option value="testcode40">라이크디즈 김광석거리점 (유담 개인전: 새가 되어)</option>
					<option value="testcode41">라이크디즈위드 교동점 (광배군 사진전:SoSo한 일상, 사랑이니까)</option>
					<option value="testcode42">라이크디즈위드 교동점 (소순 개인전 : 우리들의 기록)</option>
					<option value="testcode43">신세계 넥스페리움</option>
					<option value="testcode44">부산영화체험박물관/트릭아이뮤지엄 통합 입장권</option>
					<option value="testcode45">ZiBEZI IN 지비지 개인전 : 부산</option>
					<option value="testcode46">K-핸드메이드페어 2022</option>
					<option value="testcode47">덕수궁 야경투어</option>
					<option value="testcode48">(여수)아르떼뮤지엄</option>
					<option value="testcode49">조선셰프 서유구</option>
					<option value="testcode50">그리스신화박물관＆트릭아이미술관</option>
					<option value="testcode51">고흐의 정원</option>
					<option value="testcode52">스카이워터쇼</option>
					<option value="testcode53">맥스 달튼, 영화의 순간들 Ⅱ</option>
					<option value="testcode54">후지시로 세이지 북촌스페이스</option>
					<option value="testcode55">반 고흐 인사이드 : 더 씨어터</option>								
				</select>			
			</td>
		</tr>
		<tr>
			<th width="15%">제목</th>
			<td>
			<input id="subject" name="subject" value="${dto.subject}" size="70" placeholder="제목을 입력하세요">
			</td>
		</tr>
		<tr>
			<th width="15%">내용</th>
			<td>
				<textarea id="content" name="content" rows="2" cols="80" placeholder="내용을 입력하세요">${dto.content}</textarea>
			</td>
		</tr>
	</table>
	<br>
	<div style="width: 700px;" align="center">
		<button type="button" id="btnList" onclick="location.href='${path}/board/review/list.do'" class="btn btn-secondary">목록</button>		
		<button type="button" id="btnSave" class="btn btn-primary">확인</button>
	</div>
</form>
</div>

</body>
</html>