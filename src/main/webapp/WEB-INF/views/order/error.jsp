<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Unique Games</title>
	<link rel="stylesheet" href="css/order_style.css">
	<script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.12.4.min.js"></script> <!-- 마이크로소프트 jQuery-->
	<script src="js/order_script.js"></script>
</head>
<body>
<!-- header -->
<jsp:include page="../main/header.jsp"></jsp:include>

<!-- content -->
<section id="top-bg">
	<div id="base-layer">
		<div id="top-bg-textarea">
			<p id="top-title">Error</p>
			<p id="top-subtitle">#오류 발생</p>
		</div>
	</div>
</section>


<h1>Complete</h1>
<div id="order-complete">
	<div id="div-thankyou">오류가 발생했습니다. 다시 시도해주세요.</div>
	<div id="div-button">
		<a href="http://localhost:9000/uniquegames/index.do"><button type="button" id="btn-main">메인으로</button></a>
		<a href="http://localhost:9000/uniquegames/cart.do"><button type="button" id="btn-goCart">장바구니</button></a>
	</div>
</div>

<!-- footer -->
<jsp:include page="../main/footer.jsp"></jsp:include>
</body>
</html>