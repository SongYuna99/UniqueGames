<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>findAccount</title>
<link rel="stylesheet" href="http://localhost:9000/uniquegames/css/login.css">
<script src="http://localhost:9000/uniquegames/js/jquery-3.6.4.min.js"></script>
<script>
	$(document).ready(function(){
		
		$("#tab-menu li").find("a").click(function(){
			location.href="findId.do";
		});
		
		$("#button-gradient1").click(function(){
			
			if($("input[name='id']").val()==""){
				alert("아이디를 입력해주세요");
				$("input[name='id']").focus();
				return false;
			}else if($("input[name='phone']").val()==""){
				alert("휴대전화를 입력해주세요");
				$("input[name='phone']").focus();
				return false;
			}else {
				findPwdForm.submit();
			}
		});
		
		$("input[name='id']").blur(function(){
			
			if($("input[name='id']").val()=="") {
				$("#msgId").text("필수항목입니다").css("color","red").css("font-size","11px").css("display","block");
			}else {
				$("#msgId").css("display","none");
			}
			
		});
		
		$("input[name='phone']").blur(function(){
			
			if($("input[name='phone']").val()==""){
				$("#msgPhone").text("필수항목입니다").css("color","red").css("font-size","11px").css("display","block");
			}else {
				$("#msgPhone").css("display","none");
			}
		});
		
	})

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
	<section id="content-1"><!-- find-id -->
		<p id="intro">아이디/비밀번호 찾기</p>
			<div id="tab-content">
				<ul id="tab-menu">
					<li><a href="#">아이디 찾기</a></li>
					<li><a href="#" class="active">비밀번호 찾기</a></li>
				</ul>
				<div id="tab-context">
					<div id="find-pwd">
						<form action="#" name="findPwdForm" method="get">
							<p id="intro-2">비밀번호를 찾으려는 아이디</p>
							<ul>
								<li>
									<input type="text" id="input-common" name="id" placeholder="아이디">
									<span id="msgId"></span>
								</li>
								<li>
									<input type="text" id="input-common" name="phone" placeholder="휴대전화">
									<span id="msgPhone"></span>
								</li>
								<li>
									<button type="button" id="button-gradient1">비밀번호 찾기</button>
								</li>
							</ul>
						</form>
					</div>
				</div>
			</div>
	</section>
	<footer>
		<jsp:include page="../main/footer.jsp"></jsp:include>
	</footer>
</body>
</html>