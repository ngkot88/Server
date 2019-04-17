function writeCh() {
		var form = document.money_form;
		
		if(form.pan.value == ""){
			alert("판매구분을 선택하세요.");
			form.pan.focus();
			return false;
		}
		if(form.popo.value == ""){
			alert("판매점포를 선택하세요.");
			form.popo.focus();
			return false;
		}
		if(form.item.value == ""){
			alert("판매상품를 선택하세요.");
			form.item.focus();
			return false;
		}
		if(! form.sale_cnt.value){
			alert("판매수량을 입력하세요.");
			form.sale_cnt.focus();
			return false;
		}
		if(form.pay_type.value == ""){
			alert("수취구분을 선택하세요.");
			form.pay_type.focus();
			return false;
		}
	}