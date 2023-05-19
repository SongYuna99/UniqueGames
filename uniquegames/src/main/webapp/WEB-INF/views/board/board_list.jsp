<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
		<div id="board-list">
			<div id="board-top-menu">
				<p>Board</p>
				<div>
					<label for=""> <input type="text" name="search"
						placeholder="검색어를 입력해주세요.">
						<button type="button" id="btn-search">
							<img src="../../images/btn_boardSearch_press.png" alt="">
						</button>
					</label>
					<ul>
						<li><button type="button" id="btn-style" name="listWrite">작성</button></li>
						<li><button type="button" id="btn-style" name="listUpdate">수정</button></li>
						<li><button type="button" id="btn-style" name="listDelete">삭제</button></li>
						<li><button type="button" id="btn-style" name="listDeleteAll">전체삭제</button></li>
					</ul>
				</div>
			</div>
			<form name="boardManage" action="#" method="post">
				<table id="admin-btable">
					<tr>
						<th>선택</th>
						<th>번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일</th>
					</tr>
					<%
						String bid = "id";
						for (int i = 1; i <= 10; i++) {
					%>
					<tr>
						<td><input type="checkbox" name="list[]" value=<%= bid + i %>></td>
						<td><%= i %></td>
						<td><a href="board-content.do?no=<%= bid + i %>">아 제목인데 너무 길게 쓰지않고 적당한
								길이로 대충 때울려고합니다~예~ 그럼요</a></td>
						<td>관리자</td>
						<td>2023.04.25</td>
					</tr>
					<%
						}
					%>
					<tr>
						<td colspan="5">
							<ul id="paging">
								<li><a href="?page=1"><<</a></li>
								<li><a href="?page=-1"><</a></li>
								<li><a href="?page=1">1</a></li>
								<li><a href="?page=2">2</a></li>
								<li><a href="?page=3">3</a></li>
								<li><a href="?page=4">4</a></li>
								<li><a href="?page=5">5</a></li>
								<li><a href="?page=6">6</a></li>
								<li><a href="?page=7">7</a></li>
								<li><a href="?page=8">8</a></li>
								<li><a href="?page=9">9</a></li>
								<li><a href="?page=10">10</a></li>
								<li><a href="?page=+1">></a></li>
								<li><a href="?page=11">>></a></li>
							</ul>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	<footer>
		<jsp:include page="../main/footer.jsp"></jsp:include>
	</footer>
</body>

</html>