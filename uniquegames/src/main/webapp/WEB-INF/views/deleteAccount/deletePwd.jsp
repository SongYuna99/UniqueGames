<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원탈퇴</title>
	<link rel="stylesheet" href="http://localhost:9000/uniquegames/css/login.css">ss">
	<script src="http://localhost:9000/uniquegames/js/jquery-3.6.4.min.js"></script>
	<script>
	
		$(document).ready(function(){
			
			$("#button-gradient-delete").click(function(){
				if($("input[name='pwd']").val()==""){
					alert("비밀번호를 입력해주세요");
					$("input[name='pwd']").focus();
					return false;
				}else if($("#selectbox-find").val()=="default"){
					alert("탈퇴 사유를 선택해주세요");
					$("#selectbox-find").focus();
					return false;
				}else {
					$("#modal2").show();
					
					$("#agreement-content1").html($(".deleteComplete").html());
				}	
			});
			
		$("input[name='pwd']").blur(function(){
				
				if($("input[name='pwd']").val()==""){
					$("#msgPwd").text("필수항목입니다").css("color","red").css("font-size","11px").css("display","block");
				}else {
					$("#msgPwd").css("display","none");
				}
			});
		
		$(document).on("click", "#button-gradient", function(event){
			$("#modal2").hide();
			location.href="../main/index.html";
			
			});
		
		
		
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
				<p id="top-title">My Page</p>
				<p id="top-subtitle">#마이페이지</p>
			</div>
		</div>
	</section>
	<section id="content-1">
		<p id="intro">회원탈퇴</p>
		<form action="#" name="loginForm" method="get"><!-- findIdForm -->
			<div>
				<p id="intro-1">탈퇴 사유</p>
				<ul>
					<li>
						<select id="selectbox-find">
							<option value="default">사유를 선택해주세요</option>
							<option value="1">너무 많은 시간을 소비해서</option>
							<option value="2">서비스가 좋지 않아서</option>
							<option value="3">타 사이트가 더 좋아서</option>
							<option value="4">삭제하고싶은 내용이 있어서</option>
							<option value="5">사용빈도가 너무 적어서</option>
							<option value="6">콘텐츠 불만</option>
							<option value="7">기타</option>
						</select>
					</li>
					<li>
						<input type="text" id="input-common" name="id" value="UniqueGames" disabled>
					</li>
					<li>
						<input type="text" id="input-common" name="pwd" placeholder="비밀번호">
						<span id="msgPwd"></span>
					</li>
					<li id="goodbye">
						<p id="delete-id">UniqueGames 님!</p>
						<p id="delete-content">회원 탈퇴하려고 하신다니 저희 사이트의 서비스가 많이 부족하고 미흡했나 봅니다.<br>
						불만사항이나 사유를 알려주신다면 적극 반영해서 고객님의 불편함을 해결해드리도록 노력하겠습니다.
						회원 탈퇴시의 아래 사항을 숙지하시기 바랍니다.</p>
						<p id="delete-caution">
						1. 회원 탈퇴 시 고객님의 정보는 모두 삭제됩니다.<br>
						2. 후원하셨던 게임의 후원금을 반환받지 못합니다.<br>
						3. 회원 탈퇴 후 2주간 재가입이 불가능합니다.<br>
						</p>
					</li>
					<li>
						<button type="button" id="button-gradient-delete">회원 탈퇴</button>
					</li>
					
				</ul>
			</div>
			
		
		</form>		
	</section>
	
	<div id="modal2">
		<div class="agreement2" id="agreement">
			<div id="agreement-content1">
			</div>
		</div>
	</div>
	
	<div class="deleteComplete">
		<p id="agreement-title">회원탈퇴</p>
		<span id="delete-span">
		UniqueGames님!<br>
		회원 탈퇴가 정상적으로 완료되었습니다.
		</span>
		<ul>
			<li>
				<button type="button" id="button-gradient" name="btn-agreement">홈으로</button>
			</li>
		</ul>
	</div>
	
	<footer>
		<jsp:include page="../main/footer.jsp"></jsp:include>
	</footer>
</body>
</html>