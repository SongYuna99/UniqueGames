<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>myPage</title>
	<link rel="stylesheet" href="http://localhost:9000/uniquegames/css/login.css">
	<script src="http://localhost:9000/uniquegames/js/jquery-3.6.4.min.js"></script>
	<script src="http://localhost:9000/uniquegames/js/join_jquery.js"></script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>
	<header>
		<jsp:include page="../main/header.jsp"></jsp:include>
	</header>
	<section id="top-bg">
		<div id="base-layer">
			<div id="top-bg-textarea">
				<p id="top-title">My Page</p>
				<p id="top-subtitle">#마이페이지</p>
			</div>
		</div>
	</section>
	<section id="content-1">
		<p id="intro">마이페이지</p>
		<form action="#" name="joinForm" method="get" id="content-myPage">
			<div>
				<ul>
					<li>
						<p id="label-dot">*</p>
						<label>아이디</label>
					</li>
					<li>
						<input type="text" id="input-common" name="id" value="${memberVo.member_id }" disabled>
					</li>
					<li>
						<p id="label-dot">*</p>
						<label>비밀번호</label>
					</li>
					<li>
						<input type="password" id="input-common" name="password">
						<input type="checkbox" id="pwd-check-img">
						<span id="pwdMsg"></span>
					</li>
					<li>
						<input type="password" id="input-common" name="password-check">
						<input type="checkbox" id="pwd-check-img-1">
						<span id="pwdMsg-check"></span>
					</li>
					<li>
						<p id="label-dot">*</p>
						<label>이름</label>
					</li>
					<li>
						<input type="text" id="input-common" name="name" value="${memberVo.name }" disabled>
					</li>
					<li>
						<p id="label-dot">*</p>
						<label>이메일</label>
					</li>
					<li>
						<input type="text" id="input-email" name="email1">
						@
						<input type="text" id="input-email" name="email2">
						<select name="email3" id="selectbox-email">
							<option value="">선택</option>
							<option value="default">naver.com</option>
							<option value="gmail.com">gmail.com</option>
							<option value="daum.net">daum.net</option>
							<option value="direct">직접입력</option>
						</select>
						<span id="emailMsg"></span>
					</li>
					<li>
						<label>주소</label>
					</li>
					<li>
						<input type="text" id="input-address" name="addr1" value="${memberVo.addr1 }">
						<button type="button" id="address-btn-style">검색</button>
					</li>
					<li>
						<label>상세 주소</label>
					</li>
					<li>
						<input type="text" id="input-common" name="addr2" value="${memberVo.addr2 }">
					</li>
					<li>
						<p id="label-dot">*</p>
						<label>휴대전화</label>
					</li>
					<li>
						<select name="tel" id="selectbox-mobile">
							<option value="default">SKT</option>
							<option value="KT">KT</option>
							<option value="LGU+">LGU+</option>
							<option value="MVNO">알뜰폰</option>
						</select>
						<select name="phone1" id="selectbox-phone">
							<option value="default">010</option>
							<option value="011">011</option>
							<option value="012">012</option>
						</select>
						-
						<input type="text" id="input-phone" name="phone2" value="${memberVo.phone2 }">
						-
						<input type="text" id="input-phone" name="phone3" value="${memberVo.phone3 }">
						<span id="phoneMsg"></span>
					</li>
					<li>
						<button type="button" id="button-gradient">수정하기</button>
					</li>
					<li>
						<a href="deletePwd.do" id="link-deleteAccount">
							<span name="withdraw" id="span-deleteAccount">회원탈퇴 ></span>
						</a>
					</li>
				</ul>
			</div>
		</form>
	</section>
	<footer>
		<jsp:include page="../main/footer.jsp"></jsp:include>
	</footer>
</body>
</html>