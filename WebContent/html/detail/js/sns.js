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

    go_Me2Day : function(){
      var param_body = encodeURIComponent($.sns_lib.summary +"\r" +$.sns_lib.url) ;
      var param_tag =  encodeURIComponent($.sns_lib.title);
      var href = "http://me2day.net/posts/new?new_post[body]=" + param_body + "&new_post[tags]" + param_tag;
      var a = window.open(href, 'Me2Day', '');
      if (a) { a.focus(); }
    },

    go_Cyworld : function(){
      var param_title = encodeURIComponent($.sns_lib.title);
      var param_url = encodeURIComponent($.sns_lib.url);
      var href = "http://csp.cyworld.com/bi/bi_recommend_pop_euc.php?title=" + param_title + "&url=" + param_url;
      var a = window.open(href, 'cyworld', 'width='+$.sns_lib.width+',height='+$.sns_lib.height+',left='+$.sns_lib.left+',top='+$.sns_lib.top+',scrollbars=0');
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