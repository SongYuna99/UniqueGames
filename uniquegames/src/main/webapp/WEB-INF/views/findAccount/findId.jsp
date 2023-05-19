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
			location.href="findPwd.do";
		});
		
		$("#button-gradient").click(function(){
			
			if($("input[name='name']").val()==""){
				alert("이름을 입력해주세요");
				$("input[name='name']").focus();
				return false;
			}else if($("input[name='phone']").val()==""){
				alert("휴대전화를 입력해주세요");
				$("input[name='phone']").focus();
				return false;
			}else {
				findIdForm.submit();
			}
		});
		
		$("input[name='name']").blur(function(){
			
			if($("input[name='name']").val()=="") {
				$("#msgName").text("필수항목입니다").css("color","red").css("font-size","11px").css("display","block");
			}else {
				$("#msgName").css("display","none");
			}
			
		});
		
		$("input[name='phone']").blur(function(){
			
			if($("input[name='phone']").val()==""){
				$("#msgPhone").text("필수항목입니다").css("color","red").css("font-size","11px").css("display","block");
			}else {
				$("#msgPhone").css("display","none");
			}
		});
		
		function phoneCheck(asValue){
			
		}
		
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
					<li><a href="#" class="active">아이디 찾기</a></li>
					<li><a href="#">비밀번호 찾기</a></li>
				</ul>
				<div id="find-id">
					<form action="#" name="findIdForm" method="get">
						<ul>
							<li>
								<input type="text" id="input-common" name="name" placeholder="이름">
								<span id="msgName"></span>
							</li>
							<li>
								<input type="text" id="input-common" name="phone" placeholder="휴대전화">
								<span id="msgPhone"></span>
							</li>
							<li>
								<button type="button" id="button-gradient">아이디 찾기</button>
							</li>
						</ul>
					</form>
				</div>
			</div>
	</section>
	<footer>
		<jsp:include page="../main/footer.jsp"></jsp:include>
	</footer>
</body>
</html>