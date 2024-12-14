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
    <div>
        <h2>내 계정 정보</h2>
        <p><strong>아이디:</strong> ${userVO.userid}</p>
        <p><strong>이름:</strong> ${userVO.username}</p>
    </div>

    <!-- Display and Edit UserDetailVO Information -->
    <div>
        <h2>내 정보</h2>
        <form method="post" action="/user/update">
            <div>
                <label for="nickname">닉네임:</label>
                <input type="text" id="nickname" name="nickname" value="${userDetailVO.nickname}" required />
            </div>
            <div>
                <label for="phoneNum">전화번호:</label>
                <input type="text" id="phoneNum" name="phoneNum" value="${userDetailVO.phoneNum}" required />
            </div>
            <div>
                <label for="kakao">카카오톡 ID:</label>
                <input type="text" id="kakao" name="kakao" value="${userDetailVO.kakao}" />
            </div>
            <div>
                <label for="filename">프로필 사진 파일명:</label>
                <input type="text" id="filename" name="filename" value="${userDetailVO.filename}" />
            </div>
            <button type="submit" class="btn btn-primary mt-3">수정</button>
        </form>
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
