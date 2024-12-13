<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>상품 추가</title>
</head>
<body>
<h2>상품 추가</h2>

<form method="post" action="addok" enctype="multipart/form-data">
    <div>
        <label for="title">상품명:</label>
        <input type="text" id="title" name="title" required />
    </div>
    <div>
        <label for="content">상품 설명:</label>
        <textarea id="content" name="content" rows="4" cols="50" required></textarea>
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
        <label for="itemLink">상품 링크:</label>
        <input type="url" id="itemLink" name="itemLink" />
    </div>
    <div>
        <label for="kakaoLink">카카오톡 채팅방 링크:</label>
        <input type="text" id="kakaoLink" name="kakaoLink" />
    </div>
    <div>
        <label for="peopleLimit">최대 인원수:</label>
        <input type="number" id="peopleLimit" name="peopleLimit" required />
    </div>
    <div>
        <label for="filename">상품 이미지:</label>
        <input type="file" id="filename" name="filename" />
    </div>
    <div>
        <button type="submit">상품 등록</button>
    </div>
</form>

<div>
    <button type="button" onclick="location.href='/item/list'">상품 목록으로 돌아가기</button>
</div>
</body>
</html>
