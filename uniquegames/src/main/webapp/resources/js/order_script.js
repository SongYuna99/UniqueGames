$(document).ready(function (){
	let method;
	/** cart **/
	// checkAll
    $("th #checkAll").change(function (){
        let isChecked = $(this).is(":checked");

        if(isChecked){
            $("td #checkOne").prop("checked", true);
        }
        else {
            $("td #checkOne").prop("checked", false);
        }
    });
	
	
	
	
	/** order **/
	// checkAll
    $("#div-agreement #checkAll").change(function (){
        let isChecked = $(this).is(":checked");

        if(isChecked){
            $("input:checkbox[name='agreement']").prop("checked", true);
        }
        else {
            $("input:checkbox[name='agreement']").prop("checked", false);
        }
    });
	
	// modal
    $("#div-agreement a").click(function (){
        $("#modal").show();
        
        if($(this).attr("id") == "detail1"){
        	$("#modal-content").html($("div.detail1").html());
        }
        else if($(this).attr("id") == "detail2"){
        	$("#modal-content").html($("div.detail2").html());
        }
        else if($(this).attr("id") == "detail3"){
        	$("#modal-content").html($("div.detail3").html());
        }
        else if($(this).attr("id") == "detail4"){
        	$("#modal-content").html($("div.detail4").html());
        }
    });
    
    // btn-modal
    $("#btn-modal").click(function() {
    	$("#modal").hide();
	});
    
    // btn-paymentMethod
    $("#div-method #btn-method").click(function() {
    	method = $(this).attr("value");

    	$("#div-method #btn-method").css("opacity", "40%");
    	$(this).css("opacity", "100%");
    });
    
    // btn-order
    $("#btn-order").click(function() {
    	if(method == ""){
    		alert("결제 방식을 선택해주세요.");
    	}
    	else{
    		const IMP = window.IMP; // 생략 가능
			IMP.init("imp15073643");
			
			IMP.request_pay({
				pg: "html5_inicis",
				pay_method: method,
				merchant_uid: "ug_order_song_0015",   // 주문번호
				name: "UniqueGames",
				amount: 1000,                         // 숫자 타입
				buyer_email: "thddbsk7248@gmail.com",
				buyer_name: "송유나",
				buyer_tel: "010-4242-4242",
				buyer_addr: "서울특별시 강남구 신사동",
				buyer_postcode: "01181"
				}, function (rsp) { // callback
					if(rsp.success){
						location.replace("order_complete.jsp");
					}
					else {
						alert("결제에 실패했습니다. 장바구니로 돌아갑니다. 1");
						location.replace("cart.jsp");
					}
			});
    	}
    	
	});
	
    
    
    
	/** order_complete **/
	
});