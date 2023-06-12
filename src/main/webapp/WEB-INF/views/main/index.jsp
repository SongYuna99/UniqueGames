<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Unique Games</title>
    <link rel="stylesheet" href="http://localhost:9000/uniquegames/css/mainunigames.css">
    <link rel="stylesheet" href="https://unpkg.com/swiper@8/swiper-bundle.min.css" />
    <script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
    <!-- SWIPER 외부 라이브러리 연결-->
    <script>
        document.addEventListener('click', function (event) {
            // 클릭된 요소가 버튼인지 확인
            if (event.target.matches('#btn-like-style')) {
                var gameId = event.target.getAttribute('data-game-id');

                // AJAX 요청을 통해 서버에 좋아요 처리 요청 전송
                var xhr = new XMLHttpRequest();
                xhr.open('POST', '/uniquegames/like', true);
                xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
                xhr.onreadystatechange = function () {
                    if (xhr.readyState === 4 && xhr.status === 200) {
                        var response = JSON.parse(xhr.responseText);
                        alert(response.message);
                        // 좋아요 처리 후 추가적인 작업을 수행할 수 있습니다.
                    }
                };
                xhr.send('gameId=' + gameId);
            }
        });
    </script>
</head>
<body>
<!-- <iframe src="./header.html" scrolling="no" width="100%" height="228px" frameborder=0></iframe> -->
<jsp:include page="header.jsp"></jsp:include>
<div class="swiper">
    <div class="swiper-wrapper">
        <div class="swiper-slide">
            <div class="silde1">
                <div id="slide-text">
                    <h2>내 손안에서 깨어난 새로운 리듬</h2>
                    <h1>New Game of Music</h1>
                    <p>새로운 감각의 New RPG 뉴게임오브뮤직</p>
                    <a href="detail/detail1.do"><button id="btn-main-style" type="button" style='cursor:pointer'>자세히보기</button></a>
                </div>
            </div>
        </div>
        <div class="swiper-slide">
            <div class="silde2">
                <div id="slide-text">
                    <h2>지금까지 존재하지 않은 RPG</h2>
                    <h1>Dead Lift 550</h1>
                    <p>참고로 전 3대 605</p>
                    <a href="detail/detail2.do"><button id="btn-main-style" type="button" style='cursor:pointer'>자세히보기</button></a>
                </div>
            </div>
        </div>
        <div class="swiper-slide">
            <div class="silde3">
                <div id="slide-text">
                    <h2>모니터를 통해 보여주는 이세계의 모험</h2>
                    <h1>Morning Star Desert</h1>
                    <p>조선을 배경으로하는 사극 판타지 RPG</p>
                    <a href="detail/detail3.do"><button id="btn-main-style" type="button" style='cursor:pointer'>자세히보기</button></a>
                </div>
            </div>
        </div>
        <div class="swiper-slide">
            <div class="silde4">
                <div id="slide-text">
                    <h2>이 세상 게임이 아니다</h2>
                    <h1>Life Standing</h1>
                    <p>살기 위해 오늘도 길을 나선다 탐험 액션</p>
                    <a href="detail/detail4.do"><button id="btn-main-style" type="button"  style='cursor:pointer'>자세히보기</button></a>
                </div>
            </div>
        </div>
    </div>

    <div class="swiper-pagination"></div>

    <div class="swiper-button-prev">
        <button class="btn__prev"><img src="/uniquegames/images/btn_main-arrow_left.png"></button>
    </div>
    <div class="swiper-button-next">
        <button class="btn__next"><img src="/uniquegames/images/btn_main-arrow_right.png"></button>
    </div>
</div>
<img id="topGame-title" src="/uniquegames/images/imt_title_top.png" width="135px" height="32px">
<div id="menu-topGame">
    <div id="topGameList">
        <c:forEach var="game" items="${ranking }" varStatus="loop">
            <c:if test="${loop.count <= 4}">
                <div id="tList">
                    <img alt="#" src="${game.image_path }" width="500px" height="240px">
                    <div>
                        <p>${loop.count} </p>
                        <li><a href ='detail/${game.description}'>${game.name }</a> </li>
