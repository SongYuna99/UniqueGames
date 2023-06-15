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
			
			
			$("#individual-loginForm").keypress(function(e){
				if(e.keyCode == 13){
					$("#button-gradient").click();
				}
			});
			
			$("#company-loginForm").keypress(function(e){
				if(e.keyCode == 13){
					$("#button-gradient-company-login").click();
				}
			});
			

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
			
			$("input[name='member_id']").blur(function(){
				
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
		
		document.addEventListener('DOMContentLoaded', function() {
            // URL에서 selectedTab 파라미터 값을 가져옴
            var urlParams = new URLSearchParams(window.location.search);
            var selectedTab = urlParams.get('selectedTab');
            
            // 선택한 탭을 표시
            if (selectedTab) {
                document.getElementById(selectedTab).checked = true;
            }
        });
		
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
		
		<form action="login.do?redirectURL=${param.redirectURL}" name="loginForm" method="post" id="individual-loginForm">
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
						<a href="/uniquegames/join.do" id="link-signUp">
							<span>Sign Up</span></a>
					</li>
				</ul>
			</div>
		</form>
		
		<form action="login.do?redirectURL=${param.redirectURL}" name="loginCompanyForm" method="post" id="company-loginForm">
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
						<a href="join.do?selectedTab=company" id="link-signUp">Company Sign Up</a>
					</li>
				</ul>
			</div>
		</form>
	</section>
	<footer>
		<jsp:include page="../main/footer.jsp"></jsp:include>
	</footer>

	<script>
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

			if (currentURL.endsWith('insertIntro.do')) {
				// 현재 페이지가 insertIntro.do이고 기업회원이 아닌 경우 모달창 표시
				// loginMember 세션 값이 MemberVo 클래스 타입인 경우 모달창 표시
				if (loginMember && loginMember.constructor.name === 'MemberVo') {
					showCompanyMembersOnlyAlert();
				}
			}
		}

		// 페이지 로드 시 loginMember 세션 체크 및 모달창 표시
		window.addEventListener('load', function() {
			checkAccessAndShowModal();
		});


	</script>
</body>
</html>