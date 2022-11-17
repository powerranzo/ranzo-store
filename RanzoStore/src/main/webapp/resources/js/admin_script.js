/**
 * 
 */
function getContextPath(){
	var hostIndex = location.href.indexOf(location.host)+location.host.length;
	var contextPath = location.href.substring(hostIndex, location.href.indexOf('/', hostIndex + 1));
	return contextPath;
}

//adminHome.jsp
function homeList(n){
	var url = getContextPath()+"/admin/exb_list.do";
	var val = "";
	if(n==1)
		val ="?SearchOption2=ing";
	if(n==2)
		val="?SearchOption2=end";
	if(n==3){
		var date = new Date();
		var today = date.getFullYear()+"-"+(date.getMonth()+1)+"-"+date.getDate();
		url = getContextPath()+"/admin/reserv_list.do";
		val = "?startDate="+today+"&endDate="+today;
	}
	if(n==4){
		url = getContextPath()+"/admin/reserv_list.do";
		val = "?searchOption2=pay_y";
	}
		location.href=url+val;
		console.log(url+val);
}

//memberList.jsp
	function memberList(param) {
		document.form1.action = getContextPath()+"/admin/member_list.do?curPage=" + param;
		document.form1.submit();
	}
	function memberView(param) {
		console.log('memberView() 호출');
		console.log(param);
		let frm = document.createElement('form');
		frm.setAttribute('name', 'form2');
		frm.setAttribute('method', 'post');
		frm.setAttribute('action', getContextPath()+'/admin/member_view.do');
		let ipt = document.createElement('input');
		ipt.setAttribute('type', 'hidden');
		ipt.setAttribute('name', 'userid');
		ipt.setAttribute('value', param);

		frm.appendChild(ipt);
		document.body.appendChild(frm);
		frm.submit();
	}

//exbList.jsp
	function exbList(param) {
		document.form1.action = getContextPath()+'/admin/exb_list.do?curPage=' + param;
		document.form1.submit();
	}

	function exbUpdate(param) {
		console.log(param);
		var form = document.createElement('form');
		form.setAttribute('name', 'form2');
		form.setAttribute('method', 'post');
		form.setAttribute('action', getContextPath()+'/admin/exb_view.do');
		var hidden = document.createElement('input');
		hidden.setAttribute('type', 'hidden');
		hidden.setAttribute('name', 'code');
		hidden.setAttribute('value', param);
		form.appendChild(hidden);
		document.body.appendChild(form);
		form.submit();
	}
	function exbView(param) {
		document.form1.action = getContextPath()+'/admin/exb_view.do?code=' + param;
		document.form1.submit();
	}
	 
	function exbDel(param) {
		alertify.confirm("종료하시겠습니까?", function() {
		document.form1.action = getContextPath()+'/admin/exbs_delete.do?code=' + param;
		document.form1.submit();
		});
	}
	function exbShow(param) {
		alertify.confirm("재개하시겠습니까?", function() {
			document.form1.action = getContextPath()+'/admin/exbs_show.do?code=' + param;
			document.form1.submit();
		});
	}

//reservList.jsp
	function reservList(param) { 
		document.form1.action = getContextPath()+'/admin/reserv_list.do?curPage=' + param;
		document.form1.submit();
	}
	
	function rsvDel(param) {
		alertify.confirm("삭제하시겠습니까?", function() {
		document.form1.action = getContextPath()+'/admin/reserv_delete.do?no=' + param;
		document.form1.submit();
		});
	}
	
//qnaList.jsp
	function qnaList(param) {
		document.form1.action = getContextPath()+'/admin/qna_list.do?curPage=' + param;
		document.form1.submit();
	}

//popupList.jsp
	function popupList(param) {
		document.form1.action = getContextPath()+'/admin/popup_list.do?curPage=' + param;
		document.form1.submit();
	}
	
	function popupView(param) {
		document.form1.action = getContextPath()+'/admin/popup_view.do?no=' + param;
		document.form1.submit();
	}
	 
	function popupDel(param) {
		alertify.confirm("종료하시겠습니까?", function() {
		document.form1.action = getContextPath()+'/admin/popup_delete.do?no=' + param;
		document.form1.submit();
		});
	}
	function popupShow(param) {
		alertify.confirm("재개하시겠습니까?", function() {
			document.form1.action = getContextPath()+'/admin/popup_show.do?no=' + param;
			document.form1.submit();
		});
	}

