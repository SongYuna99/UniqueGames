<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Unique Games</title>
<link rel="stylesheet"
	href="http://localhost:9000/uniquegames/css/mainunigames.css">
<link rel="stylesheet"
	href="http://localhost:9000/uniquegames/css/board.css">
<script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.12.4.min.js"></script>
<!-- 마이크로소프트 jQuery-->
<script src="http://localhost:9000/uniquegames/js/board.js"></script>
<c:choose>
	<c:when test="${result eq 'success'}">
		<script>alert("성공적으로 등록되었습니다.")</script>
	</c:when>
	<c:when test="${result eq 'fail'}">
		<script>alert("작업에 실패했습니다.\n잠시후에 다시 시도해주세요.")</script>
	</c:when>
</c:choose>
</head>

<body>
	<header>
		<jsp:include page="../main/header.jsp"></jsp:include>
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
				<div>
					<label for=""> <input type="text" name="search"
						placeholder="검색어를 입력해주세요.">
						<button type="button" id="btn-search">
							<img
								src="http://localhost:9000/uniquegames/images/btn_boardSearch_press.png"
								alt="">
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
			<form name="boardManage" action="#" method="get">
				<table id="admin-btable">
					<tr>
						<th>선택</th>
						<th>번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일</th>
					</tr>
					<c:forEach var="noticeVo" items="${list}">
					<tr>
						<td><input type="checkbox" name="list[]" value="${noticeVo.post_id}"></td>
						<td>${noticeVo.rno}</td>
						<td><a href="notice_content.do?no=${noticeVo.post_id}">${noticeVo.title}</a></td>
						<td>${noticeVo.company_id}</td>
						<td>${noticeVo.notice_date}</td>
					</tr>
					</c:forEach>
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