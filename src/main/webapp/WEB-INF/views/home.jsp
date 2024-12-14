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
    <!-- Display UserVO Information -->
    <h2>내 계정 정보</h2>
    <div>
        <p><strong>닉네임:</strong> ${userDetails.nickname}</p>
        <p><strong>kakao:</strong> ${userDetails.kakao}</p>
        <p><strong>전화번호:</strong> ${userDetails.phoneNum}</p>
        <p><strong>사진:</strong></p>
        <c:if test="${userDetails.filename != null}">
            <img src="${pageContext.request.contextPath}/resources/img/${userDetails.filename}" alt="사용자 사진" width="150" />
        </c:if>
        <c:if test="${userDetails.filename == null}">
            <p>사진이 없습니다.</p>
        </c:if>
    </div>

    <!-- Display and Edit UserDetailVO Information -->

    <div class="actions">
        <button type="button" onclick="location.href='${pageContext.request.contextPath}/userdetail/add'">유저 디테일 등록</button>

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
