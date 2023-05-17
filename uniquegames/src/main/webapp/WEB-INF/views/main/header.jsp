<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Unique Games</title>
    <link rel="stylesheet" type="text/css" href="http://localhost:9000/uniquegames/css/unigames.css">
</head>
<style>
#btn-hearder-search {
	border:solid red 1px;
	background-color: rgba( 255, 255, 255, 0 );
	display:block;
	width: 40px;
    padding: 4px 6px 4px 6px;
}
#input-search {
   	background-img : url('이미지 위치');
    background-repeat : no-repeat;
    backgroupd-size : 13px;
 }
 #search-menu {
 	display:none;
 }
</style>
<script>
$("document").ready(function() {
	$('#btn-hearder-search').click(function() {
		$('#search-menu').fadeToggle(1000);
	})
	
}
</script>
<body>
    <header>
    	<div id="search-menu">
    		<input id="input-search" type="text" placeholder="검색하실 게임 이름을 입력해주세요.">
    	</div>
        <div id="header-top-menu">
            <nav id="nav1">
                <ul>
                    <li><a href="../login/login.do">Login</a></li>
                    <li><a href="../join/join.do">Join</a></li>
                    <li><a href="../myPage/myPage.do"><img src="http://localhost:9000/uniquegames/images/img_icon_mypage.png"></a></li>
                    <li><a href="../order/cart.do"><img src="http://localhost:9000/uniquegames/images/img_icon_cart.png"></a></li>
                    <li><button id="btn-hearder-search"><img src="http://localhost:9000/uniquegames/images/img_icon_search.png"></button></li>
                </ul>
            </nav>
        </div>
        <div id="hearder-logo">
            <a href="http://localhost:9000/uniquegames/index.do" target="_parent">
                <img src="http://localhost:9000/uniquegames/images/img_title_logo.png">
            </a>
        </div>
        <div id="header-bottom-menu">
            <nav id="nav2">
                <ul>
                    <li><a href="http://localhost:9000/uniquegames/topgame.do">Top Game</a></li>
                    <li><a href="http://localhost:9000/uniquegames/alllist.do">All List</a></li>
                    <li><a href="#">Recommendations</a></li>
                    <li><a href="http://localhost:9000/uniquegames/solution_list.do">Solution</a></li>
                    <li><a href="http://localhost:9000/uniquegames/event_list.do">Event</a></li>
                    <li><a href="http://localhost:9000/uniquegames/notice_list.do">Notice</a></li>
                </ul>
            </nav>
        </div>
    </header>
</body>
</html>