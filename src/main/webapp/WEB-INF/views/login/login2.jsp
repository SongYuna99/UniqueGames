<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>로그인</title>
	<link rel="stylesheet" href="http://localhost:9000/uniquegames/css/login.css">
	<script src="http://localhost:9000/uniquegames/js/jquery-3.6.4.min.js"></script>
	<script src="https://t1.kakaocdn.net/kakao_js_sdk/v1/kakao.min.js"></script>
	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
	<script>
		$(document).ready(function(){

			$("#button-gradient").click(function(){
				
				if($("input[name='member_id']").val()=="") {
					alert("아이디를 입력해주세요");
					$("input[name='member_id']").focus();
					return false;
				}else if($("input[name='password']").val()=="") {
					alert("비밀번호를 입력해주세요");
					$("input[name='password']").focus();
					return false;
				}else{
					loginForm.submit();
				}
			});
			
			$("#button-gradient-company-login").click(function(){
				
				if($("input[name='company_id']").val()=="") {
					alert("아이디를 입력해주세요");
					$("input[name='company_id']").focus();
					return false;
				}else if($("#input-common-p").val()=="") {
					alert("비밀번호를 입력해주세요");
					$("#input-common-p").focus();
					return false;
				}else{
					loginCompanyForm.submit();
				}
				
			});
			
			$("input[name='id']").blur(function(){
				
				if($("input[name='member_id']").val()=="") {
					$("#msgId").text("필수항목입니다").css("color","red").css("font-size","11px").css("display","block");
				}else {
					$("#msgId").css("display","none");
				}
				
			});
			
			$("input[name='password']").blur(function(){
				
				if($("input[name='password']").val()==""){
					$("#msgPwd").text("필수항목입니다").css("color","red").css("font-size","11px").css("display","block");
				}else {
					$("#msgPwd").css("display","none");
				}
			});
				
		});
		
		let join_individual = "${join_individual_result }";
		if(join_individual=="success"){
			alert("개인 회원가입 성공");
		}
		
		let join_company = "${join_company_result }";
		if(join_company=="success"){
			alert("법인 회원가입 성공");
		}
		
		let login = "${login_result }";
		if(login=="fail"){
			alert("로그인 실패");
		}
		
	</script>
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
	<section id="content-1"><!-- login-content -->
		<p id="intro">로그인</p>
		<input id="individual-login" type="radio" name="loginSelect" checked>
		<label for="individual-login" id="individual-login-tab">개인 회원</label>
		<input id="company-login" type="radio" name="loginSelect">
		<label for="company-login" id="company-login-tab">법인 회원</label>
		
		<form action="login2.do?redirectURL=${param.redirectURL}" name="loginForm" method="post" id="individual-loginForm">
			<div>
				<ul>
					<li>
						<input type="text" id="input-common" name="member_id" placeholder="아이디" value="${member.member_id}">
						<span id="msgId"></span>
					</li>
					<li>
						<input type="password" id="input-common" name="password" placeholder="비밀번호" size="15" value="${member.password}">
						<span id="msgPwd"></span>
					</li>
					<li>
						<button type="button" id="button-gradient">LOGIN</button>
					</li>
					<li>
						<a href="findId.do" id="link-findAccount">아이디 찾기</a>
						<a href="findId.do?selectedTab=findPwd" id="link-findAccount">비밀번호 찾기</a>
					</li>
				</ul>
			</div>
		</form>
		
		<form action="login2.do?redirectURL=${param.redirectURL}" name="loginCompanyForm" method="post" id="company-loginForm">
			<div>
				<ul>
					<li>
						<input type="text" id="input-common" name="company_id" placeholder="법인 아이디" value="${company.company_id}">
						<span id="msgId"></span>
					</li>
					<li>
						<input type="password" id="c-input-common" name="password" placeholder="비밀번호" size="15" value="${company.password}">
						<span id="msgPwd"></span>
					</li>
					<li>
						<button type="button" id="button-gradient-company-login">LOGIN</button>
					</li>
					<li>
						<a href="findCompany.do" id="link-findAccount">아이디 찾기</a>
						<a href="findCompany.do?selectedTab=findPwd" id="link-findAccount">비밀번호 찾기</a>
					</li>
				</ul>
			</div>
		</form>
		
			<div>
				<ul>
					<li>
						<a href="/uniquegames/join.do" id="link-signUp">
							<span>Sign Up</span></a>
						<a href="join.do?selectedTab=company" id="link-signUp">Company Sign Up</a>
					</li>
				</ul>
			</div>
		
	</section>
	<footer>
		<jsp:include page="../main/footer.jsp"></jsp:include>
	</footer>
</body>
</html>