<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="http://localhost:9000/uniquegames/css/login.css">
</head>
<body>
	<header>
		<jsp:include page="../main/header.jsp"></jsp:include>	
	</header>
	<section id="top-bg">
		<div id="base-layer">
			<div id="top-bg-textarea">
				<p id="top-title">Login</p>
				<p id="top-subtitle">#로그인</p>
			</div>
		</div>
	</section>
	<section id="content-1">
		<p id="intro">법인 회원</p>
		<form action="cChangePassword.do" name="cchangePassword" method="post" id="newPasswordForm">
			<ul>
				<li>
					<input type="password" id="input-common" name="cnewpassword" placeholder="새로운 비밀번호">
					<input type="hidden" name="company_id" value="${company_id }">
				</li>
				<li>
					<input type="password" id="input-common" name="cnewpassword-check" placeholder="새로운 비밀번호 확인">
					<span id="msgPassword"></span>
				</li>
				<li>
					<button type="button" id="button-gradient">수정하기</button>
				</li>
			</ul>
		</form>
	</section>
	<footer>
		<jsp:include page="../main/footer.jsp"></jsp:include>
	</footer>
</body>
</html>