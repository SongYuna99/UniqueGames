$(document).ready(function(){

	$("#button-gradient").click(function(){
				
				if($("input[name='id']").val()=="") {
					alert("아이디를 입력해주세요");
					$("input[name='id']").focus();
					return false;
				}else if($("input[name='pwd']").val()=="") {
					alert("비밀번호를 입력해주세요");
					$("input[name='pwd']").focus();
					return false;
				}else{
					loginForm.submit();
				}
			});
			
			$("input[name='id']").blur(function(){
				
				if($("input[name='id']").val()=="") {
					$("#msgId").text("필수항목입니다").css("color","red").css("font-size","11px").css("display","block");
				}else {
					$("#msgId").css("display","none");
				}
				
			});
			
			$("input[name='pwd']").blur(function(){
				
				if($("input[name='pwd']").val()==""){
					$("#msgPwd").text("필수항목입니다").css("color","red").css("font-size","11px").css("display","block");
				}else {
					$("#msgPwd").css("display","none");
				}
			});		
});