/* 이미지 클릭 스크립트*/
  $(document).ready(function(){
    $(".screenshot_thumbnail").bind("click",function(){
      var index = $(".screenshot_thumbnail").index(this);
      var content_type = $(".screenshot_thumbnail img").eq(index).attr("data-type");
      var content_url = $(".screenshot_thumbnail img").eq(index).attr("data-url");
      if(content_type=="image/png"){
        var html = content_url;
      }else{
        var html = content_url;
      }
      $('#screenshot_image').html(html);
      $(".screenshot_thumbnail").each(function(i){
        if(i==index){
          $(".screenshot_thumbnail").eq(i).addClass("active");
        }else{
          $(".screenshot_thumbnail").eq(i).removeClass("active");
        }
      });
      return;
    });
  });
  /* sns 스크립트 */
  (function($) {
    $.sns_lib = {
      width : null,
      height : null,
      top : (screen.width-1000)/2,
      left : (screen.height-600)/2,
      title : null,
      url : document.URL,
      img : null,
      summary : null,
      initialize : function(title,img,summary,popup_width,popup_height,url){
        $.sns_lib.title = title;
        $.sns_lib.img = img;
        $.sns_lib.summary = summary;
        $.sns_lib.width = popup_width;
        $.sns_lib.height = popup_height;
        $.sns_lib.url = url;
      },
      go_Facebook : function(){
        var param_title = encodeURIComponent($.sns_lib.title);
        var param_url = encodeURIComponent($.sns_lib.url);
        var param_img = encodeURIComponent($.sns_lib.img);
        var param_summary = encodeURIComponent($.sns_lib.summary);
        var sitePath = "http://www.facebook.com/sharer/sharer.php?s=100&u="+param_url+"&p[title]="+param_title+"&p[images][0]="+param_img+"&p[summary]="+param_summary;
        //var sitePath = "http://www.facebook.com/sharer.php?u="+param_url;
        var a = window.open(sitePath, 'Facebook', 'width='+$.sns_lib.width+',height='+$.sns_lib.height+',left='+$.sns_lib.left+',top='+$.sns_lib.top+',scrollbars=0');
        if(a) { a.focus(); }
      },
      go_Twitter : function(){
        var param_title = encodeURIComponent($.sns_lib.title + " \n" + $.sns_lib.summary);
        var param_url = encodeURIComponent($.sns_lib.url);
        var href = "http://twitter.com/share?_=&count=horizontal&original_referer="+param_url+"&text=" + param_title + "&url=" + param_url;
        var a = window.open(href, 'twitter', 'width='+$.sns_lib.width+',height='+$.sns_lib.height+',left='+$.sns_lib.left+',top='+$.sns_lib.top+',scrollbars=0');
        if(a) { a.focus(); }
      },
      destroy : function(){
        $.sns_lib.title = null;
        $.sns_lib.img = null;
        $.sns_lib.summary = null;
        $.sns_lib.width = null;
        $.sns_lib.height = null;
      },
      isNotReady : function(obj, msg){
        if(obj == null){
          alert(msg);
          return false;
        }else{
          return true;
        }
      }
    };
  })($);


  /*
  * ajax id전송
  * */
document.getElementById("btn_donate").addEventListener("click", function() {
  var data = this.getAttribute("data");

  var xhr = new XMLHttpRequest();
  xhr.open("GET", "/order?data=" + data , true);
  xhr.onreadystatechange = function() {
    if (xhr.readyState === 4 && xhr.status === 200) {
      // 요청이 성공적으로 완료된 후 처리할 로직을 구현합니다
      alert("전송 성공");
      console.log(xhr.responseText);
    }
  };
  xhr.send();
});

/* $(document).ready(function(){

//후원하기
$("#btn_donate").bind("click",function(){
  var goods_code = $("#btn_donate").attr("data");
  var asset_id = $("#btn_donate").attr("data-assetid");
  var prod_tp = $('#btn_donate').attr("data-prodtp");
  var m_id = "";
  var mode = "addCart";
  var formURL = "/order/cart_proc.php";
  var loading = $.loading();
  loading.open();

  if(m_id==""){
    alert("로그인을 하셔야 이용이 가능합니다.");
    loading.close();
    location.href="/member/v2/login.html";
    return false;
  }else{
    $.ajax({
      url : formURL,
      type: "POST",
      data : {goods_code:goods_code,mode:mode,asset_id:asset_id,prod_tp:prod_tp},
      success:function(data, textStatus, jqXHR){
        //alert(data);
        loading.close();

        $("#alert_msg").html(data);

        $( "#cart_popup" ).dialog({
          resizable: false,
          draggable: false,
          height: "auto",
          width: 400,
          modal: true,
          buttons: {
            "계속 쇼핑하기": function() {
              $( "#cart_popup" ).dialog('close');
            },
            '장바구니 이동': function() {
              location.href="/order/v3/cart.html";
            }
          }
        });
      },
      error: function(jqXHR, textStatus, errorThrown) {
        alert(jqXHR);
      }
    });
  }
});

document.querySelector("#btn_donate").addEventListener("click", function(){
var goods_code = document.querySelector("#btn_donate").getAttribute("data");
var asset_id = document.querySelector("#btn_donate").getAttribute("data-assetid");
var prod_tp = document.querySelector('#btn_donate').getAttribute("data-prodtp");
var m_id = "";
var mode = "addCart";
var formURL = "/order/cart_proc.php";
var loading = $.loading();
loading.open();
if(m_id==""){
alert("로그인을 하셔야 이용이 가능합니다.");
loading.close();
location.href="/member/v2/login.html";
return false;
}else{
var xhr = new XMLHttpRequest();
xhr.open("POST", formURL, true);
xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
xhr.onload = function() {
if (xhr.status === 200) {
loading.close();
var data = xhr.responseText;
document.querySelector("#alert_msg").innerHTML = data;

$( "#cart_popup" ).dialog({
resizable: false,
draggable: false,
height: "auto",
width: 400,
modal: true,
buttons: {
"계속 쇼핑하기": function() {
$( "#cart_popup" ).dialog('close');
},
'장바구니 이동': function() {
location.href="/order/v3/cart.html";
}
}
});
} else {
alert('오류 발생!');
}
};
xhr.onerror = function() {
alert('오류 발생!');
};
xhr.send("goods_code=" + goods_code + "&mode=" + mode + "&asset_id=" + asset_id + "&prod_tp=" + prod_tp);
}
});


//위시리스트
$("#btn_wishlist").bind("click",function(){
var goods_code = $("#btn_wishlist").attr("data");
var mode = "addWishlist";
var formURL = "/order/cart_proc.php";
var loading = $.loading();
var m_id = "";

if(m_id==""){
alert("로그인을 하셔야 이용이 가능합니다.");
loading.close();
location.href="/member/v2/login.html";
return false;
} else {
loading.open();
$.ajax({
url : formURL,
type: "POST",
data : {goods_code:goods_code,mode:mode},
success:function(data, textStatus, jqXHR){
//alert(data);
loading.close();
$("#alert_msg").html(data);
$("#alert .modal-title").text("위시리스트");
alert(data);
},
error: function(jqXHR, textStatus, errorThrown) {
alert(jqXHR);
}
});
}
});
});
*/

