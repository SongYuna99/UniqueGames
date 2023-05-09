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

});