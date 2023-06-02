<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	
	<form action="newPassword.do" name="newPassword" method="post" id="newPasswordForm">
				<ul>
					<li>
						<input type="text" id="input-common" name="Npassword" placeholder="새로운 비밀번호">
					</li>
					<li>
						<input type="text" id="input-common" name="Npassword-check" placeholder="새로운 비밀번호 확인">
						<span id="msgPassword"></span>
					</li>
					<li>
						<button type="button" id="button-gradient">수정하기</button>
					</li>
				</ul>
	</form>

</body>
</html>