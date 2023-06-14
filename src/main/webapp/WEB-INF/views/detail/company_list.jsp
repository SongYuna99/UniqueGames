<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>회사 소개페이지 리스트</title>
    <meta charset="UTF-8">
    <title>Unique Games</title>
    <link rel="stylesheet" href="http://localhost:9000/uniquegames/css/mainunigames.css">
    <script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.12.4.min.js"></script>
</head>
<body>
<%--header--%>
<jsp:include page="../main/header.jsp"></jsp:include>
<section id="top-bg">
    <div id="base-layer">
        <div id="top-bg-textarea">
            <p id="top-title">All Company List</p>
            <p id="top-subtitle">#전체 회사(개발팀)목록</p>
        </div>
    </div>
</section>
<section id="menu-main2">
    <div id="board-top-menu">
        <div>
<%--            <form name="boardSearch" action="boardSearchProc.do" method="get">--%>
<%--                <label>--%>
<%--                    <input type="text" name="keyword" placeholder="검색어를 입력해주세요.">--%>
<%--                    <button type="button" id="btn-search">--%>
<%--                        <img src="http://localhost:9000/uniquegames/images/btn_boardSearch_press.png">--%>
<%--                    </button>--%>
<%--                </label>--%>
<%--            </form>--%>
            <ul>
                <li><button type="button" id="btn-style" name="listWrite">작성</button></li>
                <li><button type="button" id="btn-style" name="listUpdate">수정</button></li>
                <li><button type="button" id="btn-style" name="listDelete">삭제</button></li>
                <li><button type="button" id="btn-style" name="listDeleteAll">전체삭제</button></li>
            </ul>
        </div>
    </div>
    <div id="menu-allList">
        <div id="gameList">
            <c:forEach items="${companyList}" var="intro">
                <div id="gList">

                    <img src="http://localhost:9000/uniquegames/upload/${intro.upload}" width="260px" height="180px">
                    <ul>
                        <li><a href="getIntro.do?id=${intro.id}" style="cursor: pointer">${intro.name}</a></li>
                        <li>${intro.id}</li>
                        <li><img src="http://localhost:9000/uniquegames/images/img_icon_rPc.png"></li>
                    </ul>
                </div>
            </c:forEach>
        </div>
    </div>
</section>
<%--footer--%>
<jsp:include page="../main/footer.jsp"></jsp:include>
<script>
  // 작성 버튼 이벤트
  $('button[name="listWrite"]').on("click", function() {
    function showCompanyMembersOnlyAlert() {
      // 모달 창 생성
      var modal = document.createElement('div');
      modal.className = 'modal';

      // 모달 내용 생성
      var modalContent = document.createElement('div');
      modalContent.className = 'modal-content';

      // 모달 내용에 텍스트 추가
      var message = document.createTextNode('기업회원만 접근 가능합니다.');
      modalContent.appendChild(message);

      // 모달 창에 내용 추가
      modal.appendChild(modalContent);

      // 모달 스타일 설정
      modal.style.display = 'block';

      // 모달 창을 body에 추가
      document.body.appendChild(modal);

      // 모달 창을 클릭하면 모달 창을 닫음
      modal.addEventListener('click', function() {
        modal.style.display = 'none';
      });
    }
    // 현재 url 호출
    function getCurrentURL() {
      return window.location.href;
    }
    // loginMember 세션 값이 MemberVo 클래스 타입인 경우 모달창 표시
    function checkAccessAndShowModal() {
      const currentURL = getCurrentURL();
      const loginMember = sessionStorage.getItem('loginMember'); // 세션에서 loginMember 값 가져오기

      // 현재 페이지가 insertIntro.do이고 기업회원이 아닌 경우 모달창 표시
      // loginMember 세션 값이 MemberVo 클래스 타입인 경우 모달창 표시
      if (loginMember && loginMember.constructor.name === 'MemberVo') {
        showCompanyMembersOnlyAlert();
      }
    }

    // 페이지 로드 시 loginMember 세션 체크 및 모달창 표시
    window.addEventListener('load', function() {
      checkAccessAndShowModal();
    });

    location.href = "../detail/insertIntro.do";
  });



</script>
</body>
</html>
