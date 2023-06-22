function memberIdCheck() {
	if(document.querySelector("input[name='member_id']").value === "") {
		alert("아이디는 필수입니다");
		document.querySelector("input[name='member_id']").focus();
		return false;
	}
	return true;
}

function memberPass(){
	if(document.querySelector("input[name='password']").value === "") {
		alert("비밀번호는 필수입니다");
		document.querySelector("input[name='password']").focus();
		return false;
	}else if(!pwdCheck(document.querySelector("input[name='password']").value)){
		alert("비밀번호는 영문,숫자,특수문자 1글자 이상 조합하여 작성해주세요");
		document.querySelector("input[name='password']").focus();
		return false;
	}
	return true;
}

function memberPassCheck(){
	if(document.querySelector("input[name='password-check']").value === "") {
		alert("비밀번호 확인은 필수입니다");
		document.querySelector("input[name='password-check']").focus();
		return false;
	}
	return true;
}

function pwdCheck(asValue) {
	var regex = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$/g;
	
	return regex.test(asValue);
}

function memberNameCheck(){
	if(document.querySelector("input[name='name']").value === "") {
		alert("이름은 필수입니다");
		document.querySelector("input[name='name']").focus();
		return false;
	}else if(!nameCheck(document.querySelector("input[name='name']").value)){
		alert("이름은 한글로 2~4글자로 작성해주세요");
		document.querySelector("input[name='name']").focus();
		return false;
	}
	return true;
}

function nameCheck(asValue) {
	var regex =  /^[가-힣]{2,4}$/;
	
	return regex.test(asValue);
}

function memberEmailCheck(){
	if(document.querySelector("input[name='email1']").value === "") {
		alert("이메일은 필수입니다");
		document.querySelector("input[name='email1']").focus();
		return false;
	}else if(document.querySelector("input[name='email2']").value === "") {
		alert("이메일은 필수입니다");
		document.querySelector("input[name='email2']").focus();
		return false;
	}else if(document.querySelector("#selectbox-email").value === "default") {
		alert("이메일은 필수입니다");
		document.querySelector("#selectbox-email").focus();
		return false;
	}else if(!emailCheck(document.querySelector("input[name='email1']").value)){
		alert("이메일은 영문 또는 숫자로 4자리 이상 입력해주세요");
		document.querySelector("input[name='email1']").focus();
		return false;
	}
	return true;
}

function emailCheck(asValue){
	var regex = /[A-za-z0-9]{4,20}$/;
	
	return regex.test(asValue);
}
5

function memberPhoneCheck() {
	if(document.querySelector("#selectbox-mobile").value === "default") {
		alert("휴대전화는 필수입니다");
		document.querySelector("#selectbox-mobile").focus();
		return false;
	}else if(document.querySelector("#selectbox-phone").value === "default") {
		alert("휴대전화는 필수입니다");
		document.querySelector("#selectbox-phone").focus();
		return false;
	}else if(document.querySelector("input[name='phone2']").value === "") {
		alert("휴대전화는 필수입니다");
		document.querySelector("input[name='phone2']").focus();
		return false;
	}else if(document.querySelector("input[name='phone3']").value === "") {
		alert("휴대전화는 필수입니다");
		document.querySelector("input[name='phone3']").focus();
		return false;
	}else if(!phoneCheck(document.querySelector("input[name='phone2']").value)) {
		alert("휴대전화는 숫자 3,4자리로 입력해주세요");
		document.querySelector("input[name='phone2']").focus();
		return false;
	}else if(!phoneCheck(document.querySelector("input[name='phone3']").value)){
		alert("휴대전화는 숫자 3,4자리로 입력해주세요");
		document.querySelector("input[name='phone3']").focus();
		return false;
	}
	return true;
}

function phoneCheck(asValue) {
	var regex = /^\d{3,4}$/;
	
	return regex.test(asValue);
}


function memberValidation() {
	if (!memberIdCheck()) {
        return false;
    }else if(!memberPass()){
    	return false;
    }else if(!memberPassCheck()){
    	return false;
    }else if(!memberNameCheck()){
    	return false;
    }else if(!memberEmailCheck()){
    	return false;
    }else if(!memberPhoneCheck()){
    	return false;
    }
	
}



