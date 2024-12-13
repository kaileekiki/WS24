<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>마이 페이지</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<jsp:include page="top.jsp"/>

<div class="container mt-5">
    <h1>마이 페이지</h1>
    <div>
        <h2>내 정보</h2>
        <p><strong>아이디:</strong> ${userDetails.userid}</p>
        <p><strong>이름:</strong> ${userDetails.username}</p>
        <p><strong>이메일:</strong> ${userDetails.email}</p>
        <p><strong>가입일:</strong> ${userDetails.regdate}</p>
    </div>
    <div>
        <h2>내가 작성한 상품</h2>
        <c:forEach var="item" items="${userItems}">
            <div>
                <h3>${item.title}</h3>
                <p>${item.content}</p>
                <p>${item.price}</p>
            </div>
        </c:forEach>
    </div>
    <div>
        <h2>내가 구독한 목록</h2>
        <c:forEach var="subscribe" items="${userSubscribes}">
            <div>
                <h3>${subscribe.title}</h3>
                <p>${subscribe.startDate} ~ ${subscribe.endDate}</p>
                <p>${subscribe.price}</p>
            </div>
        </c:forEach>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
