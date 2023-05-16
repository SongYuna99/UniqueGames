<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0"/>
  <link rel="stylesheet" href="../../css/unigames.css">
  <title>제작사(팀) 소개</title>
  <!--css 초기화-->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">
  <!-- SWIPER 외부 라이브러리 연결-->
  <link rel="stylesheet" href="https://unpkg.com/swiper@8/swiper-bundle.min.css" />
  <script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>
  <!--google material icon 사용
  class="material-icons"-->
  <link rel="stylesheet" href="http://fonts.googleapis.com/icon?family=Material+Icons">

  <!--  bootstrap -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>

  <style>
    .container {
      margin-right: auto;
      margin-left: auto;
      padding-left: 16px;
      padding-right: 16px
    }

    .card h6{
      text-align: left;
      font: italic normal 900 18px Apex New;
    }
    .card-text{
      color: #6E6E6E;
    }

    .swiper {
      margin-top: 50px;
      margin-bottom: 50px;
      width: 1000px;
      height: 500px;
      position: relative;
    }

    .swiper .swiper-slide {
      height: 300px;
      width: 100%;
      display: flex;
      justify-content: center;
    }

    .material-icons {
      font-size: 30px;
      color: #A8A8A8;
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
      border: 2px solid rgba(136, 20, 20, 0.03);
      border-radius: 50%;
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
    a{
      text-decoration: none;
      color: white !important;
      font: normal normal normal 16px YouandiModern;
    }
    p{
      text-align: left;
      font: normal normal normal 16px YouandiModern;
      letter-spacing: 0px;
      opacity: 1;
      color: #000000;
    }
    #introduce{
      position: relative;
      letter-spacing: -1px;
      color: #000000;
      text-align: left;
    }
    body> header iframe, footer iframe {
      display: block;
    }
  </style>
</head>

<body style="padding: 0">
<header>
  <iframe src="../main/header.html" scrolling="no" width="100%" height="230px" frameborder=0></iframe>
