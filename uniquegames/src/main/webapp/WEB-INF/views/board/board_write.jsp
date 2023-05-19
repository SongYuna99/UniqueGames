<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Unique Games</title>
<link rel="stylesheet" href="http://localhost:9000/myuniquegames/css/unigames.css">
<link rel="stylesheet" href="http://localhost:9000/myuniquegames/css/board.css">
<script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.12.4.min.js"></script>
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
		<div id="board-write">
			<div id="board-top-menu">
				<p>Board</p>
				<div>
					<ul>
						<li><button type="button" id="btn-style" name="write">저장</button></li>
						<li><button type="button" id="btn-style" name="cancel">취소</button></li>
					</ul>
				</div>
				<div id="clearFix"></div>
			</div>
			<form name="writeForm" action="#" method="post">
				<table>
					<tr>
						<th>제목</th>
						<td><input type="text" name="btitle" id="default-write"></td>
					</tr>
					<tr>
						<th>내용</th>
						<td><textarea name="bcontent" cols="30" rows="5"
								id="default-write"></textarea></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	<footer>
		<jsp:include page="../main/header.jsp"></jsp:include>
	</footer>
</body>

</html>