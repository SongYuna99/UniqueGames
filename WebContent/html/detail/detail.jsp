<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko" dir="ltr" class='com_virtuemart view-productdetails itemid-167 mm-hover'>
<head>
  <title>개발사 후원페이지</title>
  <meta http-equiv="content-type" content="text/html; charset=utf-8" />
  <link rel="stylesheet" href="../../css/unigames.css">
  <script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.12.4.min.js"></script> <!-- 마이크로소프트 jQuery-->
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
  <meta name="apple-mobile-web-app-capable" content="YES"/>

  <style>

    #product-price {
      border-bottom: 1px solid rgba(255, 255, 255, 0.08);
      font-size: 18px !important;
      padding-bottom: 20px;
      text-align: left;
      border-top: 1px solid rgba(255,255,255,0.0);
      border-bottom: 0;
      float: none;
      padding-top: 20px;
      padding-bottom: 0
    }

    .detail-gallery {
      height: auto;
      overflow-x: scroll;
      overflow-y: hidden;
      display: -webkit-box;
      display: -webkit-flex;
      display: -ms-flexbox;
      display: flex;
      white-space: nowrap;
      margin-bottom: 0;
      margin-left:1px;
      background:none;
    }

    .gallery-wrapper{
      overflow:hidden;
    }

    .gallery{
      width: 784px;
      height: 107px;
      scroll-behavior: smooth;
      background:none;
    }

    .detail-gallery .item{
      position:relative;
      width:144px;
      height:81px;
      margin:8px;
      padding:0;
      text-align:center;
    }

    .detail-gallery .item:first-child{
      margin-left:0;
    }
    .input-inline {
      display: flex;
      justify-content: center;
    }
    .input-inline button:not(:last-child) {
      margin-right: 10px;
    }
    .detail-gallery .item img{
      width:144px;
      height:81px;
      margin:0;
      padding:0;
    }
    .detail-gallery .active{
      width:144px;
      height:81px;
      margin:8px;
      padding:0;
      text-align:center;
    }
    .donation-amount {
      display: flex;
      justify-content: space-between;
      align-items: center;
      margin-bottom: 13px;
      font-weight:bold;
    }

    .donation-amount .don-amount{
      color: #623BB0;
    }
    .detail-gallery .active img{
      margin:0;
      padding:0;
      border:2px solid #ffffff;
    }
    .vm-product-container{
      position:relative;
    }

    .vm-product-container .left{
      position:relative;
      float:left;
      width:768px;
      padding:0;
      margin-right:16px;
    }

    .vm-product-container .left .vm-product-media-container{
      position:relative;
      width:100%;
      padding:0;
      margin-bottom:20px;
    }

    .productdetails-view .vm-product-media-container .main-image{
      width:768px;
      min-height:414px;
      padding:16px;
      margin:0;
      background-color: rgba(0,0,0,0.2);
    }

    .main-image iframe{
      position:relative;
      width:736px;
      height:414px;
      margin:0;
      padding:0;
      border:none;
    }

    .main-image img{
      width:736px;
      max-height:414px;
      margin:0;
      padding:0;
    }

    .vm-product-container .left .vm-productdetail-tabs-container{
      position:relative;
      width:100%;
      padding:0;
      margin:0;
    }

    .vm-productdetail-tabs-container .nav-tabs>li>a{
      padding-left:16px;
      padding-right:16px;
      min-width:100px;
      text-align:center;
    }

    .vm-productdetail-tabs-container .tab-content{
      position:relative;
      width:100%;
      padding:0;
    }

    .product-description{
      padding:10px;
    }

    .product-description p{
      line-height:24px;
      white-space:pre-line;
      word-wrap: break-word;
    }

    .product-description img{
      width:100%;
    }

    .vm-product-container .right{
      float:right;
      width:320px;
      padding:0;
      margin-left:16px;
    }

    .vm-product-container .right .vm-product-details-container{
      position:relative;
      width:100%;
      padding:0;
      margin:0;
      text-align:left;
    }

    .vm-product-details-container .product-info{
      border-top: 1px solid rgba(255,0,0,0.1);
      border-bottom: 0;
      float: none;
      padding-top: 20px;
      padding-bottom: 0;
    }
    .vm-product-details-container .vmproduct-link{
      border-top: 1px solid rgba(255,0,0,0.1);
      border-bottom:1px solid rgba(255,0,0,0.1);
      float: none;
      padding-top: 20px;
      padding-bottom: 20px;
    }

    .vm-product-details-container .vmproduct-link button{
      border-width: 2px;
      border-style: solid;
      border-image: linear-gradient(to right,#682CAD,#2FC0CC) 1;
    }

    .vm-product-container .right .product-share-container{
      position:relative;
      width:100%;
      padding:0;
      margin:0;
      text-align:left;
    }

    .vm-display{
      margin-bottom: 8px;
    }

    .vm-display .vm-desc{
      margin: 0 8px 2px 0;
      padding:0;
      width:85px;
      display:inline-block;
      font-size:14px;
      vertical-align:top;
      font-weight:bold;
      color: #2B2B2B;
    }

    .vm-display .vm-value{
      display:inline-block;
      letter-spacing:-1px;
      padding:0;
      margin:0;
      max-width:180px;
      width:180px;
      overflow:hidden;
      color:#838383;
    }

    .vm-price-desc{
      margin: 2px 0 0 0;
      padding:0;
      width:60px;
      display:inline-block;
      font-size:14px;
      vertical-align:top;
      font-weight:bold;
      color: #2B2B2B;
    }
    .product-description h5{
      font-size:16px;
      font-weight:bold;
      color:#67c1f5;

    }

    .product-description article{
      margin-top:20px;
      margin-bottom:20px;
    }

    #image-top-bg {
      margin: auto;
      background: url("../../images/img_bg.png");
      background-size: cover;
      width: 100%;
      height: 200px;
    }

    body> header iframe, footer iframe {
      display: block;
    }

    img {
      border: 0;
      vertical-align: middle;
      overflow-clip-margin: content-box;
      overflow: clip;
    }

    button {
      overflow: visible
    }

    button,select {
      text-transform: none
    }

    input {
      line-height: normal
    }

    textarea {
      overflow: auto
    }

    table {
      border-collapse: collapse;
      border-spacing: 0
    }

    td,th {
      padding: 0
    }

    * {
      box-sizing: border-box
    }

    .docs-section .page-header {
      border-bottom: 1px solid rgba(255,255,255,0.1);
      margin: -20px -20px 20px -20px;
      padding-bottom: 0
    }

    .page-header h1{
      color: inherit;
      font-size: 13px;
      letter-spacing: 0.5px;
      margin: 0;
      padding: 20px 32px 20px 0;
      text-transform: uppercase;
      position: relative;
      display: inline-block;
    }

    .page-header h2 {
      color: inherit;
      font-size: 13px;
      letter-spacing: 0.5px;
      margin:  0;
      padding:40px 20px 0;
      text-transform: uppercase;
      position: relative;
      display: inline-block;
    }
    .docs-section .page-header h1 {
      margin: 0;
      line-height: normal;
      padding-right: 0;
      margin-left: 20px
    }
    .page-header {
      padding-bottom: 9px;
      margin: 40px 0 20px;
      border-bottom: 1px solid #eeeeee
    }



    input,button,select,textarea {
      font-family: inherit;
      font-size: inherit;
      line-height: inherit
    }

    a {
      color: #67c1f5;
      text-decoration: none
    }

    .img-thumbnail {
      padding: 4px;
      line-height: 1.42857143;
      background-color: #1b2838;
      border: 1px solid #dddddd;
      border-radius: 3px;
      -webkit-transition: all 0.2s ease-in-out;
      -o-transition: all 0.2s ease-in-out;
      transition: all 0.2s ease-in-out;
      display: inline-block;
      max-width: 100%;
      height: auto
    }

    .container {
      margin-right: auto;
      margin-left: auto;
      padding-left: 16px;
      padding-right: 16px
    }

    @media (min-width: 768px) {
      .container {
        width:752px
      }
    }

    @media (min-width: 992px) {
      .container {
        width:972px
      }
    }

    @media (min-width: 1200px) {
      .container {
        width:1152px
      }
    }

    .media_player_marker{
      position:absolute;
      margin-left:60px;
      margin-top:32px;
      background:red;
      height:25px;
      line-height:25px;
      border-radius:5px;
      text-align:center;
      padding-left:8px;
      padding-right:6px;
    }

    .row {
      margin-left: -16px;
      margin-right: -16px
    }

    .btn {
      display: inline-block;
      margin-bottom: 0;
      font-weight: normal;
      text-align: center;
      vertical-align: middle;
      touch-action: manipulation;
      cursor: pointer;
      background-image: none;
      border: 1px solid transparent;
      white-space: nowrap;
      padding: 6px 12px;
      font-size: 14px;
      line-height: 1.42857143;
      border-radius: 3px;
      -webkit-user-select: none;
      -moz-user-select: none;
      -ms-user-select: none;
      user-select: none
    }

    .btn-default {
      background-color: #ffffff;
      border-color: #cccccc;
      color: #333333;
      background: linear-gradient(#ffffff,#f2f2f2);
      border: 1px solid #cccccc;
      box-shadow: 0 0 1px rgba(255,255,255,0.2) inset
    }

    .btn-warning {
      background-color: #f0ad4e;
      border-color: #eea236;
      color: #ffffff;
      background: linear-gradient(to right,#682CAD,#2FC0CC);
      border: 1px solid #eea236;
      box-shadow: 0 0 1px rgba(255,255,255,0.2) inset
    }

    .nav {
      margin-bottom: 0;
      padding-left: 0;
      list-style: none
    }

    .nav > li {
      position: relative;
      display: block
    }

    .nav > li > a {
      position: relative;
      display: block;
      padding: 10px 15px
    }


    .nav > li > a > img {
      max-width: none
    }

    .nav-tabs {
      border-bottom: 1px solid #dddddd
    }

    .nav-tabs > li {
      float: left;
      margin-bottom: -1px;
    }

    .nav-tabs > li.active > a,.nav-tabs > li.active > a:hover,.nav-tabs > li.active > a:focus {
      color: rgba(255, 255, 255, 1);
      background: linear-gradient(to right,#682CAD,#2FC0CC);
      border: 1px solid rgba(255, 255, 255, 0);
      border-bottom-color: transparent;
      cursor: default
    }

    .tab-content > .tab-pane {
      display: none
    }

    .tab-content > .active {
      display: block
    }

    .nav:after,  .panel-body:after{
      content: " ";
      display: table;
      clear: both
    }

  </style>

</head>

<body>
<header>
  <iframe src="../main/header.html" scrolling="no" width="100%" height="230px" frameborder=0></iframe>
</header>

<div id="image-top-bg"></div>


<div id="mainbody" style="margin-top:20px;">
  <div class="container">
    <div class="row equal-height">
      <!-- MAIN CONTENT -->
      <div id="t3-content" class="t3-content col-md-12">
        <div id="system-message-container"></div>
        <div class="productdetails-view productdetails">
          <div class="page-header">
            <div style="clear:both;position:absolute;margin-top:18px;z-index:10;text-align:center;">
              <div style="display:block;border: 1px solid rgba(255,255,255,0.1);padding-left:10px;padding-right:10px;"><img src="../../images/img_team_profile_big.png" width="80"/></div>
            </div>
            <h1 style="font-size:20px;padding-left:110px;display:inline-block;text-transform:initial" >

							<span>
																												디 엑시트 이터널 매터스							</span><br/>
              <span style="text-transform:none">DE-EXIT - Eternal Matters</span>
            </h1>
          </div>

          <div class="vm-product-container">
            <div class="left">
              <div class="vm-product-media-container" itemprop='video' itemscope itemtype='https://schema.org/VideoObject'>
                <div class="main-image">
                  <div id="screenshot_image"><div class='embed-responsive embed-responsive-16by9'><iframe class='embed-responsive-item' src='https://www.youtube.com/embed/fo_fkE1qQ8Y'></iframe></div></div>
                  <div class="clear"></div>
                </div>
                <div class="gallery-wrapper">
                  <div class="gallery detail-gallery">
                    <div class="item screenshot_thumbnail" style='cursor:pointer'>
                      <div class='media_player_marker'><span>▶</span></div>
                      <img src="https://img.youtube.com/vi/fo_fkE1qQ8Y/1.jpg" data-type="media" data-url="<div class='embed-responsive embed-responsive-16by9'><iframe class='embed-responsive-item' src='https://www.youtube.com/embed/fo_fkE1qQ8Y'></iframe></div>" itemprop="thumbnailUrl">
                    </div>
                    <div class="item screenshot_thumbnail" style='cursor:pointer'>
                      <img src="../../images/img_game_thumbnail_2_260180.png" data-type="image/jpeg" data-url="<img src='../../images/img_game_thumbnail_2_260180.png'>" itemprop="thumbnailUrl">
                    </div>
                    <div class="item screenshot_thumbnail" style='cursor:pointer'>
                      <img src="../../images/img_game_thumbnail_3_260180.png" data-type="image/jpeg" data-url="<img src='../../images/img_game_thumbnail_3_260180.png'>" itemprop="thumbnailUrl">
                    </div>
                    <div class="item screenshot_thumbnail" style='cursor:pointer'>
                      <img src="../../images/img_game_thumbnail_4_260180.png" data-type="image/jpeg" data-url="<img src='../../images/img_game_thumbnail_4_260180.png'>" itemprop="thumbnailUrl">
                    </div>
                    <div class="item screenshot_thumbnail" style='cursor:pointer'>
                      <img src="../../images/img_game_thumbnail_1_500240.png" data-type="image/jpeg" data-url="<img src='../../images/img_game_thumbnail_1_500240.png'>" itemprop="thumbnailUrl">
                    </div>
                    <div class="item screenshot_thumbnail" style='cursor:pointer'>
                      <img src="../../images/img_game_thumbnail_2_500240.png" data-type="image/jpeg" data-url="<img src='../../images/img_game_thumbnail_2_500240.png'>" itemprop="thumbnailUrl">
                    </div>

                  </div>
                </div>
              </div>
              <div class="clear"></div>


              <div class="vm-productdetail-tabs-container">
                <ul class="nav nav-tabs" style="margin-bottom:8px">
                  <li class="active"><a href="#goods_info1" data-toggle="tab">게임정보</a></li>
                  <li><a href="#goods_info2" data-toggle="tab">시스템 요구사항</a></li>
                </ul>
                <div id="myTabContent" class="tab-content">
                  <div id="goods_info1" class="tab-pane fade active in">
                    <div class="product-description">
                    </div>
                    <div class="product-description">
                      <p><b><span style="color: rgb(40, 180, 243);">죽음을 넘어선 생명을 느끼다</span></b><br>사후 세계로의 초현실적인 여정에서 은신 플레이가 가미된 영화 같은 모험을 하며, 신비하고 부서진 기억의 차원에 감춰진 비밀을 밝혀 내세요. 강렬한 분위기가 돋보이는 경이로운 3D 픽셀의 세계로 뛰어들어, 세상을 구원하세요!&nbsp;<br><br><img src="https://cdn.akamai.steamstatic.com/steam/apps/1396190/extras/Fondo.gif?t=1681490399"><br><br><b>영화 같은 복셀 그래픽 세계 체험</b><br>DE-EXIT는 심플하면서도 매끄럽게 구성된 복셀 그래픽뿐만 아니라 현실적인 움직임과 자연스러운 특수 효과, 자세한 배경을 구현해 마치 영화 같은 분위기가 느껴지는 게임입니다.<br><br><b>새로운 세계로 떠나는 신비로운 여행</b><br>호기심을 자아내는 초현실적인 세상에서 깨어난 당신. 과연 여기는 어디일까요? 여기서 무얼 하는 걸까요? 온 세상이 왜 이렇게 달라 보일까요? 무너진 경계 속의 세상에서 혼란은 점점 커져가지만, 희망을 잃지 않는 주민과 함께 떠난다면 걱정할 필요가 없어요. 낯설고 예측할 수 없으면서도 웅장한 풍경 속에서 비밀로 가득한 &#39;기억의 저편&#39;을 재건해보세요.<br><br><b>이야기 중심의 게임</b><br>손에 땀을 쥐게 하는 흥미진진한 이야기를 중심으로 여러 게임 요소를 즐겨보세요. 퍼즐, 잠행, 플랫폼, 액션 요소 모두 다 한 번에 즐길 수 있습니다.<br><br><b>게임으로 조망하는 죽음과 사후세계</b><br>죽음은 터부시되는 소재이지만 DE-EXIT에서는 이 민감한 소재로 새로운 이야기를 시작합니다. 두렵지만 신비로운 죽음이라는 소재를 긍정적인 관점으로 마주해 보세요. 죽음을 기억하며 아름다운 인생을 즐기는 뜻깊은 시간이 될 겁니다.<br type="_moz"><br><img src="https://cdn.akamai.steamstatic.com/steam/apps/1396190/extras/DEEXIT_Steam_text_description3.png?t=1681490399"><br><img src="https://cdn.akamai.steamstatic.com/steam/apps/1396190/extras/DEEXIT_Steam_Text_description_logo.png?t=1681490399"></p>												</div>
                  </div>
                  <div id="goods_info3" class="tab-pane fade">
                    <div class="product-description">
                      <p><br></p>												</div>
                  </div>
                  <div id="goods_info2" class="tab-pane fade">
                    <div class="product-description">
                      <p><b>최소:</b><br>64비트 프로세서와 운영 체제가 필요합니다<br>운영체제: Windows 10 64bits<br>프로세서: Intel Core i5 / AMD FX-6300<br>메모리: 6 GB RAM<br>그래픽: GTX 650 Ti 1GB/ Radeon 6950 1GB or better<br>저장공간: 11 GB 사용 가능 공간<br>사운드카드: DirectX compatible<br>추가 사항: These are preliminary system specs that can and will change!<br><br><b>권장:</b><br>64비트 프로세서와 운영 체제가 필요합니다<br>&nbsp;</p><hr><br>DE-EXIT - Eternal Matters © 2023 THQ Nordic AB Sweden. Developed by SandBloom Studio, Spain. Published by <a href="http://www.handy-games.com">www.handy-games.com</a> GmbH, Germany. DE-EXIT, THQ, THQ Nordic, HandyGames and their respective logos are trademarks and/or registered trademarks of THQ Nordic AB. All rights reserved. All other brands, product names and logos are trademarks or registered trademarks of their respective owners.<br>													<br><p>※ 시스템 요구 사항은 출시 버전을 기준으로 하며, 컨텐츠 추가와 업데이트로 인한 변경 사항이 있을 수 있습니다.</p>
                    </div>
                  </div>
                  <div id="goods_info4" class="tab-pane fade">
                    <div class="product-description">
                      <p><br></p>												</div>
                  </div>
                  <div id="goods_event" class="tab-pane fade">
                    <div class="product-description">
                      <p><br></p>												</div>
                  </div>
                </div>
              </div>
            </div>

            <div class="right">
              <div class="vm-product-details-container" >
                <div class="module normal-module" >
                  <div id="goods_img" ><img src="../../images/img_game_thumbnail_2_500240.png" width="320" height="150"  title="유니크 게임즈" onerror="this.src='/images/404.jpg'"></div>
                  <div class="module-inner">
                    <div class="module-ct">
                      <div class="vmgroup single-product  normal-module" >
                        <div class="vmproduct normal-module" >
                          <div class="spacer">

                            <div class="product-short-description">

                            </div>

                            <div id="product-price2" style="padding-top:10px">
                              <div class="PricebasePrice vm-display vm-price-value">
                                <span class="vm-price-desc" >제작 </span>
                                <span class="PricebasePrice" ><a href="company.jsp" style="font: italic normal 900 18px Apex New; letter-spacing: 0px;color: #1c2025">CGD(Crazy Game Dog) Team</a>
                                  </span>
                              </div>
                              <span class="price-crossed" ></span>
                              <!--                              <div class="PricesalesPrice vm-display vm-price-value" style="text-align: center">-->
                              <!--                                <a class="PricebasePrice" href="#" style="color: deepskyblue">-->
                              <!--                                  <IMG src="../../images/btn_boardSearch_normal.png">제작팀 소개 바로가기-->
                              <!--                                </a>-->
                              <!--                              </div>-->
                            </div>

                            <div class="product-info">
                              <div class="vm-display">
                                <span class="vm-desc">제작기간 </span>
                                <span class="vm-value">18개월 15일</span>
                              </div>
                              <div class="vm-display">
                                <span class="vm-desc">지원모드 </span>
                                <span class="vm-value">싱글 플레이</span>
                              </div>
                              <div class="vm-display release_date">
                                <span class="vm-desc">출시일 </span>
                                <span class="vm-value">
																																				2023-04-27																																				</span>
                              </div>
                              <div class="vm-display">
                                <span class="vm-desc">장르 </span>
                                <span class="vm-value">액션/어드벤쳐</span>
                              </div>
                              <div class="vm-display">
                                <span class="vm-desc">퍼블리셔 </span>
                                <span class="vm-value" >HandyGames</span>
                              </div>
                              <div class="vm-display">
                                <span class="vm-desc">플랫폼 </span>
                                <span class="vm-value">Steam</span>
                              </div>
                              <div class="vm-display">
                                <span class="vm-desc">언어 </span>
                                <span class="vm-value">한국어</span>
                              </div>
                              <div class="vm-display">
                                <span class="vm-desc">게임패드 </span>
                                <span class="vm-value">지원함</span>
                              </div>


                              <!--                              <div id="etc" style="width:100%;max-width:300px;">-->
                              <!--                                <img src="../../images/btn_boardSearch_normal.png">-->
                              <!--                                <img src='../../images/btn_check_normal.png'/><img src='../../images/btn_eye_select.png'/>																	</div>-->

                            </div>

                            <div class="vmproduct-link" style="text-align:center">
                              <div class="donation-amount">
                                <span class="label">목표금액</span>
                                <span class="amount">100,000,000원</span>
                              </div>
                              <div class="donation-amount" style="margin-bottom: 30px">
                                <span class="label">후원금액</span>
                                <span class="don-amount">1,000,000원</span>
                              </div>
                              <button type="button" class="btn btn-default btn-lg" id="btn_wishlist" data="50004122" style="width: 90px;">
                                <img src="../../images/btn_like_select.png">
                                Like</button>
                              <button type="button" class="btn btn-warning btn-lg" id="btn_donate" data="50004122" data-assetid="3402" data-prodtp="1" style="width: 150px">후원하기</button>

                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>


              <div class="clear"></div>

              <div class="product-share-container">
                <div class="docs-section">
                  <div class="page-header">
                    <h2 style="font-size:16px;text-indent:130px">공유하기</h2>
                  </div>
                  <div class="row">
                    <div class="input-inline" style="align-content: center ">
                      <button type="button" class="btn" id="btn_facebook" style="background:#4e69a2;color:#ffffff;font-size:13px"><i class="fa fa-facebook" style="background:#4e69a2;color:#ffffff"></i> 페이스북</button>
                      <button type="button" class="btn" id="btn_twitter" style="background:#319de1;color:#ffffff;font-size:13px"><i class="fa fa-twitter" style="background:#319de1;color:#ffffff"></i> 트위터</button>
                      <button type="button" class="btn" id="btn_google" style="background:#df513f;color:#ffffff;font-size:13px"><i class="fa fa-google-plus" style="background:#df513f;color:#ffffff"></i> 구글+</button>

                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>


<script>
  /* 이미지 클릭 스크립트*/
  $(document).ready(function(){
    $(".screenshot_thumbnail").bind("click",function(){
      var index = $(".screenshot_thumbnail").index(this);
      var content_type = $(".screenshot_thumbnail img").eq(index).attr("data-type");
      var content_url = $(".screenshot_thumbnail img").eq(index).attr("data-url").replace("http://","https://");


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
</script>
<script type="text/javascript">
  var title = "디 엑시트 이터널 매터스";
  var img = "https://directg.net/upload/product/goods_1681697853_opengraph.jpg";
  var summary = "죽음을 넘어선 생명을 느끼다사후 세계로의 초현실적인 여정에서 은신 플레이가 가미된 영화 같은 모험을 하며, 신비하고 부서진 기억의 차원에 감춰진 비밀을 밝혀 내세요. 강렬한 분위기가 돋보이는 경이로운 3D 픽셀의 세계로 뛰어들어, 세상을 구원하세요!&nbsp;영화 같은 복셀 그래픽 세계 체험DE-EXIT는 심플하면서도 매끄럽게 구성된 복셀 그래픽뿐만 아니라 현실적인 움직임과 자연스러운 특수 효과, 자세한 배경을 구현해 마치 영화 같은 분위기가 느껴지는 게임입니다.새로운 세계로 떠나는 신비로운 여행호기심을 자아내는 초현실적인 세상에서 깨어난 당신. 과연 여기는 어디일까요? 여기서 무얼 하는 걸까요? 온 세상이 왜 이렇게 달라 보일까요? 무너진 경계 속의 세상에서 혼란은 점점 커져가지만, 희망을 잃지 않는 주민과 함께 떠난다면 걱정할 필요가 없어요. 낯설고 예측할 수 없으면서도 웅장한 풍경 속에서 비밀로 가득한 &#39;기억의 저편&#39;을 재건해보세요.이야기 중심의 게임손에 땀을 쥐게 하는 흥미진진한 이야기를 중심으로 여러 게임 요소를 즐겨보세요. 퍼즐, 잠행, 플랫폼, 액션 요소 모두 다 한 번에 즐길 수 있습니다.게임으로 조망하는 죽음과 사후세계죽음은 터부시되는 소재이지만 DE-EXIT에서는 이 민감한 소재로 새로운 이야기를 시작합니다. 두렵지만 신비로운 죽음이라는 소재를 긍정적인 관점으로 마주해 보세요. 죽음을 기억하며 아름다운 인생을 즐기는 뜻깊은 시간이 될 겁니다.";
  var url = "https://directg.net/game/game_page.html?product_code=50004122";

  //트위터 공유
  $('#btn_twitter').bind("click",function(){
    goTwitter();
  });

  //페이스북 공유
  $('#btn_facebook').bind("click",function(){
    goFacebook();
  });
  //구글플러스 공유

  $('#btn_google').bind("click",function(){
    goGooglePlus();
  });

  var goFacebook =function(){
    var popup_width = 600;
    var popup_height = 450;
    $.sns_lib.initialize(title,img,summary,popup_width,popup_height,url);
    $.sns_lib.go_Facebook();
    $.sns_lib.destroy();
  }

  var goTwitter = function(){
    var popup_width = 450;
    var popup_height = 450 ;
    var txt = summary.substr(0, 100)
    $.sns_lib.initialize(title,'',txt,popup_width,popup_height,url);
    $.sns_lib.go_Twitter();
    $.sns_lib.destroy();
  }

  var goGooglePlus = function(){
    var link_url = "https://directg.net/game/game_page.html?product_code=50004122";
    var url = "https://plus.google.com/share?url="+link_url;
    window.open(url,'', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');
    //return false;
  }
</script>

<footer>
  <iframe src="../main/footer.html" scrolling="no" height="630px" width="100%" frameborder=0></iframe>
</footer>
</body>

</html>