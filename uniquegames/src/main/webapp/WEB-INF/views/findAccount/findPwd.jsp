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
		
	$("#button-gradient").click(function(){
			
			if($("input[name='member_id']").val()==""){
				alert("아이디를 입력해주세요");
				$("input[name='member_id']").focus();
				return false;
			}else if($("input[name='phone_num']").val()==""){
				alert("휴대전화를 입력해주세요");
				$("input[name='phone_num']").focus();
				return false;
			}else {
				$.ajax({
					url : "findPwd_check.do?member_id="+$("input[name='member_id']").val()+"&phone_num="+$("input[name='phone_num']").val(),
					success : function(result) {
						if(result=="") {
							$("#modal2").show();
							$("#agreement-content1").html($(".find-id-none").html());
						}else {
							$("#modal2").show();
							$("#find-id-result").html(result);
							$("#agreement-content1").html($(".deleteComplete").html());
						}
					}
				});
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
		
		$(document).on("click", "#button-gradient-gotoFind", function(event){

			$("#modal2").hide();
			$("input[name='member_id']").val("").focus();
			$("input[name='phone_num']").val("");
			
			});
		
		$(document).on("click", "#button-gradient-gotoLogin", function(event){

			$("#modal2").hide();
			location.href="http://localhost:9000/uniquegames/login.do";
			
			});
		
		$(document).on("click", "#button-gradient-gotoJoin", function(event){

			$("#modal2").hide();
			location.href="http://localhost:9000/uniquegames/join.do";
			
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
						<form action="findPwd_check.do" name="findPwdForm" method="get">
							<p id="intro-2">비밀번호를 찾으려는 아이디</p>
							<ul>
								<li>
									<input type="text" id="input-common" name="member_id" placeholder="아이디">
									<span id="msgId"></span>
								</li>
								<li>
									<input type="text" id="input-common" name="phone_num" placeholder="휴대전화">
									<span id="msgPhone"></span>
								</li>
								<li>
									<button type="button" id="button-gradient">비밀번호 찾기</button>
								</li>
							</ul>
						</form>
					</div>
				</div>
			</div>
	</section>
	
	<div id="modal2">
		<div class="agreement2" id="agreement">
			<div id="agreement-content1">
			</div>
		</div>
	</div>
	
	<div class="deleteComplete">
		<p id="agreement-title">비밀번호 찾기</p>
		<span id="delete-span">회원님의 비밀번호는
		<span id="find-id-result"></span>입니다
		</span>
		<ul>
			<li>
			<button type="button" id="button-gradient-gotoFind" name="btn-agreement">다시입력</button>
				<button type="button" id="button-gradient-gotoLogin" name="btn-agreement">로그인 하러가기</button>
			</li>
		</ul>
	</div>
	<div class="find-id-none">
		<p id="agreement-title">비밀번호 찾기</p>
		<span id="delete-span">등록된 회원정보가 없습니다</span>
		<ul>
			<li>
				<button type="button" id="button-gradient-gotoFind" name="btn-agreement">다시입력</button>
				<button type="button" id="button-gradient-gotoJoin" name="btn-agreement">회원가입</button>
			</li>
		</ul>
	</div>
	
	<footer>
		<jsp:include page="../main/footer.jsp"></jsp:include>
	</footer>
</body>
</html>