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
		if(confirm('종료하시겠습니까?')) {
		document.form1.action = getContextPath()+'/admin/popup_delete.do?no=' + param;
		document.form1.submit();
		}
	}
	function popupShow(param) {
		if(confirm('재개하시겠습니까?')) {
			document.form1.action = getContextPath()+'/admin/popup_show.do?no=' + param;
			document.form1.submit();
		}
	}
$(function() {
		$("#img_src").change(function() {
			console.log($("#img_src").val());
			if ($("#img_src").val() == "") {
				$("#urlImage").hide();
			} else {
				$("#urlImage").show();
				$("#urlImage").attr('src', $("#img_src").val());
			}
		});
	});