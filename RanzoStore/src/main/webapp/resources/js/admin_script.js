/**
 * 
 */
function getContextPath(){
	var hostIndex = location.href.indexOf(location.host)+location.host.length;
	var contextPath = location.href.substring(hostIndex, location.href.indexOf('/', hostIndex + 1));
	return contextPath;
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
		// 	document.charset="utf-8";
		var hidden = document.createElement('input');
		hidden.setAttribute('type', 'hidden');
		hidden.setAttribute('name', 'code');
		hidden.setAttribute('value', param);
		form.appendChild(hidden);
		document.body.appendChild(form);
		form.submit();
	}

//reservList.jsp
	function reservList(param) { 
		document.form1.action = getContextPath()+'/admin/reserv_list.do?curPage=' + param;
		document.form1.submit();
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
		$("#attach").change(function() {
			//console.log($("#attach").val());
			if ($("#attach").val() == "") {
				$("#urlImage").hide();
			} else {
				$("#urlImage").show();
				$("#urlImage").attr('src', $("#attach").val());
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
	
	function exbCheck(){
		var code=document.getElementById('code').value;
		var title=document.getElementById('title').value;
		var gallery=document.getElementById('gallery').value;
		var location=document.getElementById('location').value;
		var start_date=document.getElementById('start_date').value;
		var end_date=document.getElementById('end_date').value;
		var adult_price=document.getElementById('adult_price').value;
		var teen_price=document.getElementById('teen_price').value;
		var kids_price=document.getElementById('kids_price').value;
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
		if (file1 == "") {
			alertify.alert('포스터를 등록하세요.');
			return;
		}
		if (file2 == "" && attach == "") {
			alertify.alert('파일 등록 또는 URL을 입력하세요.');
			img_src.focus();
			return;
		}
		if (file != "" && attach != "") {
			alertify.alert('파일과 URL을 중복 등록할 수 없습니다.');
			img_src.focus();
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