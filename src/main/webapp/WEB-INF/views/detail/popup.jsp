<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>popup</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css">

  <style>
    /* 라디오버튼 */
    .list-group {
      max-width: 460px;
      margin: 4rem auto;
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
  </style>
</head>
<body>
    <div> 테스트 : ${gameName}</div>
    <div class="list-group list-group-radio d-grid gap-2 border-0 w-auto">
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

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.min.js"></script>
</body>
</html>