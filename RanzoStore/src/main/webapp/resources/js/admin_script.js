
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