<%--                        <p>${game.description }</p>--%>
                        <a href="deteil.do?g_id=${game.id }"><button id="readmore-plus" type="button"><img src="/uniquegames/images/btn_plus_normal.png" width="30px" height="30px"></button><a>
                    </div>
                </div>
            </c:if>
        </c:forEach>
    </div>
</div>
<section id="menu-main1">
    <img id="recommendations-title" src="/uniquegames/images/img_title_recommendations.png" width="262px" height="26px">
    <p id="subTitle">#최근 반응이 좋은</p>
    <div id="menu-recommendations">
        <div id="recommendList">
            <c:forEach var="game" items="${donation}" varStatus="loop">
                <c:if test="${loop.index < 4}">
                    <div id="rList">
                        <img src="${game.image_path}" width="260px" height="180px">
                        <ul>
                            <li>Hot</li>
                            <li>${game.name}</li>
                            <li>${game.game_genre}</li>
                            <li><img src="/uniquegames/images/img_icon_rPc.png"></li>
                        </ul>
                        <div>
                            <a href="deteil.do?g_id=${game.id }">
                                <button id="btn-recommend-style" type="button">자세히보기</button>
                            </a>
                        </div>
                    </div>
                </c:if>
            </c:forEach>
        </div>
    </div>
</section>
<section id="menu-main2">
    <img id="allList-title" src="/uniquegames/images/img_title_AllList.png" width="100px" height="24px">
    <div id="menu-allList">
        <div id="gameList">
            <c:forEach var="game" items="${gameList}">
                <div id="gList">
                    <img src="${game.image_path } " width="260px" height="180px">
                    <ul>
                        <li><a href ='detail/${game.description}'>${game.name }</a> </li>>
                        <li>${game.game_genre}</li>
                        <li><button id="btn-like-style" type="button"data-game-id="${game.id}"></button></li>
                        <li>${game.like_count}</li>
                        <li><a href="deteil.do?g_id=${game.id }"><img src="/uniquegames/images/img_icon_rPc.png"></a></li>
                    </ul>
                </div>
            </c:forEach>
        </div>
    </div>
</section>
<section id="menu-main3">
    <img id="solution-title" src="/uniquegames/images/img_title_notice.png" width="90px" height="25px">
    <p id="subTitle">#공지사항 #필독</p>
    <div id="menu-solution">
        <table>
            <tr>
                <th>선택</th>
                <th>번호</th>
                <th>제목</th>
                <th>작성자</th>
                <th>작성일</th>
            </tr>
            <c:forEach var="noticeVo" items="${noticeList}">
                <tr>
                    <td><input type="checkbox" name="list" value="${noticeVo.post_id}"></td>
                    <td>${noticeVo.rno}</td>
                    <td><a href="notice_content.do?no=${noticeVo.post_id}">${noticeVo.title}</a></td>
                    <td>${noticeVo.company_id}</td>
                    <td>${noticeVo.date_output}</td>
                </tr>
            </c:forEach>
        </table>
        <div id="solution-btn-area">
            <a href="notice_list.do"><button id="btn-solution" type="button">자세히보기</button></a>
        </div>
    </div>
</section>
<!-- <iframe src="./footer.html" scrolling="no" width="100%" height="646px" frameborder=0></iframe> -->
<jsp:include page="footer.jsp"></jsp:include>
<script>
    new Swiper('.swiper', {
        autoplay: {
            delay: 4000
        },
        loop: true,
        slidesPerView: 1,
        spaceBetween: 0,
        // centeredSlides: true,
        pagination: {
            el: '.swiper-pagination',
            clickable: true
        },
        navigation: {
            prevEl: '.swiper-button-prev',
            nextEl: '.swiper-button-next'
        }
    })
</script>
</body>
</html>