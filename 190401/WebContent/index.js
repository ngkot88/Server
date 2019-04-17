function writeCh() {
	var form = document.pizza_form;
	
	if(! form.sale_num.value){
		alert("매출전표번호를 입력하세요.");
		form.sale_num.focus();
		return false;
	}
	if(! form.jim_code.value){
		alert("지점코드를 입력하세요.");
		form.jim_code.focus();
		return false;
	}
	if(! form.sale_date.value){
		alert("판매일자를 입력하세요.");
		form.sale_date.focus();
		return false;
	}
	if(form.pizza_code.value == ""){
		alert("피자코드를 선택하세요.");
		form.pizza_code.focus();
		return false;
	}
	if(! form.pan.value){
		alert("판매수량을 입력하세요.");
		form.pan.focus();
		return false;
	}
	
	form.submit();
}
