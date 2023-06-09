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
	<!-- <script src="http://localhost:9000/uniquegames/js/join_jquery.js"></script> -->
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
	
	$(document).ready(function(){
		var password = "${memberVo.password}";
		
		function emailCheck(asValue){
			var regex = /[A-za-z0-9]{4,20}$/;
			
			return regex.test(asValue);
		}
		
		function phoneCheck(asValue) {
			var regex = /^\d{3,4}$/;
			
			return regex.test(asValue);
		}
		
		$("#button-gradient").click(function(){
			
			if($("input[name='password']").val()==""){
				alert("비밀번호를 입력해주세요");
				$("input[name='password']").focus();
				return false;
			}else if($("input[name='password']").val() != password){
				alert("비밀번호가 일치하지 않습니다");
				$("input[name='password']").focus();
				return false;
			}else if($("#input-email1").val()==""){
				alert("이메일은 필수 입력 항목입니다");
				$("input[name='email1']").focus();
				return false;
			}else if(!emailCheck($("#input-email1").val())){
				alert("이메일은 영문 또는 숫자로 4자리 이상 입력해주세요");
				$("input[name='email1']").focus();
				return false;
			}else if($("input[name='email2']").val()=="" && $("#selectbox-email").val()=="choose" || $("input[name='email2']").val()=="" && $("#selectbox-email").val()=="direct"){
				alert("이메일 주소를 전부 작성해주세요");
				$("input[name='email2']").focus();
				return false;
			}else if($("#selectbox-mobile").val()=="choose") {
				alert("통신사를 선택해주세요");
				$("#selectbox-mobile").focus();
				return false;
			}else if($("#selectbox-phone").val()=="choose") {
				alert("휴대전화는 필수 입력 항목입니다");
				$("#selectbox-phone").focus();
				return false;
			}else if($("input[name='phone2']").val()=="") {
				alert("휴대전화는 필수 입력 항목입니다");
				$("input[name='phone2']").focus();
				return false;
			}else if(!phoneCheck($("input[name='phone2']").val())) {
				alert("휴대전화는 숫자 3,4자리로 입력해주세요");
				$("input[name='phone2']").focus();
				return false;
			}else if($("input[name='phone3']").val()=="") {
				alert("휴대전화는 필수 입력 항목입니다");
				$("input[name='phone3']").focus();
				return false;
			}else if(!phoneCheck($("input[name='phone3']").val())) {
				alert("휴대전화는 숫자 3,4자리로 입력해주세요");
				$("input[name='phone3']").focus();
				return false;
			}else {
				myPageForm.submit();
			}
		});
		
		$("#selectbox-email").change(function(){
			
			if($("#selectbox-email").val()=="choose") {
				$("input[name='email2']").val("");
				$("#emailMsg").text("이메일을 선택해주세요").css("color","red").css("font-size","11px").css("display","block");
				$("#selectbox-email").focus();
				return false;
			}else if($("#selectbox-email").val()=="direct") {
				$("input[name='email2']").val("").focus();
			}else {
				$("input[name='email2']").val($("#selectbox-email").val());
			}
		});
		
		$("#pwd-check-img").change(function(){

			if($("#pwd-check-img").is(":checked") == false) {
				$("input[name='password']").attr("type","password");
			}else if($("#pwd-check-img").is(":checked") == true) {
				$("input[name='password']").attr("type","text");
			}
			
		});
		
		$("#pwd-check-img-1").change(function(){

			if($("#pwd-check-img-1").is(":checked") == false) {
				$("input[name='password-check']").attr("type","password");
			}else if($("#pwd-check-img-1").is(":checked") == true) {
				$("input[name='password-check']").attr("type","text");
			}
			
		});
		
		/*change password link click*/
		$("#link-changePassword").click(function(){
			
			if($("input[name='password']").val()==""){
				alert("비밀번호를 입력해주세요");
				$("input[name='password']").focus();
				return false;
			}else if($("input[name='password']").val() != password){
				alert("비밀번호가 일치하지 않습니다");
				$("input[name='password']").focus();
				return false;
			}
		});
		
		$("#address-btn-style").click(function(){
			 new daum.Postcode({
			        oncomplete: function(data) {
			        	$("input[name='addr1']").val("("+data.zonecode+") "+data.address);
			        	$("input[name='addr2']").focus();
			        }
			    }).open();
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
		<p id="intro">마이페이지</p>
		<form action="myPage_proc.do" name="myPageForm" method="post" id="content-myPage">
			<div>
				<ul>
					<li id="must-insert">
						<p id="label-dot">*</p>
						<label>아이디</label>
					</li>
					<li>
						<input type="text" id="input-common" name="member_id" value="${memberVo.member_id }" disabled>
						<input type="hidden" name="member_id" value="${memberVo.member_id }">
					</li>
					<li id="must-insert">
						<p id="label-dot">*</p>
						<label>비밀번호</label>
					</li>
					<li>
						<input type="password" id="input-common" name="password">
						<input type="checkbox" id="pwd-check-img">
					</li>
					<li>
						<a href="myPageChangePassword.do?member_id=${memberVo.member_id }" id="link-changePassword">
							<span>비밀번호 변경 ></span>
						</a>
					</li>
					<li id="must-insert">
						<p id="label-dot">*</p>
						<label>이름</label>
					</li>
					<li>
						<input type="text" id="input-common" name="name" value="${memberVo.name }" disabled>
					</li>
					<li id="must-insert">
						<p id="label-dot">*</p>
						<label>이메일</label>
					</li>
					<li>
						<input type="text" id="input-email" name="email1" value="${memberVo.email1 }">
						@
						<input type="text" id="input-email" name="email2" value="${memberVo.email2 }">
						<select name="email3" id="selectbox-email">
							<option value="choose">선택</option>
							<option value="naver.com" ${memberVo.email3  == 'naver.com' ? 'selected' : ''}>naver.com</option>
							<option value="gmail.com" ${memberVo.email3  == 'gmail.com' ? 'selected' : ''}>gmail.com</option>
							<option value="daum.net" ${memberVo.email3  == 'daum.net' ? 'selected' : ''}>daum.net</option>
							<option value="direct">직접입력</option>
						</select>
						<span id="emailMsg"></span>
					</li>
					<li>
						<label>주소</label>
					</li>
					<li>
						<input type="text" id="input-addr1" name="addr1" value="${memberVo.addr1 }">
						<button type="button" id="address-btn-style">검색</button>
					</li>
					<li>
						<label>상세 주소</label>
					</li>
					<li>
						<input type="text" id="input-common" name="addr2" value="${memberVo.addr2 }">
					</li>
					<li id="must-insert">
						<p id="label-dot">*</p>
						<label>휴대전화</label>
					</li>
					<li>
						<select name="tel" id="selectbox-mobile">
							<option value="choose">선택</option>
							<option value="SKT" ${memberVo.tel == 'SKT' ? 'selected' : '' }>SKT</option>
							<option value="KT" ${memberVo.tel == 'KT' ? 'selected' : '' }>KT</option>
							<option value="LGU+" ${memberVo.tel == 'LGU+' ? 'selected' : '' }>LGU+</option>
							<option value="MVNO" ${memberVo.tel == 'MVNO' ? 'selected' : '' }>알뜰폰</option>
						</select>
						<select name="phone1" id="selectbox-phone">
							<option value="choose">선택</option>
							<option value="010" ${memberVo.phone1 == '010' ? 'selected' : ''}>010</option>
    						<option value="011" ${memberVo.phone1 == '011' ? 'selected' : ''}>011</option>
    						<option value="012" ${memberVo.phone1 == '012' ? 'selected' : ''}>012</option>
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
						<a href="deletePwd.do?member_id=${memberVo.member_id }" id="link-deleteAccount">
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