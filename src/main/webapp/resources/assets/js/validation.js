/**
 * 
 */
//alert("test");
function form_check_addProduct(){
	let productId = document.getElementById("newProduct");
	let pName = document.getElementById("pName");
	let unitPrice = document.getElementById("unitPrice");
	let description = document.getElementById("description");
	let category = document.getElementById("category");
	let pImg = document.getElementById("pImg");
	
	if(!(productId.value)){
		alert("상품의 코드를 입력해주세요.");
		productId.focus();
		return false;
	}
	if(!(pName.value)){
			alert("상품명을 입력해주세요.");
			pName.focus();
			return false;
	}
	/*가격은 숫자만 입력하도록 구현*/
	if ((unitPrice.value.length == 0)) {
		alert("가격을 입력해주세요.");
		unitPrice.focus();
		return false;
	} else if (unitPrice.value < 0) {
		alert("가격은 음수를 입력할 수 없습니다.");
		unitPrice.focus();
		return false;
	}else if(!(unitPrice.value)){
			    alert("가격을 입력해주세요.");
				unitPrice.focus();
				return false;
	}
		
	//이미지 유무 체크
	if(!(pImg.value)){
		alert("제품의 이미지를 등록해주세요.");
		return false;
	}
	
	document.registerNewProduct.submit();
}