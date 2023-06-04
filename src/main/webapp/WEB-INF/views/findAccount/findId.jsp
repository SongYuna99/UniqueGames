<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>findAccount</title>
<link rel="stylesheet" href="http://localhost:9000/uniquegames/css/login.css">
<script src="http://localhost:9000/uniquegames/js/jquery-3.6.4.min.js"></script>
<script>
//JavaScript 코드
document.addEventListener('DOMContentLoaded', function() {
    // URL에서 selectedTab 파라미터 값을 가져옴
    var urlParams = new URLSearchParams(window.location.search);
    var selectedTab = urlParams.get('selectedTab');
    
    
    // 선택한 탭을 표시
    if (selectedTab) {
        document.getElementById(selectedTab).checked = true;
    }
});

	let c = "${find_result }";
	if(c == "fail"){
		alert("등록된 회원정보가 없습니다");
	}
</script>
<script>
	$(document).ready(function(){
		 
	$("#button-gradient").click(function(){
			
			if($("input[name='name']").val()==""){
				alert("이름을 입력해주세요");
				$("input[name='name']").focus();
				return false;
			}else if($("input[name='phone_num']").val()==""){
				alert("휴대전화를 입력해주세요");
				$("input[name='phone_num']").focus();
				return false;
			}else {
				$.ajax({
					url : "findId_check.do?name="+$("input[name='name']").val()+"&phone_num="+$("input[name='phone_num']").val(),
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
		
	$("#button-gradient-findPwd").click(function(){
			
			if($("input[name='member_id']").val()==""){
				alert("아이디를 입력해주세요");
				$("input[name='member_id']").focus();
				return false;
			}else if($("#input-common-name").val()==""){
				alert("이름을 입력해주세요");
				$("#input-common-name").focus();
				return false;
			}else if($("#input-common-phone").val()==""){
				alert("휴대전화를 입력해주세요");
				$("#input-common-phone").focus();
				return false;
			}else {
				findPwdForm.submit();
			}
		});
	
		/* $("#button-gradient1").click(function(){
			
			if($("input[name='member_id']").val()==""){
				alert("아이디를 입력해주세요");
				$("input[name='member_id']").focus();
				return false;
			}else if($("#input-common-phone").val()==""){
				alert("휴대전화를 입력해주세요");
				$("#input-common-phone").focus();
				return false;
			}else {
				$.ajax({
					url : "findPwd_check.do?member_id="+$("input[name='member_id']").val()+"&phone_num="+$("#input-common-phone").val(),
					success : function(result) {
						if(result=="") {
							$("#modal2").show();
							$("#agreement-content1").html($(".find-pwd-none").html());
						}else {
							$("#modal2").show();
							$("#find-pwd-result").html(result);
							$("#agreement-content1").html($(".deleteComplete1").html());
						}
					}
				});
			}
		}); */
		/* 아이디 찾기
		$("input[name='name']").blur(function(){
			
			if($("input[name='name']").val()=="") {
				$("#msgName").text("필수항목입니다").css("color","red").css("font-size","11px").css("display","block");
			}else {
				$("#msgName").css("display","none");
			}
			
		});
		
		$("input[name='phone_num']").blur(function(){
			
			if($("input[name='phone_num']").val()==""){
				$("#msgPhone").text("필수항목입니다").css("color","red").css("font-size","11px").css("display","block");
			}else {
				$("#msgPhone").css("display","none");
			}
		});
		
		//비밀번호 찾기
		
		$("input[name='member_id']").blur(function(){
			
			if($("input[name='member_id']").val()=="") {
				$("#msgId").text("필수항목입니다").css("color","red").css("font-size","11px").css("display","block");
			}else {
				$("#msgId").css("display","none");
			}
			
		});
		
		$("#input-common-name").blur(function(){
			
			if($("#input-common-name").val()==""){
				$("#msgName1").text("필수항목입니다").css("color","red").css("font-size","11px").css("display","block");
			}else {
				$("#msgName1").css("display","none");
			}
		});
		
		$("#input-common-phone").blur(function(){
			
			if($("#input-common-phone").val()==""){
				$("#msgPhone1").text("필수항목입니다").css("color","red").css("font-size","11px").css("display","block");
			}else {
				$("#msgPhone1").css("display","none");
			}
		});
		*/
		
		
		$(document).on("click", "#button-gradient-gotoFind", function(event){

			$("#modal2").hide();
			$("input[name='name']").val("").focus();
			$("input[name='member_id']").val("").focus();
			$("input[name='phone_num']").val("");
			
			
			});
		
		$(document).on("click", "#button-gradient-gotoPwd", function(event){

			$("#modal2").hide();
			location.href="http://localhost:9000/uniquegames/findId.do?selectedTab=findPwd";
			
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
		<p id="intro">개인 회원</p>
			<input id="findId" type="radio" name="findAccount" checked>
			<label for="findId" id="findId-tab">아이디 찾기</label>
			<input id="findPwd" type="radio" name="findAccount">
			<label for="findPwd" id="findPwd-tab">비밀번호 찾기</label>
			
			<form action="findId_check.do" name="findIdForm" method="post" id="findIdForm">
				<ul>
					<li>
						<input type="text" id="input-common" name="name" placeholder="이름">
						<span id="msgName"></span>
					</li>
					<li>
						<input type="text" id="input-common" name="phone_num" placeholder="휴대전화">
						<span id="msgPhone"></span>
					</li>
					<li>
						<button type="button" id="button-gradient">아이디 찾기</button>
					</li>
				</ul>
			</form>
			
			<form action="findPwd_check.do" name="findPwdForm" method="post" id="findPwdForm">
				<p id="intro-2">비밀번호를 찾으려는 아이디</p>
				<ul>
					<li>
						<input type="text" id="input-common" name="member_id" placeholder="아이디">
						<span id="msgId"></span>
					</li>
					<li>
						<input type="text" id="input-common-name" name="name" placeholder="이름">
						<span id="msgName1"></span>
					</li>
					<li>
						<input type="text" id="input-common-phone" name="phone_num" placeholder="휴대전화">
						<span id="msgPhone1"></span>
					</li>
					<li>
						<button type="button" id="button-gradient-findPwd">비밀번호 찾기</button>
					</li>
				</ul>
			</form>
	</section>
	
	<div id="modal2">
		<div class="agreement2" id="agreement-findId">
			<div id="agreement-content1">
			</div>
		</div>
	</div>
	
	<div class="deleteComplete">
		<p id="agreement-title">아이디 찾기</p>
		<span id="delete-span">아이디 : 
		<span id="find-id-result"></span>
		</span>
		<ul>
			<li>
				<button type="button" id="button-gradient-gotoLogin" name="btn-agreement">로그인 하러가기</button>
				<button type="button" id="button-gradient-gotoPwd" name="btn-agreement">비밀번호 찾기</button>
			</li>
		</ul>
	</div>
	<div class="find-id-none">
		<p id="agreement-title">아이디 찾기</p>
		<span id="delete-span">등록된 아이디가 없습니다</span>
		<ul>
			<li>
				<button type="button" id="button-gradient-gotoFind" name="btn-agreement">다시입력</button>
				<button type="button" id="button-gradient-gotoJoin" name="btn-agreement">회원가입</button>
			</li>
		</ul>
	</div>
	
	<div class="deleteComplete1">
		<p id="agreement-title">비밀번호 찾기</p>
		<span id="delete-span">비밀번호 : 
		<span id="find-pwd-result"></span>
		</span>
		<ul>
			<li>
			<button type="button" id="button-gradient-gotoFind" name="btn-agreement">다시입력</button>
				<button type="button" id="button-gradient-gotoLogin" name="btn-agreement">로그인 하러가기</button>
			</li>
		</ul>
	</div>
	<div class="find-pwd-none">
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