</header>
<div class="container">
  <!--  제작팀 소개 -->
  <div  style="margin: 70px 20px 0 150px ">
    <div style="display: flex; align-items: center;">
      <img src="../../images/img_team_profile_big.png" alt="Crazy Game Dog 팀 로고" style="margin-right: 20px">
      <div id="introduce">
        <div  style="font: italic normal 900 28px Apex New;"> CGD(Crazy Game Dog) Team</div>
        <p> Game Delover Team</p>
        <p style="">재미있는 마법 이야기에 푹 빠져 사는 사람들이 모여서 미친 상상력에 개처럼 달려드는 사람들이 모인 팀<br>
          우리가 상상하는 모든것들을 게임으로 출시하는게 팀의 목적입니다.<br>
          쉽고 재밌게 게임을 즐기며 살자!!</p>
      </div>

    </div>



  </div>


  <!--  slider 시작 -->
  <div class="swiper">
    <p style=" text-align: center;"><img style="display: block;padding: 50px; margin: 0 auto" src="../../images/img_title_gameList.png"></p>
    <div class="swiper-wrapper">
      <div class="swiper-slide">
        <div class="card">
          <img src="../../images/img_game_thumbnail_3_500240.png" class="card-img-top" style="height: 150px; width: 234px">
          <div class="card-body">
            <img src="../../images/imt_title_top.png" style="height: 15px; margin-bottom: 5px">
            <h6 class="card-title">New Game of Music</h6>
            <p class="card-text">Action RPG</p>
          </div>
          <div class="card-footer" style="background: linear-gradient(to right,#682CAD,#2FC0CC);text-align: center;">
            <small class="text-muted" >
              <a href="detail.jsp" ><a href="detail.jsp" >자세히 보기</a></a>
            </small>
          </div>
        </div>
      </div>
      <div class="swiper-slide">
        <div class="card">
          <img src="../../images/img_game_thumbnail_2_500240.png" class="card-img-top" style="height: 150px; width: 234px">
          <div class="card-body">
            <img src="../../images/imt_title_top.png" style="height: 15px; margin-bottom: 5px">
            <h6 class="card-title">New Game of Music</h6>
            <p class="card-text">Action RPG</p>
          </div>
          <div class="card-footer" style="background: linear-gradient(to right,#682CAD,#2FC0CC);text-align: center;">
            <small class="text-muted" ><a href="detail.jsp" >자세히 보기</a></small>
          </div>
        </div>
      </div>
      <div class="swiper-slide">
        <div class="card">
          <img src="../../images/img_game_thumbnail_1_260180.png" class="card-img-top" style="height: 150px; width: 234px">
          <div class="card-body">
            <img src="../../images/imt_title_top.png" style="height: 15px; margin-bottom: 5px">
            <h6 class="card-title">New Game of Music</h6>
            <p class="card-text">Action RPG</p>
          </div>
          <div class="card-footer" style="background: linear-gradient(to right,#682CAD,#2FC0CC);text-align: center;">
            <small class="text-muted" ><a href="detail.jsp" >자세히 보기</a></small>
          </div>
        </div>
      </div>
      <div class="swiper-slide">
        <div class="card">
          <img src="../../images/img_game_thumbnail_3_260180.png" class="card-img-top" style="height: 150px; width: 234px">
          <div class="card-body">
            <img src="../../images/imt_title_top.png" style="height: 15px; margin-bottom: 5px">
            <h6 class="card-title">New Game of Music</h6>
            <p class="card-text">Action RPG</p>
          </div>
          <div class="card-footer" style="background: linear-gradient(to right,#682CAD,#2FC0CC);text-align: center;">
            <small class="text-muted" ><a href="detail.jsp" >자세히 보기</a></small>
          </div>
        </div>
      </div>
      <div class="swiper-slide">
        <div class="card">
          <img src="../../images/img_game_thumbnail_4_260180.png" class="card-img-top" style="height: 150px; width: 234px">
          <div class="card-body">
            <img src="../../images/imt_title_top.png" style="height: 15px; margin-bottom: 5px">
            <h6 class="card-title">New Game of Music</h6>
            <p class="card-text">Action RPG</p>
          </div>
          <div class="card-footer" style="background: linear-gradient(to right,#682CAD,#2FC0CC);text-align: center;">
            <small class="text-muted" ><a href="detail.jsp" >자세히 보기</a></small>
          </div>
        </div>
      </div>
      <div class="swiper-slide">
        <div class="card">
          <img src="../../images/img_game_thumbnail_2_260180.png" class="card-img-top" style="height: 150px; width: 234px">
          <div class="card-body">
            <img src="../../images/imt_title_top.png" style="height: 15px; margin-bottom: 5px">
            <h6 class="card-title">New Game of Music</h6>
            <p class="card-text">Action RPG</p>
          </div>
          <div class="card-footer" style="background: linear-gradient(to right,#682CAD,#2FC0CC);text-align: center;">
            <small class="text-muted" ><a href="detail.jsp" >자세히 보기</a></small>
          </div>
        </div>
      </div>
    </div>

    <div class="swiper-pagination"></div>

    <!--    <div class="swiper-button-prev">-->
    <!--      <div class="material-icons">arrow_back</div>-->
    <!--    </div>-->
    <!--    <div class="swiper-button-next">-->
    <!--      <div class="material-icons">arrow_forward</div>-->
    <!--    </div>-->
  </div>
  <!--  slider 끝-->

  <!--  공지사항-->
  <p style=" text-align: center;"><img style="display: block; margin: 0 auto;padding-top: 50px" src="../../images/img_title_notice.png"></p>
  <div id="content" style="margin-top: 60px; margin-bottom: -80px">
    <div id="board-list">
      <div id="board-top-menu">
        <p>Notice</p>
        <div id="bsearch-box">
          <label for="">
            <input type="text" name="search" placeholder="검색어를 입력해주세요.">
            <button type="button" id="btn-search"><img src="../../images/btn_boardSearch_press.png" alt=""></button>
          </label>
        </div>
        <div id="clearFix"></div>
      </div>
      <table id="user-btable">
        <tr>
          <th>번호</th>
          <th>제목</th>
          <th>작성자</th>
          <th>작성일</th>
        </tr>
        <tr>
          <td>1</td>
          <td><a href="../../notice/notice_content.html">아 제목인데 너무 길게 쓰지않고 적당한 길이로 대충 때울려고합니다~예~ 그럼요</a></td>
          <td>관리자</td>
          <td>2023.04.25</td>
        </tr>
        <tr>
          <td>2</td>
          <td>아 제목인데 너무 길게 쓰지않고 적당한 길이로 대충 때울려고합니다~예~ 그럼요</td>
          <td>관리자</td>
          <td>2023.04.25</td>
        </tr>
        <tr>
          <td>3</td>
          <td>아 제목인데 너무 길게 쓰지않고 적당한 길이로 대충 때울려고합니다~예~ 그럼요</td>
          <td>관리자</td>
          <td>2023.04.25</td>
        </tr>
        <tr>
          <td>4</td>
          <td>아 제목인데 너무 길게 쓰지않고 적당한 길이로 대충 때울려고합니다~예~ 그럼요</td>
          <td>관리자</td>
          <td>2023.04.25</td>
        </tr>
        <tr>
          <td>5</td>
          <td>아 제목인데 너무 길게 쓰지않고 적당한 길이로 대충 때울려고합니다~예~ 그럼요</td>
          <td>관리자</td>
          <td>2023.04.25</td>
        </tr>
        <tr>
          <td>6</td>
          <td>아 제목인데 너무 길게 쓰지않고 적당한 길이로 대충 때울려고합니다~예~ 그럼요</td>
          <td>관리자</td>
          <td>2023.04.25</td>
        </tr>
        <tr>
          <td>7</td>
          <td>아 제목인데 너무 길게 쓰지않고 적당한 길이로 대충 때울려고합니다~예~ 그럼요</td>
          <td>관리자</td>
          <td>2023.04.25</td>
        </tr>
        <tr>
          <td>8</td>
          <td>아 제목인데 너무 길게 쓰지않고 적당한 길이로 대충 때울려고합니다~예~ 그럼요</td>
          <td>관리자</td>
          <td>2023.04.25</td>
        </tr>
        <tr>
          <td>9</td>
          <td>아 제목인데 너무 길게 쓰지않고 적당한 길이로 대충 때울려고합니다~예~ 그럼요</td>
          <td>관리자</td>
          <td>2023.04.25</td>
        </tr>
        <tr>
          <td>10</td>
          <td>아 제목인데 너무 길게 쓰지않고 적당한 길이로 대충 때울려고합니다~예~ 그럼요</td>
          <td>관리자</td>
          <td>2023.04.25</td>
        </tr>
        <tr>
          <td colspan="5">
            <ul id="paging">
              <li><a href="#"><<</a></li>
              <li><a href="#"><</a></li>
              <li><a href="#">1</a></li>
              <li><a href="#">2</a></li>
              <li><a href="#">3</a></li>
              <li><a href="#">4</a></li>
              <li><a href="#">5</a></li>
              <li><a href="#">6</a></li>
              <li><a href="#">7</a></li>
              <li><a href="#">8</a></li>
              <li><a href="#">9</a></li>
              <li><a href="#">10</a></li>
              <li><a href="#">></a></li>
              <li><a href="#">>></a></li>
            </ul>
          </td>
        </tr>
      </table>
    </div>
  </div>
  <!--  공지사항 끝-->

  <!--  추천-->
  <div class="swiper">
    <p style=" text-align: center;"><img style="display: block;padding: 50px; margin: 0 auto" src="../../images/img_title_recommendations.png"></p>
    <div class="swiper-wrapper">
      <div class="swiper-slide">
        <div class="card">
          <img src="../../images/img_game_thumbnail_3_500240.png" class="card-img-top" style="height: 150px; width: 234px">
          <div class="card-body">
            <img src="../../images/imt_title_top.png" style="height: 15px; margin-bottom: 5px">
            <h6 class="card-title">New Game of Music</h6>
            <p class="card-text">Action RPG</p>
          </div>
          <div class="card-footer" style="background: linear-gradient(to right,#682CAD,#2FC0CC);text-align: center;">
            <small class="text-muted" >
              <a href="detail.jsp" ><a href="detail.jsp" >자세히 보기</a></a>
            </small>
          </div>
        </div>
      </div>
      <div class="swiper-slide">
        <div class="card">
          <img src="../../images/img_game_thumbnail_2_500240.png" class="card-img-top" style="height: 150px; width: 234px">
          <div class="card-body">
            <img src="../../images/imt_title_top.png" style="height: 15px; margin-bottom: 5px">
            <h6 class="card-title">New Game of Music</h6>
            <p class="card-text">Action RPG</p>
          </div>
          <div class="card-footer" style="background: linear-gradient(to right,#682CAD,#2FC0CC);text-align: center;">
            <small class="text-muted" ><a href="detail.jsp" >자세히 보기</a></small>
          </div>
        </div>
      </div>
      <div class="swiper-slide">
        <div class="card">
          <img src="../../images/img_game_thumbnail_1_260180.png" class="card-img-top" style="height: 150px; width: 234px">
          <div class="card-body">
            <img src="../../images/imt_title_top.png" style="height: 15px; margin-bottom: 5px">
            <h6 class="card-title">New Game of Music</h6>
            <p class="card-text">Action RPG</p>
          </div>
          <div class="card-footer" style="background: linear-gradient(to right,#682CAD,#2FC0CC);text-align: center;">
            <small class="text-muted" ><a href="detail.jsp" >자세히 보기</a></small>
          </div>
        </div>
      </div>
      <div class="swiper-slide">
        <div class="card">
          <img src="../../images/img_game_thumbnail_3_260180.png" class="card-img-top" style="height: 150px; width: 234px">
          <div class="card-body">
            <img src="../../images/imt_title_top.png" style="height: 15px; margin-bottom: 5px">
            <h6 class="card-title">New Game of Music</h6>
            <p class="card-text">Action RPG</p>
          </div>
          <div class="card-footer" style="background: linear-gradient(to right,#682CAD,#2FC0CC);text-align: center;">
            <small class="text-muted" ><a href="detail.jsp" >자세히 보기</a></small>
          </div>
        </div>
      </div>
      <div class="swiper-slide">
        <div class="card">
          <img src="../../images/img_game_thumbnail_4_260180.png" class="card-img-top" style="height: 150px; width: 234px">
          <div class="card-body">
            <img src="../../images/imt_title_top.png" style="height: 15px; margin-bottom: 5px">
            <h6 class="card-title">New Game of Music</h6>
            <p class="card-text">Action RPG</p>
          </div>
          <div class="card-footer" style="background: linear-gradient(to right,#682CAD,#2FC0CC);text-align: center;">
            <small class="text-muted" ><a href="detail.jsp" >자세히 보기</a></small>
          </div>
        </div>
      </div>
      <div class="swiper-slide">
        <div class="card">
          <img src="../../images/img_game_thumbnail_2_260180.png" class="card-img-top" style="height: 150px; width: 234px">
          <div class="card-body">
            <img src="../../images/imt_title_top.png" style="height: 15px; margin-bottom: 5px">
            <h6 class="card-title">New Game of Music</h6>
            <p class="card-text">Action RPG</p>
          </div>
          <div class="card-footer" style="background: linear-gradient(to right,#682CAD,#2FC0CC);text-align: center;">
            <small class="text-muted" ><a href="detail.jsp" >자세히 보기</a></small>
          </div>
        </div>
      </div>
    </div>

    <div class="swiper-pagination"></div>

    <!--    <div class="swiper-button-prev">-->
    <!--      <div class="material-icons">arrow_back</div>-->
    <!--    </div>-->
    <!--    <div class="swiper-button-next">-->
    <!--      <div class="material-icons">arrow_forward</div>-->
    <!--    </div>-->
  </div>
</div>


<!--  slider 스크립트-->
<script>
  new Swiper('.swiper', {
    autoplay: {
      delay: 4000
    },
    loop: true,
    slidesPerView: 4,
    spaceBetween: 20,
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

<footer>
  <iframe src="../main/footer.html" scrolling="no" height="630px" width="100%" frameborder=0></iframe>
</footer>
</body>

</html>