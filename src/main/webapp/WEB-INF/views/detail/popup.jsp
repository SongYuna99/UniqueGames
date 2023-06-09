<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>popup</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css">
  <script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.12.4.min.js"></script> <!-- 마이크로소프트 jQuery-->

  <style>
    /* 라디오버튼 */
    .list-group {
      max-width: 260px;
      margin: 2rem auto;
    }

    .form-check-input:checked + .form-checked-content {
      opacity: .5;
    }

    .form-check-input-placeholder {
      border-style: dashed;
    }
    [contenteditable]:focus {
      outline: 0;
    }

    .list-group-checkable .list-group-item {
      cursor: pointer;
    }
    .list-group-item-check {
      position: absolute;
      clip: rect(0, 0, 0, 0);
    }
    .list-group-item-check:hover + .list-group-item {
      background-color: var(--bs-light);
    }
    .list-group-item-check:checked + .list-group-item {
      color: #fff;
      background-color: var(--bs-blue);
    }
    .list-group-item-check[disabled] + .list-group-item,
    .list-group-item-check:disabled + .list-group-item {
      pointer-events: none;
      filter: none;
      opacity: .5;
    }

    .list-group-radio .list-group-item {
      cursor: pointer;
      border-radius: .5rem;
    }
    .list-group-radio .form-check-input {
      z-index: 2;
      margin-top: -.5em;
    }
    .list-group-radio .list-group-item:hover,
    .list-group-radio .list-group-item:focus {
      background-color: var(--bs-light);
    }

    .list-group-radio .form-check-input:checked + .list-group-item {
      background-color: var(--bs-body);
      border-color: var(--bs-blue);
      box-shadow: 0 0 0 2px var(--bs-blue);
    }
    .list-group-radio .form-check-input[disabled] + .list-group-item,
    .list-group-radio .form-check-input:disabled + .list-group-item {
      pointer-events: none;
      filter: none;
      opacity: .5;
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
      color: #ffffff;
      background: linear-gradient(to right,#682CAD,#2FC0CC);
      box-shadow: 0 0 1px rgba(255,255,255,0.2) inset
    }

    #dnt_company{
      margin: 20px;
      font-family: "YouandiModern", "Apex New", "Noto Sans KR", sans-serif;
    }
  </style>
</head>
<body>
    <div class="list-group list-group-radio d-grid gap-2 border-0 w-auto">
    <img src="${pageContext.request.contextPath}/images/img_title_logo.png" />
    <div id="dnt_company">${companyVo.name}</div>
      <div class="position-relative">
        <input class="form-check-input position-absolute top-50 end-0 me-3 fs-5" type="radio" name="listGroupRadioGrid" id="listGroupRadioGrid1" value="10000" checked>
        <label class="list-group-item py-3 pe-5" for="listGroupRadioGrid1">
          <strong class="fw-semibold">10,000원</strong>
          <span class="d-block small opacity-75"></span>
        </label>
      </div>

      <div class="position-relative">
        <input class="form-check-input position-absolute top-50 end-0 me-3 fs-5" type="radio" name="listGroupRadioGrid" id="listGroupRadioGrid2" value="30000">
        <label class="list-group-item py-3 pe-5" for="listGroupRadioGrid2">
          <strong class="fw-semibold">30,000원</strong>
          <span class="d-block small opacity-75"></span>
        </label>
      </div>

      <div class="position-relative">
        <input class="form-check-input position-absolute top-50 end-0 me-3 fs-5" type="radio" name="listGroupRadioGrid" id="listGroupRadioGrid3" value="50000">
        <label class="list-group-item py-3 pe-5" for="listGroupRadioGrid3">
          <strong class="fw-semibold">50,000원</strong>
          <span class="d-block small opacity-75"></span>
        </label>
      </div>

      <div class="position-relative">
        <input class="form-check-input position-absolute top-50 end-0 me-3 fs-5" type="radio" name="listGroupRadioGrid" id="listGroupRadioGrid4" value="100000" >
        <label class="list-group-item py-3 pe-5" for="listGroupRadioGrid4">
          <strong class="fw-semibold">100,000원</strong>
          <span class="d-block small opacity-75"></span>
        </label>
       </div>
      <div style="text-align: center; margin-top: 20px">
        <button type="button" class="btn btn-warning btn-lg" id="btn_donate" name="btn_donate" style="width: 150px; text-decoration-color: white" >후원하기</button>
      </div>

</div>
<script>
  $(document).ready(function() {
    $('#btn_donate').click(function() {
      const selectedValue = $('input[name="listGroupRadioGrid"]:checked').val();
      const sessionAccount = '${sessionScope.loginMember}';
      let parentURL = window.opener.location.href; // 부모 창의 URL 가져오기
      let id = parentURL.substring(parentURL.lastIndexOf('/') + 1, parentURL.lastIndexOf('.do')); // 사이트 동적 처리하기 위해 숫자 추출
      if (sessionAccount.includes("MemberVo")) {
        $.ajax({
          url: '../cart.do',
          method: 'POST',
          data: { selectedValue: selectedValue },
          success: function(response) {
            // 서버 응답 처리 로직 작성
            window.close();
            window.opener.location.href = '../cart.do';
          },
          error: function(xhr, status, error) {
            // 에러 처리 로직 작성
            alert('에러가 발생했습니다: ' + error);
          }
        });
      } else if(sessionAccount.includes("CompanyVo")){
        alert("일반 회원만 후원 가능합니다!");
      }
      else {
        alert("로그인 먼저 진행해 주세요!");
        window.close();
        window.opener.location.href = '../login.do?redirectURL=detail/' + id + '.do';
      }
    });
  });

</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.min.js"></script>
</body>
</html>