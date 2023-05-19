<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% String bid = request.getParameter("no"); %>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>Unique Games</title>
	<link rel="stylesheet" href="http://localhost:9000/myuniquegames/css/unigames.css">
	<link rel="stylesheet" href="http://localhost:9000/myuniquegames/css/board.css">
	<script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.12.4.min.js"></script><!-- 마이크로소프트 jQuery-->
	<script src="http://localhost:9000/myuniquegames/js/board.js"></script>
</head>

<body>
	<header>
		<!-- <iframe src="../main/header.html" scrolling="no" width="100%" height="228px" frameborder=0></iframe> -->
		<jsp:include page="../main/header.jsp"></jsp:include>
	</header>
	<section id="top-bg">
		<div id="base-layer">
			<div id="top-bg-textarea">
			<p id="top-title">Board</p>
			<p id="top-subtitle">#게시판</p>
			</div>
		</div>
	</section>
	<div id="content">
		<div id="board-content">
			<div id="board-top-menu">
				<p>Board</p>
				<div>
					<ul>
						<li><button type="button" id="btn-style" name="update">수정</button></li>
						<li><button type="button" id="btn-style" name="delete">삭제</button></li>
						<li><button type="button" id="btn-style" name="list">목록</button></li>
					</ul>
				</div>
				<div id="clearFix"></div>
			</div>
			<table>
				<tr>
					<th>제목</th>
					<td colspan="5" id="btitle">아 제목인데 너무 길게 쓰지않고 적당한 길이로 대충 때울려고합니다~예~ 그럼요</td>
				</tr>
				<tr>
					<th>등록자</th>
					<td>김철수</td>
					<th>조회수</th>
					<td style="text-align: center;">123</td>
					<th>등록일</th>
					<td>2023-04-27 17:49:59</td>
				</tr>
				<tr>
					<td colspan="6" style="border:none;">
						<div id="details">
						테스트 테스트 으아아아아아아ㅏ아아아아아아아앙아아아아ㅏㅇ아asdasdasdasdsadasdasdsadasㅁㄴㅇㄴㅁㅇㄴㅁㅇ
						<br>
						띄어쓰기
						</div>
					</td>
				</tr>
			</table>
		</div>
		<section id="comment-box">
			<div>
				<!-- Comment form-->
				<form id="comment-write">
					<textarea id="form-control" rows="3"
						placeholder="타인에게 불쾌함을 주는 댓글은 통보없이 삭제될 수 있습니다."></textarea>
					<button type="button" id="btn-style">등록</button>
				</form>
				<!-- Comment with nested comments-->
				<div id="comment1">
					<!-- Parent comment-->
					<div id="msg-1">
						<div id="user-name">김니다</div>
						<div><span id="msg-date">2023-05-08</span><span id="report" class="report">신고</span></div>
						댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용
						댓글내용댓글내용댓글내용댓글내용댓글내용
					</div>
				</div>
				<!-- Single comment-->
				<div id="comment1">
					<div id="msg-2">
						<div id="user-name">ㅇㅇ</div>
						<div><span id="msg-date">2023-05-08</span><span id="report" class="report">신고</span></div>
						댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용
						댓글내용댓글내용댓글내용댓글내용댓글내용
					</div>
				</div>
			</div>
		</section>
		<div id="modal-background" class="test">
			<div id="modal-container">
				<div id="modal-title">
					<h2>신고</h2>
				</div>
				<div id="modal-content">
					<p><input type="checkbox" name="pokryuk" id="chk-circle"> 괴롭힘 및 사이버 폭력</p>
					<p><input type="checkbox" name="chimhae" id="chk-circle"> 개인정보 침해</p>
					<p><input type="checkbox" name="doyong" id="chk-circle"> 명의 도용</p>
					<p><input type="checkbox" name="wehyub" id="chk-circle"> 폭력적 위협</p>
					<p><input type="checkbox" name="hakdae" id="chk-circle"> 아동 학대</p>
					<p><input type="checkbox" name="pyohyun" id="chk-circle"> 보호 대상 집단에 대한 증오심 표현</p>
					<p><input type="checkbox" name="sagi" id="chk-circle"> 스팸 및 사기</p>
					<p><input type="checkbox" name="none" id="chk-circle"> 나에게 해당하는 문제 없음</p>
					<div>컨텐츠가 신고되면 UniGames 담당자가 검토하여 커뮤니티 가이드의 위반 여부를 판단합니다. 
						커뮤니티 가이드를 위반한 계정은 불이익을 받게 되며 반복적이거나 심각한 위반이 발생한 경우에는 계정이 해지될 수 있습니다.</div>
				</div>
				<div id="modal-selectarea">
					<div id="modal-close">취소</div>
					<div id="modal-report">신고</div>
				</div>
			</div>
		</div>
	</div>
	<footer>
		<!-- <iframe src="../main/footer.jsp" scrolling="no" width="100%" height="646px" frameborder=0></iframe> -->
		<jsp:include page="../main/footer.jsp"></jsp:include>
	</footer>
<script>
	const reportBtn = document.querySelectorAll(".report");
	const modal = document.getElementById("modal-background");
	const modalCloseBtn = document.getElementById("modal-close");
	const modalReportBtn = document.getElementById("modal-report");

	function modalOff() {
		modal.style.display = "none";
	}
	reportBtn.forEach(e => {
		e.addEventListener("click", e => {
			modal.style.display = "flex";
		});
	});

	modalCloseBtn.addEventListener("click", e => {
		modalOff();
	});
	modalReportBtn.addEventListener("click", e => {
		modalOff();
	});

	modal.addEventListener("click", e => {
		const eventTarget = e.target;
		if (eventTarget.classList.contains("test")) {
			modalOff()
		};
	});

	window.addEventListener("keyup", e => {
		if (modal.style.display === "flex" && e.key === "Escape") {
			modalOff()
		};
	});

	$('button[name="update"]').on("click", function () {
			location.href = "board_update.jsp?f=up&id=<%= bid %>";
		})
</script>
</body>
</html>