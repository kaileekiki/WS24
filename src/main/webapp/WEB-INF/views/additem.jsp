<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>상품 추가</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f7;
            color: #333;
            margin: 0;
            padding: 20px;
        }

        h2 {
            color: #5f4b32;
            text-align: center;
            margin-bottom: 20px;
        }

        form {
            background-color: #fff;
            border: 1px solid #e2e2e0;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 20px;
            max-width: 600px;
            margin: 0 auto;
        }

        form div {
            margin-bottom: 15px;
        }

        label {
            display: block;
            font-size: 14px;
            color: #5f4b32;
            margin-bottom: 5px;
        }

        input[type="text"],
        input[type="number"],
        input[type="url"],
        input[type="file"],
        textarea {
            width: 100%;
            padding: 10px;
            font-size: 14px;
            border: 1px solid #d4d4d4;
            border-radius: 5px;
            box-sizing: border-box;
            background-color: #faf8f2;
        }

        button {
            background-color: #7aa87d;
            color: #fff;
            border: none;
            border-radius: 4px;
            padding: 10px 15px;
            font-size: 16px;
            cursor: pointer;
            width: 100%;
            box-sizing: border-box;
        }

        button:hover {
            background-color: #679563;
        }

        .back-button-container {
            text-align: center; /* 버튼 중앙 정렬 */
            margin-top: 15px;
        }

        .back-button-container button {
            background-color: #a47340;
            width: 200px; /* 버튼 크기를 form보다 작게 설정 */
            padding: 10px;
        }

        .back-button-container button:hover {
            background-color: #8c5e33;
        }

        textarea {
            resize: vertical;
        }
    </style>
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

<div class="back-button-container">
    <button type="button" onclick="location.href='../item/list'">상품 목록으로 돌아가기</button>
</div>
</body>
</html>

