$(document).ready(function(){
/*************************************************************************
						회원가입 폼 체크
*************************************************************************/
	$("#button-gradient").click(function(){
		if($("input[name='id'").val()=="") {
			alert("아이디는 필수 입력 항목입니다");
			$("input[name='id'").focus();
			return false;
		}else if($("input[name='pwd'").val()==""){
			alert("비밀번호는 필수 입력 항목입니다");
			$("input[name='pwd'").focus();
			return false;
		}else if($("input[name='pwd-check']").val()=="") {
			alert("비밀번호 확인칸을 입력해주세요");
			$("input[name='pwd-check']").focus();
			return false;
		}else if($("input[name='pwd']").val() != $("input[name='pwd-check']").val()){
			alert("비밀번호가 서로 동일하지 않습니다");
			$("input[name='pwd-check']").focus();
			return false;
		}else if($("input[name='name']").val()==""){
			alert("이름은 필수 입력 항목입니다");
			$("input[name='name']").focus();
			return false;
		}else if($("#input-email").val()==""){
			alert("이메일은 필수 입력 항목입니다");
			$("input[name='email1']").focus();
			return false;
		}else if($("#selectbox-mobile").val()=="default") {
			alert("통신사를 선택해주세요");
			$("#selectbox-mobile").focus();
			return false;
		}else if($("#selectbox-phone").val()=="default") {
			alert("휴대전화는 필수 입력 항목입니다");
			$("#selectbox-phone").focus();
			return false;
		}else if($("input[name='phone2']").val()=="") {
			alert("휴대전화는 필수 입력 항목입니다");
			$("input[name='phone2']").focus();
			return false;
		}else if(!phoneCheck($("input[name='phone2']").val())) {
			alert("휴대전화는 3,4자리로 입력해주세요");
			$("input[name='phone2']").focus();
			return false;
		}else if($("input[name='phone3']").val()=="") {
			alert("휴대전화는 필수 입력 항목입니다");
			$("input[name='phone3']").focus();
			return false;
		}else if(!phoneCheck($("input[name='phone3']").val())) {
			alert("휴대전화는 3,4자리로 입력해주세요");
			$("input[name='phone3']").focus();
			return false;
		}else if($("#agreement:checked").length!=3) {
			alert("약간 동의를 체크해주세요");
			$("#agreement").focus();
			return false;
		}else {
			joinForm.submit();
			location.href="../main/index.html";
		}
			
		
	});
/*************************************************************************
						input null값 확인
*************************************************************************/
	function idCheck(asValue){
		var regex = /[^0-9]/g;
		
		return regex.test(asValue);
	}
	
	function idCheck1(asValue) {
		var regex1 = /[a-zA-Z]{5,10}/g;
		
		return regex1.test(asValue);
	}
	
	function pwdCheck(asValue) {
		var regex = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$/g;
		
		return regex.test(asValue);
	}
	
	function nameCheck(asValue) {
		var regex =  /^[가-힣]{2,4}$/;
		
		return regex.test(asValue);
	}
	
	function phoneCheck(asValue) {
		var regex = /^\d{3,4}$/;
		
		return regex.test(asValue);
	}
	
	
	$("input[name='id']").blur(function(){
		if($("input[name='id']").val()==""){
			$("#idMsg").text("필수항목입니다").css("color","red").css("font-size","11px").css("display","block");
		}else {
			if(!idCheck($("input[name='id']").val())) {
				$("#idMsg").text("영문부터 5글자 이상으로 작성해주세요").css("color","red").css("font-size","11px").css("display","block");
			}else if(!idCheck1($("input[name='id']").val())){
				$("#idMsg").text("5글자 이상으로 작성해주세요").css("color","red").css("font-size","11px").css("display","block");
			}else {
				$("#idMsg").css("display","none");
			}
		}
	});
	
	
	
	$("input[name='pwd']").blur(function(){
		if($("input[name='pwd']").val()=="") {
			$("#pwdMsg").text("필수항목입니다").css("color","red").css("font-size","11px").css("display","block");
		}else {
			if(!pwdCheck($("input[name='pwd']").val())) {
				$("#pwdMsg").text("올바른 비밀번호 형식이 아닙니다").css("color","red").css("font-size","11px").css("display","block");
			}else {
				$("#pwdMsg").css("display","none");
			}
		}
	});
	
	
	$("input[name='pwd-check']").blur(function(){
		
		if($("input[name='pwd-check']").val()=="") {
			
			$("#pwdMsg-check").text("필수항목입니다").css("color","red").css("font-size","11px").css("display","block");
			
		}else if($("input[name='pwd']").val()!="" && $("input[name='pwd-check']").val()!="") {
			
			if($("input[name='pwd']").val() == $("input[name='pwd-check']").val()){
				$("#pwdMsg-check").text("비밀번호가 서로 동일합니다").css("color","blue").css("font-size","11px").css("display","block");
			}else {
				$("#pwdMsg-check").text("비밀번호가 서로 동일하지 않습니다").css("color","red").css("font-size","11px").css("display","block");
			}
		} 
		
	});
	
	$("input[name='name']").blur(function(){
		if($("input[name='name']").val()=="") {
			$("#nameMsg").text("필수항목입니다").css("color","red").css("font-size","11px").css("display","block");
		}else {
			if(!nameCheck($("input[name='name']").val())) {
				$("#nameMsg").text("올바른 이름 형식이 아닙니다").css("color","red").css("font-size","11px").css("display","block");
			}else {
				$("#nameMsg").css("display","none");
			}
		}
	});
	
	$("input[name='email1']").blur(function(){
		if($("input[name='email1']").val()==""){
			$("#emailMsg").text("필수항목입니다").css("color","red").css("font-size","11px").css("display","block");
		}else{
			$("#emailMsg").css("display","none");
		}
	});
	
	$("input[name='phone3']").blur(function(){
		if($("#selectbox-mobile").val()=="default" || $("#selectbox-phone").val()=="default" || $("#input-phone").val()=="" || $("input[name='phone3']").val()=="") {
			$("#phoneMsg").text("필수항목입니다").css("color","red").css("font-size","11px").css("display","block");
		}else {
			$("#phoneMsg").css("display","none");
		}
	});
	
	
/*************************************************************************
						이메일 선택 시 input창 자동 입력
*************************************************************************/
	$("#selectbox-email").change(function(){
		
		if($("#selectbox-email").val()=="default") {
			$("#emailMsg").text("이메일을 선택해주세요").css("color","red").css("font-size","11px").css("display","block");
			$("#selectbox-email").focus();
			return false;
		}else if($("#selectbox-email").val()=="self") {
			$("input[name='email2']").val("").focus();
		}else {
			$("input[name='email2']").val($("#selectbox-email").val());
		}
	});
	
/*************************************************************************
							주소 찾기
*************************************************************************/
	$("#address-btn-style").click(function(){
		 new daum.Postcode({
		        oncomplete: function(data) {
		        	$("input[name='address1']").val("("+data.zonecode+") "+data.address);
		        	$("input[name='address2']").focus();
		        }
		    }).open();
	});
/*************************************************************************
					이용약관 & 개인정보 수집 팝업창
*************************************************************************/
	$("#agreement-link").click(function(){
		
		window.open("http://localhost:9000/cmjgames/agreement.html","이용약관","width=600,height=400,scrollbars=yes");
		
	});
	
	$("#agreement-link-1").click(function(){
		
		window.open("http://localhost:9000/cmjgames/agreement-1.html","개인정보수집","width=600,height=400,scrollbars=yes");
		
	});
/*************************************************************************
				비밀번호  누르면 비밀번호 보이기
*************************************************************************/
	$("#pwd-check-img").change(function(){

		if($("#pwd-check-img").is(":checked") == false) {
			$("input[name='pwd']").attr("type","password");
		}else if($("#pwd-check-img").is(":checked") == true) {
			$("input[name='pwd']").attr("type","text");
		}
		
	});
	
	$("#pwd-check-img-1").change(function(){

		if($("#pwd-check-img-1").is(":checked") == false) {
			$("input[name='pwd-check']").attr("type","password");
		}else if($("#pwd-check-img-1").is(":checked") == true) {
			$("input[name='pwd-check']").attr("type","text");
		}
		
	});
	
	
	
/*************************************************************************
								전체 동의
*************************************************************************/
	$("#chk-circle").click(function(){
		if($("#chk-circle").is(":checked"))
			$("input[name='chk-agree']").prop("checked",true);
		else
			$("input[name='chk-agree']").prop("checked",false);
	});
/*************************************************************************
	
*************************************************************************/
/*************************************************************************
	
*************************************************************************/
/*************************************************************************
	
*************************************************************************/
/*************************************************************************
	
*************************************************************************/
/*************************************************************************
	
*************************************************************************/
/*************************************************************************
	
*************************************************************************/
/*************************************************************************
	
*************************************************************************/
/*************************************************************************
	
*************************************************************************/
/*************************************************************************
	
*************************************************************************/
/*************************************************************************
	
*************************************************************************/
/*************************************************************************
	
*************************************************************************/
/*************************************************************************
	
*************************************************************************/
/*************************************************************************
	
*************************************************************************/
/*************************************************************************
	
*************************************************************************/
});