// URL 이미지 미리보기
$(function() {
		$("#img_src").change(function() {
			//console.log($("#img_src").val());
			if ($("#img_src").val() == "") {
				$("#urlImage").hide();
			} else {
				$("#urlImage").show();
				$("#urlImage").attr('src', $("#img_src").val());
			}
		});
		$("#thumnail").change(function() {
			//console.log($("#thumnail").val());
			if ($("#thumnail").val() == "") {
				$("#urlImage1").hide();
			} else {
				$("#urlImage1").show();
				$("#urlImage1").attr('src', $("#thumnail").val());
			}
		});
		$("#attach").change(function() {
			//console.log($("#attach").val());
			if ($("#attach").val() == "") {
				$("#urlImage2").hide();
			} else {
				$("#urlImage2").show();
				$("#urlImage2").attr('src', $("#attach").val());
			}
		});
	});
	
	function popCheck() {
		var title=document.getElementById('title').value;
		var start_date=document.getElementById('start_date').value;
		var end_date=document.getElementById('end_date').value;
		var file=document.getElementById('file').value;
		var img_src=document.getElementById('img_src').value;
		if (title == "") {
			alertify.alert('제목을 입력하세요.');
			title.focus();
			return;
		}
		if (start_date == "") {
			alertify.alert('시작일을 입력하세요.');
			start_date.focus();
			return;
		}
		if (end_date == "") {
			alertify.alert('종료일을 입력하세요.');
			end_date.focus();
			return;
		}
		if (start_date > end_date) {
			alertify.alert('종료일이 시작일보다 빠릅니다.');
			end_date.focus();
			return;
		}
		if (file == "" && img_src == "") {
			alertify.alert('파일 등록 또는 URL을 입력하세요.');
			img_src.focus();
			return;
		}
		if (file != "" && img_src != "") {
			alertify.alert('파일과 URL을 중복 등록할 수 없습니다.');
			img_src.focus();
			return;
		}
		return true;
	}
	
	function popCheck2() {
		var title=document.getElementById('title').value;
		var start_date=document.getElementById('start_date').value;
		var end_date=document.getElementById('end_date').value;
		var file=document.getElementById('file').value;
		var img_src=document.getElementById('img_src').value;
		var fileImage=document.getElementById('fileImage').src;
		if (title == "") {
			alertify.alert('제목을 입력하세요.');
			title.focus();
			return;
		}
		if (start_date == "") {
			alertify.alert('시작일을 입력하세요.');
			start_date.focus();
			return;
		}
		if (end_date == "") {
			alertify.alert('종료일을 입력하세요.');
			end_date.focus();
			return;
		}
		if (start_date > end_date) {
			alertify.alert('종료일이 시작일보다 빠릅니다.');
			end_date.focus();
			return;
		}
		if (file == "" && img_src == "" && fileImage == "") {
			alertify.alert('파일 등록 또는 URL을 입력하세요.');
			img_src.focus();
			return;
		}
		if (file != "" && img_src != "") {
			alertify.alert('파일과 URL을 중복 등록할 수 없습니다.');
			img_src.focus();
			return;
		}
		return true;
	}
	
	function exbCheck1(){
	console.log('호출됨');
		var code=document.getElementById('code').value;
		var title=document.getElementById('title').value;
		var gallery=document.getElementById('gallery').value;
		var location=document.getElementById('location').value;
		var start_date=document.getElementById('start_date').value;
		var end_date=document.getElementById('end_date').value;
		var adult_price=document.getElementById('adult_price').value;
		var teen_price=document.getElementById('teen_price').value;
		var kids_price=document.getElementById('kids_price').value;
		var thumnail=document.getElementById('thumnail').value;
		var file1=document.getElementById('file1').value;
		var file2=document.getElementById('file2').value;
		var attach=document.getElementById('attach').value;
		if (code == "") {
			alertify.alert('전시코드를 입력하세요.');
			code.focus();
			return;
		}
		if (title == "") {
			alertify.alert('제목을 입력하세요.');
			title.focus();
			return;
		}
		if (gallery == "") {
			alertify.alert('전시관을 입력하세요.');
			gallery.focus();
			return;
		}
		if (location == "") {
			alertify.alert('전시 지역을 입력하세요.');
			location.focus();
			return;
		}
		if (start_date == "") {
			alertify.alert('시작일을 입력하세요.');
			start_date.focus();
			return;
		}
		if (end_date == "") {
			alertify.alert('종료일을 입력하세요.');
			end_date.focus();
			return;
		}
		if (start_date > end_date) {
			alertify.alert('종료일이 시작일보다 빠릅니다.');
			end_date.focus();
			return;
		}
		if (adult_price == "" || teen_price == "" || kids_price == "") {
			alertify.alert('가격을 모두 입력하세요.');
			adult_price.focus();
			return;
		}
		if (file1 == "" && thumnail == "") {
			alertify.alert('포스터를 등록하세요.');
			return;
		}
		if (file1 != "" && thumnail != "") {
			alertify.alert('파일과 URL을 중복 등록할 수 없습니다.');
			thumnail.focus();
			return;
		}
		if (file2 == "" && attach == "") {
			alertify.alert('전시정보를 등록하세요.');
			img_src.focus();
			return;
		}
		if (file2 != "" && attach != "") {
			alertify.alert('파일과 URL을 중복 등록할 수 없습니다.');
			attach.focus();
			return;
		}
		return true;
	}
	
	function exbCheck2(){
	console.log('호출됨');
		var code=document.getElementById('code').value;
		var title=document.getElementById('title').value;
		var gallery=document.getElementById('gallery').value;
		var location=document.getElementById('location').value;
		var start_date=document.getElementById('start_date').value;
		var end_date=document.getElementById('end_date').value;
		var adult_price=document.getElementById('adult_price').value;
		var teen_price=document.getElementById('teen_price').value;
		var kids_price=document.getElementById('kids_price').value;
		var thumnailImg=document.getElementById('thumnailImg').src;
		var pdtInfoImg=document.getElementById('pdtInfoImg').src;
		var thumnail=document.getElementById('thumnail').value;
		var file1=document.getElementById('file1').value;
		var file2=document.getElementById('file2').value;
		var attach=document.getElementById('attach').value;
		
		console.log('thumnailImg:'+thumnailImg);
		console.log('pdtInfoImg:'+pdtInfoImg);
		if (code == "") {
			alertify.alert('전시코드를 입력하세요.');
			code.focus();
			return;
		}
		if (title == "") {
			alertify.alert('제목을 입력하세요.');
			title.focus();
			return;
		}
		if (gallery == "") {
			alertify.alert('전시관을 입력하세요.');
			gallery.focus();
			return;
		}
		if (location == "") {
			alertify.alert('전시 지역을 입력하세요.');
			location.focus();
			return;
		}
		if (start_date == "") {
			alertify.alert('시작일을 입력하세요.');
			start_date.focus();
			return;
		}
		if (end_date == "") {
			alertify.alert('종료일을 입력하세요.');
			end_date.focus();
			return;
		}
		if (start_date > end_date) {
			alertify.alert('종료일이 시작일보다 빠릅니다.');
			end_date.focus();
			return;
		}
		if (adult_price == "" || teen_price == "" || kids_price == "") {
			alertify.alert('가격을 모두 입력하세요.');
			adult_price.focus();
			return;
		}
		if (file1 == "" && thumnailImg == "" && thumnail == "") {
			alertify.alert('포스터를 등록하세요.');
			return;
		}
		if (file1 == "" && thumnailImg == "-" && thumnail == "") {
			alertify.alert('포스터를 등록하세요.');
			return;
		}
		if (file1 != "" && thumnail != "") {
			alertify.alert('파일과 URL을 중복 등록할 수 없습니다.');
			thumnail.focus();
			return;
		}
		if (file2 == "" && pdtInfoImg == "" && attach == "") {
			alertify.alert('전시정보를 등록하세요.');
			return;
		}
		if (file2 == "" && pdtInfoImg == "-" && attach == "") {
			alertify.alert('전시정보를 등록하세요.');
			return;
		}
		if (file2 != "" && attach != "") {
			alertify.alert('파일과 URL을 중복 등록할 수 없습니다.');
			attach.focus();
			return;
		}
		return true;
	}
	
		function faqCheck(){
		var title=document.getElementById('title').value;
		var content=document.getElementById('content').value;
		if (title == "") {
			alertify.alert('제목을 입력하세요.');
			title.focus();
			return;
		}
		if (content == "") {
			alertify.alert('내용을 입력하세요.');
			content.focus();
			return;
		}
		return true;
	}