<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>구독 추가</title>
</head>
<body>
<h2>상품 추가</h2>

<form method="post" action="addok">
    <div>
        <label for="title">상품명:</label>
        <input type="text" id="title" name="title" required />
    </div>
    <div>
        <label for="region">지역:</label>
        <input type="text" id="region" name="region" required />
    </div>
    <div>
        <label for="price">가격:</label>
        <input type="number" id="price" name="price" required />
    </div>
    <div>
        <label for="kakao">카카오톡 채팅방 링크:</label>
        <input type="url" id="kakao" name="kakao" />
    </div>
    <div>
        <label for="peopleLimit">최대 인원수:</label>
        <input type="number" id="peopleLimit" name="peopleLimit" required />
    </div>
    <div>
        <label for="people">현재 인원수:</label>
        <input type="number" id="people" name="people" required />
    </div>
    <div>
        <label for="startDate">Start Date:</label>
        <input type="date" id="startDate" name="startDate" required />
    </div>
    <div>
        <label for="endDate">End Date:</label>
        <input type="date" id="endDate" name="endDate" required />
    </div>
    <div>
        <button type="submit">상품 등록</button>
    </div>
</form>

<div>
    <button type="button" onclick="location.href='../subscribe/list'">상품 목록으로 돌아가기</button>
</div>
</body>
</html>
