<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>회사 소개페이지 리스트</title>
    <meta charset="UTF-8">
    <title>Unique Games</title>
    <link rel="stylesheet" href="http://localhost:9000/uniquegames/css/mainunigames.css">
</head>
<body>
<%--header--%>
<jsp:include page="../main/header.jsp"></jsp:include>
<section id="top-bg">
    <div id="base-layer">
        <div id="top-bg-textarea">
            <p id="top-title">All List</p>
            <p id="top-subtitle">#전체 회사(개발팀)목록</p>
        </div>
    </div>
</section>
<section id="menu-main2">
    <div id="menu-allList">
        <div id="gameList">
            <c:forEach items="${companyList}" var="intro">
                <div id="gList">

                    <img src="http://localhost:9000/uniquegames/upload/${intro.upload}" width="260px" height="180px">
                    <ul>
                        <li><a href="getIntro.do?id=${intro.id}">${intro.name}</a></li>
                        <li>${intro.id}</li>
                        <li><img src="http://localhost:9000/uniquegames/images/img_icon_rPc.png"></li>
                    </ul>
                </div>
            </c:forEach>
        </div>
    </div>
</section>
<%--footer--%>
<jsp:include page="../main/footer.jsp"></jsp:include>
</body>
</html>
