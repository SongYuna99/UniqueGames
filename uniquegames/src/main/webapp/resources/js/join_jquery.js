$(document).ready(function(){
/*************************************************************************
						회원가입 폼 체크
*************************************************************************/
	$("#button-gradient").click(function(){
		if($("input[name='id'").val()=="") {
			alert("아이디는 필수 입력 항목입니다");
			$("input[name='id'").focus();
			return false;
		}else if(!idCheck2($("input[name='id']").val())) {
			alert("아이디는 영문 또는 영문+숫자로 작성해주세요");
			$("input[name='id'").focus();
			return false;
		}else if(!idCheck3($("input[name='id']").val())) {
			alert("아이디는 5~10글자로 작성해주세요");
			$("input[name='id'").focus();
			return false;
		}else if($("input[name='password'").val()==""){
			alert("비밀번호는 필수 입력 항목입니다");
			$("input[name='password'").focus();
			return false;
		}else if(!pwdCheck($("input[name='password']").val())) {
			alert("비밀번호는 영문,숫자,특수문자 1글자 이상 조합하여 작성해주세요");
			$("input[name='password'").focus();
			return false;
		}else if($("input[name='password-check']").val()=="") {
			alert("비밀번호 확인칸을 입력해주세요");
			$("input[name='password-check']").focus();
			return false;
		}else if($("input[name='password']").val() != $("input[name='password-check']").val()){
			alert("비밀번호가 서로 동일하지 않습니다");
			$("input[name='password-check']").focus();
			return false;
		}else if($("input[name='name']").val()==""){
			alert("이름은 필수 입력 항목입니다");
			$("input[name='name']").focus();
			return false;
		}else if(!nameCheck($("input[name='name']").val())) {
			alert("이름은 한글로만 작성해주세요");
			$("input[name='name']").focus();
			return false;
		}else if($("#input-email").val()==""){
			alert("이메일은 필수 입력 항목입니다");
			$("input[name='email1']").focus();
			return false;
		}else if(!emailCheck($("#input-email").val())){
			alert("이메일은 영문+숫자로 입력해주세요");
			$("input[name='email1']").focus();
			return false;
		}else if($("input[name='email2']").val()=="" && $("#selectbox-email").val()=="default"){
			alert("이메일 주소를 전부 작성해주세요");
			$("input[name='email2']").focus();
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
			alert("휴대전화는 숫자 3,4자리로 입력해주세요");
			$("input[name='phone2']").focus();
			return false;
		}else if($("input[name='phone3']").val()=="") {
			alert("휴대전화는 필수 입력 항목입니다");
			$("input[name='phone3']").focus();
			return false;
		}else if(!phoneCheck($("input[name='phone3']").val())) {
			alert("휴대전화는 숫자 3,4자리로 입력해주세요");
			$("input[name='phone3']").focus();
			return false;
		}else if($("#checkbox-agreement:checked").length!=3) {
			alert("약간 동의를 체크해주세요");
			$("#agreement").focus();
			return false;
		}else {
			joinForm.submit();
		}
	});
/*************************************************************************
						input null값 확인
*************************************************************************/
	/*function idCheck1(asValue){
		var regex1 = /[^0-9]{5,10}/g;
		
		return regex1.test(asValue);
	}*/
	
	function idCheck2(asValue) {
		var regex2 = /^[a-zA-Z0-9]*$/;
		
		return regex2.test(asValue);
	}
	
	function idCheck3(asValue) {
		var regex3 = /^[a-zA-Z0-9]{5,10}$/;
		
		return regex3.test(asValue);
	}
	
	/*function idCheck4(asValue){//영어로 시작하고 숫자로 시작하면 안됨
		var regex4 = /^[A-Za-z]{1}[A-Za-z0-9]{3,19}$/;
		
		return regex4.test(asValue);
	}*/
	
	function pwdCheck(asValue) {
		var regex = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$/g;
		
		return regex.test(asValue);
	}
	
	function nameCheck(asValue) {
		var regex =  /^[가-힣]{2,4}$/;
		
		return regex.test(asValue);
	}
	
	function emailCheck(asValue){
		var regex = /^[A-za-z0-9]{4,12}$/;
		
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
			if(!idCheck2($("input[name='id']").val())){
				$("#idMsg").text("영문 또는 숫자로 작성해주세요").css("color","red").css("font-size","11px").css("display","block");
			}else if(!idCheck3($("input[name='id']").val())) {
				$("#idMsg").text("5~10자리로 작성해주세요").css("color","red").css("font-size","11px").css("display","block");
			}else {
				$("#idMsg").css("display","none");
			}
		}
	});
	
	
	
	$("input[name='password']").blur(function(){
		if($("input[name='password']").val()=="") {
			$("#pwdMsg").text("필수항목입니다").css("color","red").css("font-size","11px").css("display","block");
		}else {
			if(!pwdCheck($("input[name='password']").val())) {
				$("#pwdMsg").text("올바른 비밀번호 형식이 아닙니다").css("color","red").css("font-size","11px").css("display","block");
			}else {
				$("#pwdMsg").css("display","none");
			}
		}
	});
	
	
	$("input[name='password-check']").blur(function(){
		
		if($("input[name='password-check']").val()=="") {
			
			$("#pwdMsg-check").text("필수항목입니다").css("color","red").css("font-size","11px").css("display","block");
			
		}else if($("input[name='password']").val()!="" && $("input[name='password-check']").val()!="") {
			
			if($("input[name='password']").val() == $("input[name='password-check']").val()){
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
			
			if(!emailCheck($("input[name='email1']").val())){
				$("#emailMsg").text("이메일은 영문+숫자로 입력해주세요").css("color","red").css("font-size","11px").css("display","block");
			}else{
				$("#emailMsg").css("display","none");
			}
			
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
			$("input[name='email2']").val("");
			$("#emailMsg").text("이메일을 선택해주세요").css("color","red").css("font-size","11px").css("display","block");
			$("#selectbox-email").focus();
			return false;
		}else if($("#selectbox-email").val()=="direct") {
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
		        	$("input[name='addr1']").val("("+data.zonecode+") "+data.address);
		        	$("input[name='addr2']").focus();
		        }
		    }).open();
	});
