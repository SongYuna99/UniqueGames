<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Join</title>
	<link rel="stylesheet" href="http://localhost:9000/uniquegames/css/login.css">
	<script src="http://localhost:9000/uniquegames/js/jquery-3.6.4.min.js"></script>
	<script src="http://localhost:9000/uniquegames/js/join_jquery.js"></script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
	let c = "${message }";
	
	if(c == "fail")
		alert("회원가입 실패");
	
	
	</script>
</head>
<body>
	<header>
		<jsp:include page="../main/header.jsp"></jsp:include>
	</header>
	<section id="top-bg">
		<div id="base-layer">
			<div id="top-bg-textarea">
				<p id="top-title">Sign Up</p>
				<p id="top-subtitle">#회원가입</p>
			</div>
		</div>
	</section>
		<section id="content-1">
			<p id="intro">회원가입</p>
			<form action="join_proc.do" name="joinForm" method="post" id="content-2">
				<div>
					<ul>
						<li>
							<p id="label-dot">*</p>
							<label>아이디</label>
						</li>
						<li>
							<input type="text" id="input-id" name="id" placeholder="영문,숫자 5~10자리" tabindex="1">
							<button type="button" id="check-btn-style">중복체크</button>
							<span id="idMsg"></span>
						</li>
						<li>
							<p id="label-dot">*</p>
							<label>비밀번호</label>
						</li>
						<li>
							<input type="password" id="input-common" name="password" placeholder="숫자,영문,특수문자 조합 최소 8자" tabindex="2">
							<input type="checkbox" id="pwd-check-img">
							<span id="pwdMsg"></span>
						</li>
						<li>
							<input type="password" id="input-common" name="password-check" placeholder="비밀번호 재입력" tabindex="3">
							<input type="checkbox" id="pwd-check-img-1">
							<span id="pwdMsg-check"></span>
						</li>
						<li>
							<p id="label-dot">*</p>
							<label>이름</label>
						</li>
						<li>
							<input type="text" id="input-common" name="name" tabindex="4">
							<span id="nameMsg"></span>
						</li>
						<li>
							<p id="label-dot">*</p>
							<label>이메일</label>
						</li>
						<li>
							<input type="text" id="input-email" name="email1" tabindex="5">
							<span>@</span>
							<input type="text" id="input-email" name="email2" tabindex="6">
							<select name="email3" id="selectbox-email" tabindex="7">
								<option value="default">선택</option>
								<option value="naver.com">naver.com</option>
								<option value="gmail.com">gmail.com</option>
								<option value="daum.net">daum.net</option>
								<option value="direct">직접입력</option>
							</select>
							<span id="emailMsg"></span>
						</li>
						<li>
							<label>주소</label>
						</li>
						<li>
							<input type="text" id="input-address" name="addr1" tabindex="8">
							<button type="button" id="address-btn-style" tabindex="9">검색</button>
						</li>
						<li>
							<label>상세 주소</label>
						</li>
						<li>
							<input type="text" id="input-common" name="addr2" tabindex="10">
						</li>
						<li>
							<p id="label-dot">*</p>
							<label>휴대전화</label>
						</li>
						<li>
							<select id="selectbox-mobile" name="tel" tabindex="11">
								<option value="default">선택</option>
								<option value="SKT">SKT</option>
								<option value="KT">KT</option>
								<option value="LGU+">LGU+</option>
								<option value="MVNO">알뜰폰</option>
							</select>
							<select id="selectbox-phone" name="phone1" tabindex="12">
								<option value="default">선택</option>
								<option value="010">010</option>
								<option value="011">011</option>
								<option value="012">012</option>
							</select>
							-
							<input type="text" id="input-phone" name="phone2" tabindex="13">
							-
							<input type="text" id="input-phone" name="phone3" tabindex="14">
							<span id="phoneMsg"></span>
						</li>
					</ul>
					<ul>
						<li id="agreement-box">
							<input type="checkbox" name="agreementAll" id="chk-circle" tabindex="15">
							<span id="span_agreementAll">전체 동의하기</span>
						</li>
						<li>
							<input type="checkbox" id="checkbox-agreement" name="chk-agree">
							<span id="agreement-color">[필수]</span> <span>만 14세 이상입니다.</span>
						</li>
						<li>
							<input type="checkbox" id="checkbox-agreement" name="chk-agree">
							<span id="agreement-color">[필수]</span> <span>이용 약관</span><a id="detail1">자세히</a>
						</li>
						<li>
							<input type="checkbox" id="checkbox-agreement" name="chk-agree">
							<span id="agreement-color">[필수]</span> <span>개인정보 수집 및 이용 동의</span><a id="detail2">자세히</a>
						</li>
						<li>
							<input type="checkbox" id="agreement-choice" name="chk-agree">
							<span id="choice-span">[선택]</span> <span>마케팅 정보 메일, SMS 수신동의</span>
						</li>
						
						<li>
							<button type="submit" id="button-gradient" tabindex="16">가입하기</button>
						</li>
					</ul>
				</div>
			</form>
		</section>
		
		
		<div id="modal">
			<div class="agreement" id="agreement">
				<h1 id="agreement-title">이용 약관</h1>
				<div id="agreement-content">
				</div>
				<button id="button-gradient" name="btn-agreement">확인</button>
			</div>
		</div>
		
		<div class="detail1"> 
		제 1조(목적)
			<br>&nbsp;이 약관은 환경교육포털(이하 “홈페이지”)에서 제공되는 모든 서비스(이하 ‘서비스’라 한다)의 이용조건 및 절차, 
			이용자와 당 홈페이지의 권리, 의무, 책임사항과 기타 필요한 사항을 규정함을 목적으로 합니다.
		<br><br>제 2조(약관의 효력과 변경)
			<br>&nbsp;① 당 홈페이지는 이용자가 본 약관 내용에 동의하는 것을 조건으로 이용자에게 서비스를 제공할 것이며, 
			이용자가 본 약관의 내용에 동의하는 경우, 당 홈페이지의 서비스 제공 행위 및 이용자의 서비스 이용 행위는 본 약관이 
			우선적으로 적용 될 것입니다.
			<br>&nbsp;② 당 홈페이지는 약관의 규제에 관한 법률 및 기타 관련 법령에 위배되지 않는 범위 내에서 본 약관을 변경할 수 있으며, 
			약관이 변경된 경우에는 지체 없이 당 홈페이지 내에 공지함과 동시에 회원가입 시 기입한 이메일을 통해 공지함으로써 이용자가 직접 확인하도록 할 것입니다.
			<br>&nbsp;③ 변경된 약관은 공지와 동시에 그 효력이 발생되며, 이용자가 변경된 약관에 동의하지 아니하는 경우, 
			이용자는 본인의 회원등록을 취소(회원탈퇴)할 수 있습니다. 단, 공지된 이후 이메일 회신 등 별도의 거부의사를 표시하지 아니하고 
			서비스를 7일 이상 계속 사용할 경우에는 약관 변경에 동의한 것으로 간주됩니다. 변경된 약관에 대한 정보를 알지 못해 발생하는 
			이용자의 피해는 당 홈페이지에서 책임지지 않습니다.
		<br><br>제 3조(약관 외 준칙)
			<br>&nbsp;본 약관에 명시되지 않은 사항은 전기통신기본법, 전기통신사업법, 방송통신심의위원회 정보통신에 관한 심의규정, 
			저작권법 및 기타 관계 법령의 규정에 의합니다.
		<br><br>제 4조(용어의 정의)
			<br>&nbsp;본 약관에서 사용하는 용어의 정의는 다음과 같습니다.
			<br>&nbsp;1. 이용자 : 당 홈페이지에 접속하여 당 홈페이지에서 제공하는 서비스를 받는 회원 및 비회원을 말합니다.
			<br>&nbsp;2. 회원 : 당 홈페이지에 접속하여 이 약관에 동의하고, ID(고유번호)와 비밀번호를 발급받은 자로 
			당 홈페이지의 정보 및 서비스를 이용할 수 있는 자를 말합니다.
			<br>&nbsp;3. 비회원 : 회원가입을 하지 않고 당 홈페이지에서 제공하는 서비스를 이용하는 자를 말합니다.
			<br>&nbsp;4. ID(고유번호) : 회원 식별과 회원의 서비스 이용을 위하여 이용자가 선정하고 당 홈페이지에서 승인하는 
			영문자와 숫자의 조합(하나의 ID만 발급, 이용가능)을 말합니다.
			<br>&nbsp;5. 비밀번호 : 회원 아이디와 일치된 회원임을 확인하는 번호로서, 회원의 비밀보호를 
			위해 회원자신이 선정한 문자와 숫자의 조합을 말합니다.
			<br>&nbsp;6. 회원가입 : 회원이 당 홈페이지에서 제공하는 신청서 양식에 해당 정보를 기입하고, 
			본 약관에 동의하여 서비스 이용계약을 완료시키는 행위를 말합니다.
			<br>&nbsp;7. 회원탈퇴 : 회원이 이용계약을 종료시키는 의사표시입니다.
		</div>
		<div class="detail2"> 
		1. 개인정보의 수집·이용 목적 : 홈페이지 관리, 통계
		<br>2. 수집하는 개인정보의 항목 : 성명, 이메일, 계좌번호, 주소
		<br>3. 개인정보의 보유 및 이용 기간 : 구매일로부터 6개월
		<br>4. 동의를 거부할 권리
		<br>&nbsp;  : 귀하는 위와 같이 개인정보를 수집 및 이용하는 데 대한 동의를 거부할 권리가 있습니다.
		<br>&nbsp;  - 동의를 거부하셔도 그에 따른 불이익은 없습니다.
		</div>
		
	<footer>
		<jsp:include page="../main/footer.jsp"></jsp:include>
	</footer>
</body>
</html>