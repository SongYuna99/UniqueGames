$(document).ready(function (){
    // 회원 정보와 동일 체크박스
    $("input:checkbox[name='chk_info']").change(function (){
        let isChecked = $(this).is(":checked");

        if(isChecked){
            $("input:text[name='name']").prop("disabled", true);
            $("input:text[name='email1']").prop("disabled", true);
            $("input:text[name='email2']").prop("disabled", true);
            $("#email-select").prop("disabled", true);
            $("#email-select").val("default");
            $("input:text[name='phone1']").prop("disabled", true);
            $("input:text[name='phone2']").prop("disabled", true);
            $("input:text[name='phone3']").prop("disabled", true);
        }
        else {
            $("input:text[name='name']").prop("disabled", false);
            $("input:text[name='email1']").prop("disabled", false);
            $("input:text[name='email2']").prop("disabled", false);
            $("#email-select").prop("disabled", false);
            $("input:text[name='phone1']").prop("disabled", false);
            $("input:text[name='phone2']").prop("disabled", false);
            $("input:text[name='phone3']").prop("disabled", false);
        }
    });

    // 친구에게 선물하기
    $("input:checkbox[name='chk_present']").change(function (){
        let isChecked = $(this).is(":checked");

        if(isChecked){
            $("#div-present").css("display", "block");
        }
        else{
            $("#div-present").css("display", "none");
        }
    });
    
    // 친구에게 선물하기 - 검색버튼
    $("#order-btn-search").click(function() {
		if($("#friend-id").val() == ""){
			alert("선물받을 친구의 ID를 입력해주세요.");
			$("#friend-id").focus();
			return false;
		}
		else {
			
		}
	});

    // 전체동의
    $("input:checkbox[name='agreementAll']").change(function (){
        let isChecked = $(this).is(":checked");

        if(isChecked){
            $("input:checkbox[name='agreement']").prop("checked", true);
        }
        else {
            $("input:checkbox[name='agreement']").prop("checked", false);
        }
    });

    // 자세히
    $("a").click(function (){
        let id = $(this).attr("id");

        window.open("../agreement/"+id+".html", "_blank", "width=500, height=700, scrollbars=yes, resizable=no, fullscreen=no");
    });
    
    // 약관 팝업 확인 버튼 클릭 시 팝업 닫기
    $("button[name='btn-agreement']").click(function() {
		window.close();
	});
    
    // 이메일 주소 선택
    $("#email-select").on("change", function(){
		if($("#email-select").val() == "default"){
			alert("이메일을 선택해주세요");
			$("#email-addr").val("");
			$("#email-select").focus();
		}
		else if($("#email-select").val() == "self"){
			$("#email-addr").val("").focus();
		}
		else{
			$("#email-addr").val($("#email-select").val());
		}		
		
	}); 
    
    // 결제하기 ValidationCheck
    $("button[name='button-order']").click(function() {
    	if($('#name').val() == ''){
			alert('이름을 입력해주세요.');
			$('#name').focus();
			return false;
		}
    	else if($('#email-id').val() == ''){
			alert('이메일 아이디를 입력해주세요.');
			$('#email-id').focus();
			return false;
		}
    	else if($('#email-addr').val() == ''){
    		alert('이메일 주소를 입력해주세요.');
    		$('#email-addr').focus();
    		return false;
    	}
    	else if($('#phone1').val() == ''){
    		alert('휴대폰 번호를 입력해주세요.');
    		$('#phone1').focus();
    		return false;
    	}
    	else if($('#phone2').val() == ''){
    		alert('휴대폰 번호를 입력해주세요.');
    		$('#phone2').focus();
    		return false;
    	}
    	else if($('#phone3').val() == ''){
    		alert('휴대폰 번호를 입력해주세요.');
    		$('#phone3').focus();
    		return false;
    	}	
		else {
			// 서버전송
			joinForm.submit();
		}
	});

    // 장바구니 페이지 - 주문하기
    $("button[name='button-order']").click(function() {
    	alert("ddd");
		window.open("order.html", "_self");
	});
    
    // 주문 페이지 - 결제하기 버튼
    $("button[name='button-payment']").click(function() {
    	window.open("order_complete.html", "_self");
    });
    
    // 주문완료 페이지 - 메인으로 버튼
    $("button[name='button-goMain']").click(function() {
    	window.open("../main/index.html", "_self");
    });
});