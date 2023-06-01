<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Unique Games</title>
	<link rel="stylesheet" href="css/order_style.css">
	<script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.12.4.min.js"></script> <!-- 마이크로소프트 jQuery-->
	<script src="js/details_script.js"></script>
</head>
<body>
<!-- header -->
<jsp:include page="../main/header.jsp"></jsp:include>

<!-- content -->
<section id="top-bg">
	<div id="base-layer">
		<div id="top-bg-textarea">
			<p id="top-title">Payment Detail</p>
			<p id="top-subtitle">#결제내역</p>
		</div>
	</div>
</section>

<h1>Payment Detail</h1>
<input type="hidden" id="m_id" name="m_id" value="${ m_id }">
<section id="cart">
	<div id="div-gameList">
		<div id="div-select">
			<select id="select-order">
				<option value="orderdate_desc">최근 날짜순</option>
				<option value="orderdate_asc">오래된 날짜순</option>
				<option value="amount_asc">높은 후원금순</option>
				<option value="amount_desc">낮은 후원금순</option>			
			</select>
		</div>
		<div id="div-table">
			
		</div>
	</div>

</section>

<!-- footer -->
<jsp:include page="../main/footer.jsp"></jsp:include>
</body>
</html>