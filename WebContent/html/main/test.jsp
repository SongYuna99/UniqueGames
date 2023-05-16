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
            <h2>내 손안에서 깨어난 새로운 리듬</h2>
            <h1>New Game of Music</h1>
            <p>새로운 감각의 New RPG 뉴게임오브뮤직</p>
            <a href="#"><button id="btn-main-style" type="button">자세히보기</button></a>
        </div>
        </div>
      </div>
      <div class="swiper-slide">
        <div class="silde3">
          <div id="slide-text">
            <h2>내 손안에서 깨어난 새로운 리듬</h2>
            <h1>New Game of Music</h1>
            <p>새로운 감각의 New RPG 뉴게임오브뮤직</p>
            <a href="#"><button id="btn-main-style" type="button">자세히보기</button></a>
        </div>
        </div>
      </div>
      <div class="swiper-slide">
        <div class="silde4">
          <div id="slide-text">
            <h2>내 손안에서 깨어난 새로운 리듬</h2>
            <h1>New Game of Music</h1>
            <p>새로운 감각의 New RPG 뉴게임오브뮤직</p>
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