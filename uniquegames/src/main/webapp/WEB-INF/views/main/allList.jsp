<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Unique Games</title>
    <link rel="stylesheet" href="http://localhost:9000/uniquegames/css/mainunigames.css">
</head>
	<style>
		#gList {
			margin:0px 5px 40px 5px;
		}
	</style>
<body>
    <jsp:include page="header.jsp"></jsp:include>
    <section id="top-bg">
		<div id="base-layer">
			<div id="top-bg-textarea">
				<p id="top-title">All List</p>
				<p id="top-subtitle">#전체 게임목록</p>
			</div>
		</div>
	</section>
    <section id="menu-main2">
        <div id="menu-allList">
            <div id="gameList">
            <c:forEach var="game" items="${gameVo}">
                <div id="gList">
                    <img src="${game.image_path } " width="260px" height="180px">
                    <ul>
                        <li>${game.name }</li>
                        <li>${game.game_genre}</li>
                        <li><button id="btn-like-style" type="button"></button></li>
                        <li>${game.like_cnt}</li>
                        <li><img src="/uniquegames/images/img_icon_rPc.png"></li>
                    </ul>
                </div>
            </c:forEach>
            </div>
               <!--  <div id="gList">
                    <img src="http://localhost:9000/uniquegames/images/img_game_thumbnail_1_260180.png" width="260px" height="180px">
                    <ul>
                        <li>New Game of Music</li>
                        <li>Action RPG</li>
                        <li><button id="btn-like-style" type="button"></button></li>
                        <li>number</li>
                        <li><img src="http://localhost:9000/uniquegames/images/img_icon_rPc.png"></li>
                    </ul>
                </div>
                <div id="gList">
                    <img src="http://localhost:9000/uniquegames/images/img_game_thumbnail_1_260180.png" width="260px" height="180px">
                    <ul>
                        <li>New Game of Music</li>
                        <li>Action RPG</li>
                        <li><button id="btn-like-style" type="button"></button></li>
                        <li>number</li>
                        <li><img src="http://localhost:9000/uniquegames/images/img_icon_rPc.png"></li>
                    </ul>
                </div>
                <div id="gList">
                    <img src="http://localhost:9000/uniquegames/images/img_game_thumbnail_1_260180.png" width="260px" height="180px">
                    <ul>
                        <li>New Game of Music</li>
                        <li>Action RPG</li>
                        <li><button id="btn-like-style" type="button"></button></li>
                        <li>number</li>
                        <li><img src="http://localhost:9000/uniquegames/images/img_icon_rPc.png"></li>
                    </ul>
                </div>
                <div id="gList">
                    <img src="http://localhost:9000/uniquegames/images/img_game_thumbnail_1_260180.png" width="260px" height="180px">
                    <ul>
                        <li>New Game of Music</li>
                        <li>Action RPG</li>
                        <li><button id="btn-like-style" type="button"></button></li>
                        <li>number</li>
                        <li><img src="http://localhost:9000/uniquegames/images/img_icon_rPc.png"></li>
                    </ul>
                </div>
            </div>
            <div id="gameList">
                <div id="gList">
                    <img src="http://localhost:9000/uniquegames/images/img_game_thumbnail_1_260180.png" width="260px" height="180px">
                    <ul>
                        <li>New Game of Music</li>
                        <li>Action RPG</li>
                        <li><button id="btn-like-style" type="button"></button></li>
                        <li>number</li>
                        <li><img src="http://localhost:9000/uniquegames/images/img_icon_rPc.png"></li>
                    </ul>
                </div>
                <div id="gList">
                    <img src="http://localhost:9000/uniquegames/images/img_game_thumbnail_1_260180.png" width="260px" height="180px">
                    <ul>
                        <li>New Game of Music</li>
                        <li>Action RPG</li>
                        <li><button id="btn-like-style" type="button"></button></li>
                        <li>number</li>
                        <li><img src="http://localhost:9000/uniquegames/images/img_icon_rPc.png"></li>
                    </ul>
                </div>
                <div id="gList">
                    <img src="http://localhost:9000/uniquegames/images/img_game_thumbnail_1_260180.png" width="260px" height="180px">
                    <ul>
                        <li>New Game of Music</li>
                        <li>Action RPG</li>
                        <li><button id="btn-like-style" type="button"></button></li>
                        <li>number</li>
                        <li><img src="http://localhost:9000/uniquegames/images/img_icon_rPc.png"></li>
                    </ul>
                </div>
                <div id="gList">
                    <img src="http://localhost:9000/uniquegames/images/img_game_thumbnail_1_260180.png" width="260px" height="180px">
                    <ul>
                        <li>New Game of Music</li>
                        <li>Action RPG</li>
                        <li><button id="btn-like-style" type="button"></button></li>
                        <li>number</li>
                        <li><img src="http://localhost:9000/uniquegames/images/img_icon_rPc.png"></li>
                    </ul>
                </div>
            </div>
            <div id="gameList">
                <div id="gList">
                    <img src="http://localhost:9000/uniquegames/images/img_game_thumbnail_1_260180.png" width="260px" height="180px">
                    <ul>
                        <li>New Game of Music</li>
                        <li>Action RPG</li>
                        <li><button id="btn-like-style" type="button"></button></li>
                        <li>number</li>
                        <li><img src="http://localhost:9000/uniquegames/images/img_icon_rPc.png"></li>
                    </ul>
                </div>
                <div id="gList">
                    <img src="http://localhost:9000/uniquegames/images/img_game_thumbnail_1_260180.png" width="260px" height="180px">
                    <ul>
                        <li>New Game of Music</li>
                        <li>Action RPG</li>
                        <li><button id="btn-like-style" type="button"></button></li>
                        <li>number</li>
                        <li><img src="http://localhost:9000/uniquegames/images/img_icon_rPc.png"></li>
                    </ul>
                </div>
                <div id="gList">
                    <img src="http://localhost:9000/uniquegames/images/img_game_thumbnail_1_260180.png" width="260px" height="180px">
                    <ul>
                        <li>New Game of Music</li>
                        <li>Action RPG</li>
                        <li><button id="btn-like-style" type="button"></button></li>
                        <li>number</li>
                        <li><img src="http://localhost:9000/uniquegames/images/img_icon_rPc.png"></li>
                    </ul>
                </div>
                <div id="gList">
                    <img src="http://localhost:9000/uniquegames/images/img_game_thumbnail_1_260180.png" width="260px" height="180px">
                    <ul>
                        <li>New Game of Music</li>
                        <li>Action RPG</li>
                        <li><button id="btn-like-style" type="button"></button></li>
                        <li>number</li>
                        <li><img src="http://localhost:9000/uniquegames/images/img_icon_rPc.png"></li>
                    </ul>
                </div>
            </div>
            <div id="gameList">
                <div id="gList">
                    <img src="http://localhost:9000/uniquegames/images/img_game_thumbnail_1_260180.png" width="260px" height="180px">
                    <ul>
                        <li>New Game of Music</li>
                        <li>Action RPG</li>
                        <li><button id="btn-like-style" type="button"></button></li>
                        <li>number</li>
                        <li><img src="http://localhost:9000/uniquegames/images/img_icon_rPc.png"></li>
                    </ul>
                </div>
                <div id="gList">
                    <img src="http://localhost:9000/uniquegames/images/img_game_thumbnail_1_260180.png" width="260px" height="180px">
                    <ul>
                        <li>New Game of Music</li>
                        <li>Action RPG</li>
                        <li><button id="btn-like-style" type="button"></button></li>
                        <li>number</li>
                        <li><img src="http://localhost:9000/uniquegames/images/img_icon_rPc.png"></li>
                    </ul>
                </div>
                <div id="gList">
                    <img src="http://localhost:9000/uniquegames/images/img_game_thumbnail_1_260180.png" width="260px" height="180px">
                    <ul>
                        <li>New Game of Music</li>
                        <li>Action RPG</li>
                        <li><button id="btn-like-style" type="button"></button></li>
                        <li>number</li>
                        <li><img src="http://localhost:9000/uniquegames/images/img_icon_rPc.png"></li>
                    </ul>
                </div>
                <div id="gList">
                    <img src="http://localhost:9000/uniquegames/images/img_game_thumbnail_1_260180.png" width="260px" height="180px">
                    <ul>
                        <li>New Game of Music</li>
                        <li>Action RPG</li>
                        <li><button id="btn-like-style" type="button"></button></li>
                        <li>number</li>
                        <li><img src="http://localhost:9000/uniquegames/images/img_icon_rPc.png"></li>
                    </ul>
                </div>
            </div>
            <div id="gameList">
                <div id="gList">
                    <img src="http://localhost:9000/uniquegames/images/img_game_thumbnail_1_260180.png" width="260px" height="180px">
                    <ul>
                        <li>New Game of Music</li>
                        <li>Action RPG</li>
                        <li><button id="btn-like-style" type="button"></button></li>
                        <li>number</li>
                        <li><img src="http://localhost:9000/uniquegames/images/img_icon_rPc.png"></li>
                    </ul>
                </div>
                <div id="gList">
                    <img src="http://localhost:9000/uniquegames/images/img_game_thumbnail_1_260180.png" width="260px" height="180px">
                    <ul>
                        <li>New Game of Music</li>
                        <li>Action RPG</li>
                        <li><button id="btn-like-style" type="button"></button></li>
                        <li>number</li>
                        <li><img src="http://localhost:9000/uniquegames/images/img_icon_rPc.png"></li>
                    </ul>
                </div>
                <div id="gList">
                    <img src="http://localhost:9000/uniquegames/images/img_game_thumbnail_1_260180.png" width="260px" height="180px">
                    <ul>
                        <li>New Game of Music</li>
                        <li>Action RPG</li>
                        <li><button id="btn-like-style" type="button"></button></li>
                        <li>number</li>
                        <li><img src="http://localhost:9000/uniquegames/images/img_icon_rPc.png"></li>
                    </ul>
                </div>
                <div id="gList">
                    <img src="http://localhost:9000/uniquegames/images/img_game_thumbnail_1_260180.png" width="260px" height="180px">
                    <ul>
                        <li>New Game of Music</li>
                        <li>Action RPG</li>
                        <li><button id="btn-like-style" type="button"></button></li>
                        <li>number</li>
                        <li><img src="http://localhost:9000/uniquegames/images/img_icon_rPc.png"></li>
                    </ul>
                </div>
            </div>
            <div id="gameList">
                <div id="gList">
                    <img src="http://localhost:9000/uniquegames/images/img_game_thumbnail_1_260180.png" width="260px" height="180px">
                    <ul>
                        <li>New Game of Music</li>
                        <li>Action RPG</li>
                        <li><button id="btn-like-style" type="button"></button></li>
                        <li>number</li>
                        <li><img src="http://localhost:9000/uniquegames/images/img_icon_rPc.png"></li>
                    </ul>
                </div>
                <div id="gList">
                    <img src="http://localhost:9000/uniquegames/images/img_game_thumbnail_1_260180.png" width="260px" height="180px">
                    <ul>
                        <li>New Game of Music</li>
                        <li>Action RPG</li>
                        <li><button id="btn-like-style" type="button"></button></li>
                        <li>number</li>
                        <li><img src="http://localhost:9000/uniquegames/images/img_icon_rPc.png"></li>
                    </ul>
                </div>
                <div id="gList">
                    <img src="http://localhost:9000/uniquegames/images/img_game_thumbnail_1_260180.png" width="260px" height="180px">
                    <ul>
                        <li>New Game of Music</li>
                        <li>Action RPG</li>
                        <li><button id="btn-like-style" type="button"></button></li>
                        <li>number</li>
                        <li><img src="http://localhost:9000/uniquegames/images/img_icon_rPc.png"></li>
                    </ul>
                </div>
                <div id="gList">
                    <img src="http://localhost:9000/uniquegames/images/img_game_thumbnail_1_260180.png" width="260px" height="180px">
                    <ul>
                        <li>New Game of Music</li>
                        <li>Action RPG</li>
                        <li><button id="btn-like-style" type="button"></button></li>
                        <li>number</li>
                        <li><img src="http://localhost:9000/uniquegames/images/img_icon_rPc.png"></li>
                    </ul>
                </div>
            </div> -->
        </div>
    </section>
    <jsp:include page="footer.jsp"></jsp:include>
</body>
</html>