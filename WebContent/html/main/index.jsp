<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Unique Games</title>
    <link rel="stylesheet" href="../../css/unigames.css">
    <link rel="stylesheet" href="https://unpkg.com/swiper@8/swiper-bundle.min.css" />
    <script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
    <!-- SWIPER 외부 라이브러리 연결-->

    <style>
      .container {
      margin-right: auto;
      margin-left: auto;
      padding-left: 16px;
      padding-right: 16px
    }

    .swiper {
      width: 100%;
      height: 660px;
      position: relative;
    }

    .swiper .swiper-slide {
      height: 100%;
      width: 100%;
      display: flex;
      justify-content: center;
    }

    .swiper-button-prev::after,
    .swiper-button-next::after{
      content: "";
      display: none;
    }
    .swiper-button-prev,
    .swiper-button-next {
      width: 30px;
      height: 30px;
      position: absolute;
      top: 300px;
      z-index: 1;
      cursor: pointer;
      display: flex;
      justify-content: center;
      align-items: center;
    }
    .swiper-button-prev {
      left: 10px;
    }
    .swiper-button-next {
      right: 10px;
    }
    .silde1, .silde2, .silde3, .silde4 {
      background-image: url(../../images/img_main_01.png);
      background-size: cover;
      width: 100%;
      height: 100%;
    }
    .silde2 {
      background-image: url(../../images/img_main_02.png);
    }
    .silde3 {
      background-image: url(../../images/img_main_03.png);
    }
    .silde4 {
      background-image: url(../../images/img_main_04.png);
    }
    .swiper-button-next button, .swiper-button-prev button {
      background-color: rgba( 255, 255, 255, 0 );
      border: none;
    }
    .swiper-button-next {
      margin-right: 300px;
    }
    .swiper-button-prev {
      margin-left: 300px;
    }
    #slide-text {
      margin-top: 150px;
    }
    .swiper-pagination-bullet {
      background-color: #ffffff;
    }
    </style>
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
                <a href="#"><button id="btn-main-style" type="button">자세히보기</button></a>
            </div>
            </div>
          </div>
          <div class="swiper-slide">
            <div class="silde2">
              <div id="slide-text">
                <h2>지금까지 존재하지 않은 RPG</h2>
                <h1>Dead Lift 550</h1>
                <p>참고로 전 3대 605</p>
                <a href="#"><button id="btn-main-style" type="button">자세히보기</button></a>
            </div>
            </div>
          </div>
          <div class="swiper-slide">
            <div class="silde3">
              <div id="slide-text">
                <h2>모니터를 통해 보여주는 이세계의 모험</h2>
                <h1>Morning Star Desert</h1>
                <p>조선을 배경으로하는 사극 판타지 RPG</p>
                <a href="#"><button id="btn-main-style" type="button">자세히보기</button></a>
            </div>
            </div>
          </div>
          <div class="swiper-slide">
            <div class="silde4">
              <div id="slide-text">
                <h2>이 세상 게임이 아니다</h2>
                <h1>Life Standing</h1>
                <p>살기 위해 오늘도 길을 나선다 탐험 액션</p>
                <a href="#"><button id="btn-main-style" type="button">자세히보기</button></a>
            </div>
            </div>
          </div>
        </div>
    
        <div class="swiper-pagination"></div>
    
        <div class="swiper-button-prev">
          <button class="btn__prev"><img src="../../images/btn_main-arrow_left.png"></button>
        </div>
        <div class="swiper-button-next">
          <button class="btn__next"><img src="../../images/btn_main-arrow_right.png"></button>
        </div>
      </div>
