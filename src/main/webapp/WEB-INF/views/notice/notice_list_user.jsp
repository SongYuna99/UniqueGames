<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>Unique Games</title>
	<link rel="stylesheet" href="http://localhost:9000/uniquegames/css/mainunigames.css">
	<link rel="stylesheet" href="http://localhost:9000/uniquegames/css/board.css">
	<script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.12.4.min.js"></script><!-- 마이크로소프트 jQuery-->
	<script src="http://localhost:9000/uniquegames/js/board.js"></script>
</head>

<body>
	<header>
		<iframe src="../main/header.html" scrolling="no" width="100%" height="228px" frameborder=0></iframe>
	</header>
	<section id="top-bg">
		<div id="base-layer">
			<div id="top-bg-textarea">
				<p id="top-title">Notice</p>
				<p id="top-subtitle">#공지사항</p>
			</div>
		</div>
	</section>	
	<div id="content">
		<div id="board-list">
			<div id="board-top-menu">
				<p>Notice</p>
				<div id="bsearch-box">
					<label for="">
						<input type="text" name="search" placeholder="검색어를 입력해주세요.">
						<button type="button" id="btn-search"><img src="../../images/btn_boardSearch_press.png" alt=""></button>
					</label>
					<ul>
						<li><button type="button" id="btn-style" onclick="location.href='./board_write.jsp'">작성</button></a></li>
					</ul>
				</div>
				<div id="clearFix"></div>
			</div>
			<table id="user-btable">
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
				</tr>
				<tr>
					<td>1</td>
					<td><a href="./board_content.html">아 제목인데 너무 길게 쓰지않고 적당한 길이로 대충 때울려고합니다~예~ 그럼요</a></td>
					<td>관리자</td>
					<td>2023.04.25</td>
				</tr>
				<tr>
					<td>2</td>
					<td>아 제목인데 너무 길게 쓰지않고 적당한 길이로 대충 때울려고합니다~예~ 그럼요</td>
					<td>관리자</td>
					<td>2023.04.25</td>
				</tr>
				<tr>
					<td>3</td>
					<td>아 제목인데 너무 길게 쓰지않고 적당한 길이로 대충 때울려고합니다~예~ 그럼요</td>
					<td>관리자</td>
					<td>2023.04.25</td>
				</tr>
				<tr>
					<td>4</td>
					<td>아 제목인데 너무 길게 쓰지않고 적당한 길이로 대충 때울려고합니다~예~ 그럼요</td>
					<td>관리자</td>
					<td>2023.04.25</td>
				</tr>
				<tr>
					<td>5</td>
					<td>아 제목인데 너무 길게 쓰지않고 적당한 길이로 대충 때울려고합니다~예~ 그럼요</td>
					<td>관리자</td>
					<td>2023.04.25</td>
				</tr>
				<tr>
					<td>6</td>
					<td>아 제목인데 너무 길게 쓰지않고 적당한 길이로 대충 때울려고합니다~예~ 그럼요</td>
					<td>관리자</td>
					<td>2023.04.25</td>
				</tr>
				<tr>
					<td>7</td>
					<td>아 제목인데 너무 길게 쓰지않고 적당한 길이로 대충 때울려고합니다~예~ 그럼요</td>
					<td>관리자</td>
					<td>2023.04.25</td>
				</tr>
				<tr>
					<td>8</td>
					<td>아 제목인데 너무 길게 쓰지않고 적당한 길이로 대충 때울려고합니다~예~ 그럼요</td>
					<td>관리자</td>
					<td>2023.04.25</td>
				</tr>
				<tr>
					<td>9</td>
					<td>아 제목인데 너무 길게 쓰지않고 적당한 길이로 대충 때울려고합니다~예~ 그럼요</td>
					<td>관리자</td>
					<td>2023.04.25</td>
				</tr>
				<tr>
					<td>10</td>
					<td>아 제목인데 너무 길게 쓰지않고 적당한 길이로 대충 때울려고합니다~예~ 그럼요</td>
					<td>관리자</td>
					<td>2023.04.25</td>
				</tr>
				<tr>
					<td colspan="5">
						<ul id="paging">
							<li><a href="#"><<</a></li>
							<li><a href="#"><</a></li>
							<li><a href="#">1</a></li>
							<li><a href="#">2</a></li>
							<li><a href="#">3</a></li>
							<li><a href="#">4</a></li>
							<li><a href="#">5</a></li>
							<li><a href="#">6</a></li>
							<li><a href="#">7</a></li>
							<li><a href="#">8</a></li>
							<li><a href="#">9</a></li>
							<li><a href="#">10</a></li>
							<li><a href="#">></a></li>
							<li><a href="#">>></a></li>
						</ul>
					</td>
				</tr>
			</table>
		</div>
	</div>
	<footer>
		<iframe src="../main/footer.html" scrolling="no" width="100%" height="646px" frameborder=0></iframe>
	</footer>
</body>

</html>