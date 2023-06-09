<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0"/>
  <title>제작사(팀) 소개</title>
  <!--css 초기화-->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">
  <!-- SWIPER 외부 라이브러리 연결-->
  <link rel="stylesheet" href="https://unpkg.com/swiper@8/swiper-bundle.min.css" />
  <script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>
  <!--google material icon 사용 class="material-icons"-->
  <link rel="stylesheet" href="http://fonts.googleapis.com/icon?family=Material+Icons">

  <!--  bootstrap -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/board.css">
  <script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.12.4.min.js"></script>
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
      width: 1000px!important;
      height: 500px!important;
      overflow: hidden!important;
    }

    .swiper .swiper-slide {
      height: 300px!important;
      display: flex!important;
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
      width: 30px!important;
      height: 30px!important;
      border: 2px solid rgba(136, 20, 20, 0.03)!important;
      border-radius: 50%!important;
      position: absolute!important;
      top: 300px!important;
      z-index: 1!important;
      cursor: pointer!important;
      display: flex!important;
      justify-content: center!important;
      align-items: center!important;
    }
    .swiper-button-prev {
      margin-left: -70px;
      left: 50px!important;
    }
    .swiper-button-next {
      right: 10px;
    }
    .card-footer a{
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
    .btn-style{
      background: #393939;
      border-radius: 5px;
      width: 80px;
      height: 30px;
      color: #FFFFFF;
      font-size: 14px;
      vertical-align: top;
      cursor: pointer;
    }

  </style>
</head>

<body style="padding: 0">
<jsp:include page="../main/header.jsp"></jsp:include>
<div id="board-top-menu">
  <div>
    <ul>
      <li><button type="button" class="btn-style" name="listUpdate">수정</button></li>
      <li><button type="button" class="btn-style" name="listDelete">삭제</button></li>
    </ul>
  </div>
</div>
<div class="container">

  <!--  제작팀 소개 -->
  <div  style="margin: 70px 20px 0 150px ">
    <div style="display: flex; align-items: center;">

        <input name="id" type="hidden" value="${intro.id}">
        <c:if test="${intro.upload != null}">
          <img src="${pageContext.request.contextPath}/upload/${intro.upload}" alt="${intro.name} 팀 로고" style="margin-right: 20px; width: 225px; height: 225px;" >
        </c:if>
        <div id="introduce">
          <div  style="font: italic normal 900 28px Apex New;">${intro.name}</div>
          <p> Game Delover Team</p>
          <p>${intro.title}</p>
          <p>${intro.content}</p>
        </div>
    </div>


  </div>


  <!--  slider 시작 -->
  <div class="swiper">
    <p style=" text-align: center;">
      <a href="../alllist.do">
      <img style="display: block;padding: 50px; margin: 0 auto" src="${pageContext.request.contextPath}/images/img_title_gameList.png">
      </a>
    </p>
    <div class="swiper-wrapper">
      <div class="swiper-slide">
        <div class="card">
          <img src="${pageContext.request.contextPath}/images/img_game_thumbnail_3_500240.png" class="card-img-top" style="height: 150px; width: 234px">
          <div class="card-body">
            <img src="${pageContext.request.contextPath}/images/imt_title_top.png" style="height: 15px; margin-bottom: 5px">
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
          <img src="${pageContext.request.contextPath}/images/img_game_thumbnail_2_500240.png" class="card-img-top" style="height: 150px; width: 234px">
          <div class="card-body">
            <img src="${pageContext.request.contextPath}/images/imt_title_top.png" style="height: 15px; margin-bottom: 5px">
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
          <img src="${pageContext.request.contextPath}/images/img_game_thumbnail_1_260180.png" class="card-img-top" style="height: 150px; width: 234px">
          <div class="card-body">
            <img src="${pageContext.request.contextPath}/images/imt_title_top.png" style="height: 15px; margin-bottom: 5px">
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
          <img src="${pageContext.request.contextPath}/images/img_game_thumbnail_3_260180.png" class="card-img-top" style="height: 150px; width: 234px">
          <div class="card-body">
            <img src="${pageContext.request.contextPath}/images/imt_title_top.png" style="height: 15px; margin-bottom: 5px">
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
          <img src="${pageContext.request.contextPath}/images/img_game_thumbnail_4_260180.png" class="card-img-top" style="height: 150px; width: 234px">
          <div class="card-body">
            <img src="${pageContext.request.contextPath}/images/imt_title_top.png" style="height: 15px; margin-bottom: 5px">
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
          <img src="${pageContext.request.contextPath}/images/img_game_thumbnail_2_260180.png" class="card-img-top" style="height: 150px; width: 234px">
          <div class="card-body">
            <img src="${pageContext.request.contextPath}/images/imt_title_top.png" style="height: 15px; margin-bottom: 5px">
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
<%--      <div class="swiper-button-prev" style="overflow: visible">--%>
<%--        <div class="material-icons">arrow_back</div>--%>
<%--      </div>--%>
<%--      <div class="swiper-button-next">--%>
<%--        <div class="material-icons">arrow_forward</div>--%>
<%--      </div>--%>

  </div>
  <!--  slider 끝-->

  <!--  공지사항-->
  <p style=" text-align: center;">
    <a href="../notice_list.do">

    <img style="display: block; margin: 0 auto;padding-top: 50px" src="${pageContext.request.contextPath}/images/img_title_notice.png">
    </a>
  </p>
  <div id="content">
    <div id="board-list">
      <div id="board-top-menu">

            <p>Notice</p>
            <div id='bsearch-box'>
              <form name='boardSearch' action='notice_Search.do' method='get'>
                <label>
                  <input type='text' name='keyword' placeholder='검색어를 입력해주세요.'>
                  <button type='button' id='btn-search'>
                    <img src='http://localhost:9000/uniquegames/images/btn_boardSearch_press.png'>
                  </button>
                </label>
              </form>
              <ul>
                <li><button type='button' id='btn-style' name='getList'>목록</button></li>
              </ul>
            </div>
            <div id='clearFix'></div>
      </div>
          <table id="user-btable">
            <tr>
              <th>번호</th>
              <th>제목</th>
              <th>작성자</th>
              <th>작성일</th>
            </tr>
            <c:choose>
              <c:when test="${not empty list}">
                <c:forEach var="noticeVo" items="${list}">
                  <tr>
                    <td><c:out value="${noticeVo.rno}"/></td>
                    <td><a href="notice_content.do?no=${noticeVo.post_id}"><c:out value="${noticeVo.title}" /><c:if test="${noticeVo.cmtCount > 0}"><c:out value=" [${noticeVo.cmtCount}]" /></c:if></a></td>
                    <td><c:out value="${noticeVo.name}" /></td>
                    <td><c:out value="${noticeVo.date_output}" /></td>
                  </tr>
                </c:forEach>
              </c:when>
              <c:when test="${empty list}">
                <tr>
                  <td colspan="4" style="padding: 50px 0">등록된 게시글이 없습니다.</td>
                </tr>
              </c:when>
            </c:choose>
            <tr>
              <td colspan="5"><div id="ampaginationsm"></div></td>
            </tr>
          </table>
    </div>
  </div>
  <!--  공지사항 끝-->

  <!--  추천-->
  <div class="swiper">
    <p style=" text-align: center;"><img style="display: block;padding: 50px; margin: 0 auto" src="${pageContext.request.contextPath}/images/img_title_recommendations.png"></p>
    <div class="swiper-wrapper">
      <div class="swiper-slide">
        <div class="card">
          <img src="${pageContext.request.contextPath}/images/img_game_thumbnail_3_500240.png" class="card-img-top" style="height: 150px; width: 234px">
          <div class="card-body">
            <img src="${pageContext.request.contextPath}/images/imt_title_top.png" style="height: 15px; margin-bottom: 5px">
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
          <img src="${pageContext.request.contextPath}/images/img_game_thumbnail_2_500240.png" class="card-img-top" style="height: 150px; width: 234px">
          <div class="card-body">
            <img src="${pageContext.request.contextPath}/images/imt_title_top.png" style="height: 15px; margin-bottom: 5px">
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
          <img src="${pageContext.request.contextPath}/images/img_game_thumbnail_1_260180.png" class="card-img-top" style="height: 150px; width: 234px">
          <div class="card-body">
            <img src="${pageContext.request.contextPath}/images/imt_title_top.png" style="height: 15px; margin-bottom: 5px">
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
          <img src="${pageContext.request.contextPath}/images/img_game_thumbnail_3_260180.png" class="card-img-top" style="height: 150px; width: 234px">
          <div class="card-body">
            <img src="${pageContext.request.contextPath}/images/imt_title_top.png" style="height: 15px; margin-bottom: 5px">
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
          <img src="${pageContext.request.contextPath}/images/img_game_thumbnail_4_260180.png" class="card-img-top" style="height: 150px; width: 234px">
          <div class="card-body">
            <img src="${pageContext.request.contextPath}/images/imt_title_top.png" style="height: 15px; margin-bottom: 5px">
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
          <img src="${pageContext.request.contextPath}/images/img_game_thumbnail_2_260180.png" class="card-img-top" style="height: 150px; width: 234px">
          <div class="card-body">
            <img src="${pageContext.request.contextPath}/images/imt_title_top.png" style="height: 15px; margin-bottom: 5px">
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
  /* 수정, 삭제 버튼 스크립트*/
  const element = document.getElementById('board-top-menu');
  const loginMember = '<%=session.getAttribute("loginMember")%>';
  if(loginMember.includes('MemberVo') || loginMember === 'null'){
    element.style.visibility = 'hidden';
  }
  else if(loginMember.includes('CompanyVo')){
    $('button[name="listUpdate"]').on("click", function() {
      location.href = "../detail/updateIntro.do";
    });
    $('button[name="listDelete"]').on("click", function() {
      location.href = "../detail/deleteIntro.do";
    });
  }

</script>

<jsp:include page="../main/footer.jsp"></jsp:include>
</body>

</html>