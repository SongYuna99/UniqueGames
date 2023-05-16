<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% String id = request.getParameter("id"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Unique Games</title>
<!-- 04/25 임시 주소 -->
<link rel="stylesheet" href="../../css/unigames.css">
<script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.12.4.min.js"></script>
	<script type="text/javascript" src="board.js"></script>

</head>

<body>
	<header>
		<iframe src="../main/header.html" scrolling="no" width="100%" height="228px" frameborder=0></iframe>
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
			<form name="writeForm" action="boardWriteForm.jsp" method="post">
				<table>
					<tr>
						<th>제목</th>
						<td><input type="text" name="btitle" id="default-write" value="받은 id값 = <%= id %>"></td>
					</tr>
					<tr>
						<th>내용</th>
						<td><textarea name="bcontent" cols="30" rows="5"
								id="default-write">받은 id값 이용해서 db연동 해야 함</textarea></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	<footer>
		<iframe src="../main/footer.html" scrolling="no" width="100%"
			height="646px" frameborder=0></iframe>
	</footer>
</body>

</html>