</div>
    <img id="topGame-title" src="../../images/imt_title_top.png" width="135px" height="32px">
    <div id="menu-topGame">
        <div id="topGameList">
            <div id="tList">
                <img alt="#" src="../../images/img_game_thumbnail_1_500240.png" width="500px" height="240px">
                <div>
                    <p>1</p>
                    <p>New Game of Music</p>
                    <p>새로운 감각의 New RPG 뉴게임오브뮤직</p>
                    <button id="readmore-plus" type="button"><img src="../../images/btn_plus_normal.png" width="30px" height="30px"></button>
                </div>
            </div>
            <div id="tList">
                <img alt="#" src="../../images/img_game_thumbnail_2_500240.png" width="500px" height="240px">
                <div>
                    <p>2</p>
                    <p>New Game of Music</p>
                    <p>새로운 감각의 New RPG 뉴게임오브뮤직</p>
                    <button id="readmore-plus" type="button"><img src="../../images/btn_plus_normal.png" width="30px" height="30px"></button>
                </div>
            </div>
            <div id="tList">
                <img alt="#" src="../../images/img_game_thumbnail_3_500240.png" width="500px" height="240px">
                <div>
                    <p>3</p>
                    <p>New Game of Music</p>
                    <p>새로운 감각의 New RPG 뉴게임오브뮤직</p>
                    <button id="readmore-plus" type="button"><img src="../../images/btn_plus_normal.png" width="30px" height="30px"></button>
                </div>
            </div>
        </div>
    </div>
    <section id="menu-main1">
        <img id="recommendations-title" src="../../images/img_title_recommendations.png" width="262px" height="26px">
        <p id="subTitle">#최근 반응이 좋은</p>
        <div id="menu-recommendations">
            <div id="recommendList">
                <div id="rList">
                    <img src="../../images/img_game_thumbnail_1_260180.png" width="260px" height="180px">
                    <ul>
                        <li>Hot</li>
                        <li>New Game of Music</li>
                        <li>Action RPG</li>
                        <li><img src="../../images/img_icon_rPc.png"></li>
                    </ul>
                    <div>
                        <button id="btn-recommend-style" type="button">자세히보기</button>
                    </div>
                </div>
                <div id="rList">
                    <img src="../../images/img_game_thumbnail_1_260180.png" width="260px" height="180px">
                    <ul>
                        <li>Hot</li>
                        <li>New Game of Music</li>
                        <li>Action RPG</li>
                        <li><img src="../../images/img_icon_rPc.png"></li>
                    </ul>
                    <div>
                        <button id="btn-recommend-style" type="button">자세히보기</button>
                    </div>
                </div>
                <div id="rList">
                    <img src="../../images/img_game_thumbnail_1_260180.png" width="260px" height="180px">
                    <ul>
                        <li>Hot</li>
                        <li>New Game of Music</li>
                        <li>Action RPG</li>
                        <li><img src="../../images/img_icon_rPc.png"></li>
                    </ul>
                    <div>
                        <button id="btn-recommend-style" type="button">자세히보기</button>
                    </div>
                </div>
                <div id="rList">
                    <img src="../../images/img_game_thumbnail_1_260180.png" width="260px" height="180px">
                    <ul>
                        <li>Hot</li>
                        <li>New Game of Music</li>
                        <li>Action RPG</li>
                        <li><img src="../../images/img_icon_rPc.png"></li>
                    </ul>
                    <div>
                        <button id="btn-recommend-style" type="button">자세히보기</button>
                    </div>
                </div>
            </div>
        </div>
        </section>
    <section id="menu-main2">
        <img id="allList-title" src="../../images/img_title_AllList.png" width="100px" height="24px">
        <div id="menu-allList">
            <div id="gameList">
                <div id="gList">
                    <img src="../../images/img_game_thumbnail_1_260180.png" width="260px" height="180px">
                    <ul>
                        <li>New Game of Music</li>
                        <li>Action RPG</li>
                        <li><button id="btn-like-style" type="button"></button></li>
                        <li>number</li>
                        <li><img src="../../images/img_icon_rPc.png"></li>
                    </ul>
                </div>
                <div id="gList">
                    <img src="../../images/img_game_thumbnail_1_260180.png" width="260px" height="180px">
                    <ul>
                        <li>New Game of Music</li>
                        <li>Action RPG</li>
                        <li><button id="btn-like-style" type="button"></button></li>
                        <li>number</li>
                        <li><img src="../../images/img_icon_rPc.png"></li>
                    </ul>
                </div>
                <div id="gList">
                    <img src="../../images/img_game_thumbnail_1_260180.png" width="260px" height="180px">
                    <ul>
                        <li>New Game of Music</li>
                        <li>Action RPG</li>
                        <li><button id="btn-like-style" type="button"></button></li>
                        <li>number</li>
                        <li><img src="../../images/img_icon_rPc.png"></li>
                    </ul>
                </div>
                <div id="gList">
                    <img src="../../images/img_game_thumbnail_1_260180.png" width="260px" height="180px">
                    <ul>
                        <li>New Game of Music</li>
                        <li>Action RPG</li>
                        <li><button id="btn-like-style" type="button"></button></li>
                        <li>number</li>
                        <li><img src="../../images/img_icon_rPc.png"></li>
                    </ul>
                </div>
            </div>
            <div id="gameList">
                <div id="gList">
                    <img src="../../images/img_game_thumbnail_1_260180.png" width="260px" height="180px">
                    <ul>
                        <li>New Game of Music</li>
                        <li>Action RPG</li>
                        <li><button id="btn-like-style" type="button"></button></li>
                        <li>number</li>
                        <li><img src="../../images/img_icon_rPc.png"></li>
                    </ul>
                </div>
                <div id="gList">
                    <img src="../../images/img_game_thumbnail_1_260180.png" width="260px" height="180px">
                    <ul>
                        <li>New Game of Music</li>
                        <li>Action RPG</li>
                        <li><button id="btn-like-style" type="button"></button></li>
                        <li>number</li>
                        <li><img src="../../images/img_icon_rPc.png"></li>
                    </ul>
                </div>
                <div id="gList">
                    <img src="../../images/img_game_thumbnail_1_260180.png" width="260px" height="180px">
                    <ul>
                        <li>New Game of Music</li>
                        <li>Action RPG</li>
                        <li><button id="btn-like-style" type="button"></button></li>
                        <li>number</li>
                        <li><img src="../../images/img_icon_rPc.png"></li>
                    </ul>
                </div>
                <div id="gList">
                    <img src="../../images/img_game_thumbnail_1_260180.png" width="260px" height="180px">
                    <ul>
                        <li>New Game of Music</li>
                        <li>Action RPG</li>
                        <li><button id="btn-like-style" type="button"></button></li>
                        <li>number</li>
                        <li><img src="../../images/img_icon_rPc.png"></li>
                    </ul>
                </div>
            </div>
            <div id="gameList">
                <div id="gList">
                    <img src="../../images/img_game_thumbnail_1_260180.png" width="260px" height="180px">
                    <ul>
                        <li>New Game of Music</li>
                        <li>Action RPG</li>
                        <li><button id="btn-like-style" type="button"></button></li>
                        <li>number</li>
                        <li><img src="../../images/img_icon_rPc.png"></li>
                    </ul>
                </div>
                <div id="gList">
                    <img src="../../images/img_game_thumbnail_1_260180.png" width="260px" height="180px">
                    <ul>
                        <li>New Game of Music</li>
                        <li>Action RPG</li>
                        <li><button id="btn-like-style" type="button"></button></li>
                        <li>number</li>
                        <li><img src="../../images/img_icon_rPc.png"></li>
                    </ul>
                </div>
                <div id="gList">
                    <img src="../../images/img_game_thumbnail_1_260180.png" width="260px" height="180px">
                    <ul>
                        <li>New Game of Music</li>
                        <li>Action RPG</li>
                        <li><button id="btn-like-style" type="button"></button></li>
                        <li>number</li>
                        <li><img src="../../images/img_icon_rPc.png"></li>
                    </ul>
                </div>
                <div id="gList">
                    <img src="../../images/img_game_thumbnail_1_260180.png" width="260px" height="180px">
                    <ul>
                        <li>New Game of Music</li>
                        <li>Action RPG</li>
                        <li><button id="btn-like-style" type="button"></button></li>
                        <li>number</li>
                        <li><img src="../../images/img_icon_rPc.png"></li>
                    </ul>
                </div>
            </div>
            <div id="gameList">
                <div id="gList">
                    <img src="../../images/img_game_thumbnail_1_260180.png" width="260px" height="180px">
                    <ul>
                        <li>New Game of Music</li>
                        <li>Action RPG</li>
                        <li><button id="btn-like-style" type="button"></button></li>
                        <li>number</li>
                        <li><img src="../../images/img_icon_rPc.png"></li>
                    </ul>
                </div>
                <div id="gList">
                    <img src="../../images/img_game_thumbnail_1_260180.png" width="260px" height="180px">
                    <ul>
                        <li>New Game of Music</li>
                        <li>Action RPG</li>
                        <li><button id="btn-like-style" type="button"></button></li>
                        <li>number</li>
                        <li><img src="../../images/img_icon_rPc.png"></li>
                    </ul>
                </div>
                <div id="gList">
                    <img src="../../images/img_game_thumbnail_1_260180.png" width="260px" height="180px">
                    <ul>
                        <li>New Game of Music</li>
                        <li>Action RPG</li>
                        <li><button id="btn-like-style" type="button"></button></li>
                        <li>number</li>
                        <li><img src="../../images/img_icon_rPc.png"></li>
                    </ul>
                </div>
                <div id="gList">
                    <img src="../../images/img_game_thumbnail_1_260180.png" width="260px" height="180px">
                    <ul>
                        <li>New Game of Music</li>
                        <li>Action RPG</li>
                        <li><button id="btn-like-style" type="button"></button></li>
                        <li>number</li>
                        <li><img src="../../images/img_icon_rPc.png"></li>
                    </ul>
                </div>
            </div>
            <div id="gameList">
                <div id="gList">
                    <img src="../../images/img_game_thumbnail_1_260180.png" width="260px" height="180px">
                    <ul>
                        <li>New Game of Music</li>
                        <li>Action RPG</li>
                        <li><button id="btn-like-style" type="button"></button></li>
                        <li>number</li>
                        <li><img src="../../images/img_icon_rPc.png"></li>
                    </ul>
                </div>
                <div id="gList">
                    <img src="../../images/img_game_thumbnail_1_260180.png" width="260px" height="180px">
                    <ul>
                        <li>New Game of Music</li>
                        <li>Action RPG</li>
                        <li><button id="btn-like-style" type="button"></button></li>
                        <li>number</li>
                        <li><img src="../../images/img_icon_rPc.png"></li>
                    </ul>
                </div>
                <div id="gList">
                    <img src="../../images/img_game_thumbnail_1_260180.png" width="260px" height="180px">
                    <ul>
                        <li>New Game of Music</li>
                        <li>Action RPG</li>
                        <li><button id="btn-like-style" type="button"></button></li>
                        <li>number</li>
                        <li><img src="../../images/img_icon_rPc.png"></li>
                    </ul>
                </div>
                <div id="gList">
                    <img src="../../images/img_game_thumbnail_1_260180.png" width="260px" height="180px">
                    <ul>
                        <li>New Game of Music</li>
                        <li>Action RPG</li>
                        <li><button id="btn-like-style" type="button"></button></li>
                        <li>number</li>
                        <li><img src="../../images/img_icon_rPc.png"></li>
                    </ul>
                </div>
            </div>
        </div>
    </section>
    <section id="menu-main3">
        <img id="solution-title" src="../../images/img_title_solution.png" width="120px" height="25px">
        <p id="subTitle">#도대체 어케 깸?</p>
        <div id="menu-solution">
            <table>
                <tr>
                    <th>선택</th>
                    <th>번호</th>
                    <th>제목</th>
                    <th>작성자</th>
                    <th>작성일</th>
                </tr>
                <tr>
                    <td><input type="checkbox"></td>
					<td>1</td>
					<td><a href="./board_content.html">아 제목인데 너무 길게 쓰지않고 적당한 길이로 대충 때울려고합니다~예~ 그럼요</a></td>
					<td>관리자</td>
					<td>2023.04.25</td>
                </tr>
                <tr>
                    <td><input type="checkbox"></td>
					<td>1</td>
					<td><a href="./board_content.html">아 제목인데 너무 길게 쓰지않고 적당한 길이로 대충 때울려고합니다~예~ 그럼요</a></td>
					<td>관리자</td>
					<td>2023.04.25</td>
                </tr>
                <tr>
                    <td><input type="checkbox"></td>
					<td>1</td>
					<td><a href="./board_content.html">아 제목인데 너무 길게 쓰지않고 적당한 길이로 대충 때울려고합니다~예~ 그럼요</a></td>
					<td>관리자</td>
					<td>2023.04.25</td>
                </tr>
                <tr>
                    <td><input type="checkbox"></td>
					<td>1</td>
					<td><a href="./board_content.html">아 제목인데 너무 길게 쓰지않고 적당한 길이로 대충 때울려고합니다~예~ 그럼요</a></td>
					<td>관리자</td>
					<td>2023.04.25</td>
                </tr>
            </table>
            <div id="solution-btn-area">
                <a href="#"><button id="btn-solution" type="button">자세히보기</button></a>
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