/*************************************************************************
					이용약관 & 개인정보 수집 팝업창
*************************************************************************
	$("#agreement-link").click(function(){
		
		$("#modal.modal-overlay").css("display","flex");
		
	});
	
	$("#close-area").click(function(){
		
		$("#modal.modal-overlay").css("display","none");
		
	});
	
	$("#agreement-link-1").click(function(){
		
		window.open("http://localhost:9000/cmjgames/agreement-1.html","개인정보수집","width=600,height=400,scrollbars=yes");
		
	});
/*************************************************************************
				비밀번호  누르면 비밀번호 보이기
*************************************************************************/
	$("#pwd-check-img").change(function(){

		if($("#pwd-check-img").is(":checked") == false) {
			$("input[name='password']").attr("type","password");
		}else if($("#pwd-check-img").is(":checked") == true) {
			$("input[name='password']").attr("type","text");
		}
		
	});
	
	$("#pwd-check-img-1").change(function(){

		if($("#pwd-check-img-1").is(":checked") == false) {
			$("input[name='password-check']").attr("type","password");
		}else if($("#pwd-check-img-1").is(":checked") == true) {
			$("input[name='password-check']").attr("type","text");
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
							모달창
*************************************************************************/
/** Agreement **/
// Agreement
$("a").click(function(){
    $("#modal").show();
    
    if($(this).attr("id") == "detail1"){
    	$("#agreement-content").html($("div.detail1").html());
    }
    else if($(this).attr("id") == "detail2"){
    	$("#agreement-content").html($("div.detail2").html());
    }
});
	
	
// Agreement-btn
$("button[name='btn-agreement']").click(function() {
	$("#modal").hide();
});
/*************************************************************************
							아이디 중복체크
*************************************************************************/
$("#check-btn-style").click(function(){
		
		if($("#input-id").val()=="") {
			$("#idMsg").text("필수항목입니다").css("color","red").css("font-size","11px").css("display","block");
		}else {
			$.ajax({
				url : "id_check.do?id="+$("#input-id").val(),
				success : function(result) {
					if(result == 1){
							$("#idMsg").text("이미 사용중인 아이디 입니다. 다시 입력해주세요")
							.css("color","red").css("font-size","11px").css("display","block");
							
							$("#id").val("").focus();
						}else if(result == 0){
							$("#idMsg").text("사용 가능한 아이디 입니다")
							.css("color","blue").css("font-size","11px").css("display","block");
							$("input[name='password']").focus();
						}
					}
			});
		}


	});
	
/*************************************************************************
								회원탈퇴 모달창 보이기
*************************************************************************/
$("#button-gradient-delete").click(function(){
				
				if($("#input[name='password']").val()==""){
					$("#msgPwd").text("필수항목입니다").css("color","red").css("font-size","11px").css("display","block");
					//비밀번호 validation 만들기
				}else {
					$.ajax({
						url : "delete_check.do?member_id="+$("input[name='member_id']").val()+"&password="+$("input[name='password']").val(),
						success : function(result) {
							let jdata = JSON.parse(result);
							$("#modal2").show();
							$("#delete-member-id").html(jdata.jlist.member_id);
							$("#delete-id").html(jdata.jlist.member_id);
							$("#agreement-content1").html($(".deleteComplete").html());
							
													
						}
					});
				}

			});
			
/*************************************************************************
						모달창 닫고 메인으로 이동(모달창 버튼)
*************************************************************************/
$(document).on("click", "#button-gradient-home", function(event){
			$("#modal2").hide();
			location.href="http://localhost:9000/uniquegames/";
			});

/*************************************************************************
						아이디, 비밀번호 찾기 모달창 보이기
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