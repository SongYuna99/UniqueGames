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
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
	
	$(document).ready(function(){
		var password = "${companyVo.password}";
		
		$("#button-gradient-company").click(function(){
			
			if($("input[name='company_id']").val()==""){
				alert("회사 아이디는 필수 입력 항목입니다");
				$("input[name='company_id']").focus();
				return false;
			}else if($("#company-password").val()==""){
				alert("비밀번호는 필수 입력 항목입니다");
				$("#company-password").focus();
				return false;
			}else if($("#company-password").val() != password){
				alert("비밀번호가 일치하지 않습니다");
				$("#company-password").focus();
				return false;
			}else if($("#company-name").val()==""){
				alert("회사명은 필수 입력 항목입니다");
				$("#company-name").focus();
				return false;
			}else if($("#company-email1").val()==""){
				alert("이메일은 필수 입력 항목입니다");
				$("#company-email1").focus();
				return false;
			}else if(!emailCheck($("#company-email1").val())){
				alert("이메일은 영문 또는 숫자로 4자리 이상 입력해주세요");
				$("#company-email1").focus();
				return false;
			}else if($("#company-email2").val()=="" && $("#company-selectbox-email").val()=="choose" || $("#company-email2").val()=="" && $("#company-selectbox-email").val()=="direct"){
				alert("이메일 주소를 전부 작성해주세요");
				$("#company-email2").focus();
				return false;
			}else if($("#company-selectbox-mobile").val()=="choose") {
				alert("통신사를 선택해주세요");
				$("#selectbox-mobile").focus();
				return false;
			}else if($("#company-selectbox-phone").val()=="choose") {
				alert("대표 전화는 필수 입력 항목입니다");
				$("#company-selectbox-phone").focus();
				return false;
			}else if($("#company-phone2").val()=="") {
				alert("대표 전화는 필수 입력 항목입니다");
				$("#company-phone2").focus();
				return false;
			}else if(!phoneCheck($("#company-phone2").val())) {
				alert("대표 전화는 숫자 3,4자리로 입력해주세요");
				$("#company-phone2").focus();
				return false;
			}else if($("#company-phone3").val()=="") {
				alert("대표 전화는 필수 입력 항목입니다");
				$("input[name='phone3']").focus();
				return false;
			}else if(!phoneCheck($("#company-phone3").val())) {
				alert("대표 전화는 숫자 3,4자리로 입력해주세요");
				$("#company-phone3").focus();
				return false;
			}else {
				companyMyPageForm.submit();
			}
		});
		
		$("#company-selectbox-email").change(function(){
			
			if($("#company-selectbox-email").val()=="choose") {
				$("#company-email2").val("");
				$("#emailMsg").text("이메일을 선택해주세요").css("color","red").css("font-size","11px").css("display","block");
				$("#company-selectbox-email").focus();
				return false;
			}else if($("#company-selectbox-email").val()=="direct") {
				$("#company-email2").val("").focus();
			}else {
				$("#company-email2").val($("#company-selectbox-email").val());
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
		
		
		$("#company-address-btn-style").click(function(){
			 new daum.Postcode({
			        oncomplete: function(data) {
			        	$("#company-addr1").val("("+data.zonecode+") "+data.address);
			        	$("#company-addr2").focus();
			        }
			    }).open();
		});
		
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
		
		function emailCheck(asValue){
			var regex = /[A-za-z0-9]{4,20}$/;
			
			return regex.test(asValue);
		}
		
		function phoneCheck(asValue) {
			var regex = /^\d{3,4}$/;
			
			return regex.test(asValue);
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
				<p id="top-title">My Page</p>
				<p id="top-subtitle">#마이페이지</p>
			</div>
		</div>
	</section>
	<section id="content-1">
		<p id="intro">마이페이지</p>
		<form action="companyMyPage_proc.do" name="companyMyPageForm" method="post" id="content-myPage">
			<div>
				<ul>
					<li id="must-insert">
						<p id="label-dot">*</p>
						<label>회사 아이디</label>
					</li>
					<li>
						<input type="text" id="input-common" name="company_id" value="${companyVo.company_id }" disabled>
						<input type="hidden" name="company_id" value="${companyVo.company_id }">
					</li>
					<li>
						<label>게임명</label>
					</li>
					<li>
						<input type="text" id="input-common" name="game" value="${companyVo.game }" disabled>
					</li>
					<li id="must-insert">
						<p id="label-dot">*</p>
						<label>비밀번호</label>
					</li>
					<li>
						<input type="password" id="company-password" name="password">
						<input type="checkbox" id="pwd-check-img">
						<span id="c-pwdMsg"></span>
					</li>
					<li>
						<a href="CompanyPageChangePassword.do?company_id=${companyVo.company_id }" id="link-changePassword">
							<span>비밀번호 변경 ></span>
						</a>
					</li>
					<li id="must-insert">
						<p id="label-dot">*</p>
						<label>이름</label>
					</li>
					<li>
						<input type="text" id="company-name" name="name" value="${companyVo.name }">
					</li>
					<li id="must-insert">
						<p id="label-dot">*</p>
						<label>이메일</label>
					</li>
					<li>
						<input type="text" id="company-email1" name="email1" value="${companyVo.email1 }">
						@
						<input type="text" id="company-email2" name="email2" value="${companyVo.email2 }">
						<select id="company-selectbox-email" name="email3">
							<option value="choose">선택</option>
							<option value="naver.com" ${companyVo.email3  == 'naver.com' ? 'selected' : ''}>naver.com</option>
							<option value="gmail.com" ${companyVo.email3  == 'gmail.com' ? 'selected' : ''}>gmail.com</option>
							<option value="daum.net" ${companyVo.email3  == 'daum.net' ? 'selected' : ''}>daum.net</option>
							<option value="direct">직접입력</option>
						</select>
						<span id="c-emailMsg"></span>
					</li>
					<li>
						<label>주소</label>
					</li>
					<li>
						<input type="text" id="company-addr1" name="addr1" value="${companyVo.addr1 }">
						<button type="button" id="company-address-btn-style">주소 검색</button>
					</li>
					<li class="address-input">
						<label>상세 주소</label>
					</li>
					<li>
						<input type="text" id="company-addr2" name="addr2" value="${companyVo.addr2 }">
					</li>
					<li id="must-insert">
						<p id="label-dot">*</p>
						<label>휴대전화</label>
					</li>
					<li>
						<select name="tel" id="company-selectbox-mobile">
							<option value="choose">선택</option>
							<option value="SKT" ${companyVo.tel == 'SKT' ? 'selected' : '' }>SKT</option>
							<option value="KT" ${companyVo.tel == 'KT' ? 'selected' : '' }>KT</option>
							<option value="LGU+" ${companyVo.tel == 'LGU+' ? 'selected' : '' }>LGU+</option>
							<option value="MVNO" ${companyVo.tel == 'MVNO' ? 'selected' : '' }>알뜰폰</option>
						</select> 
						<select name="phone1" id="company-selectbox-phone">
							<option value="choose">선택</option>
							<option value="010" ${companyVo.phone1 == '010' ? 'selected' : ''}>010</option>
    						<option value="011" ${companyVo.phone1 == '011' ? 'selected' : ''}>011</option>
    						<option value="012" ${companyVo.phone1 == '012' ? 'selected' : ''}>012</option>
						</select>
						-
						<input type="text" id="company-phone2" name="phone2" value="${companyVo.phone2 }">
						-
						<input type="text" id="company-phone3" name="phone3" value="${companyVo.phone3 }">
						<span id="c-phoneMsg"></span>
					</li>
					<li>
						<button type="button" id="button-gradient-company">수정하기</button>
					</li>
					<li>
						<a href="donation_detail.do" id="link-donation">
							<span id="span-deleteAccount">후원금 정산 내역 ></span>
						</a>
						<a href="deletePwd.do?company_id=${companyVo.company_id }" id="link-deleteAccount">
							<span id="span-deleteAccount">회원탈퇴 ></span>
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