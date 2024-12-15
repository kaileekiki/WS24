<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Item Edit</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f7;
            color: #333;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 600px;
            margin: 50px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        h2 {
            color: #5f4b32;
            text-align: center;
            margin-bottom: 30px;
        }

        label {
            font-weight: bold;
            margin-bottom: 5px;
            color: #5f4b32;
        }

        input, textarea {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #e2e2e0;
            border-radius: 5px;
            background-color: #faf8f2;
        }

        textarea {
            resize: none;
        }

        button {
            width: 100%;
            padding: 10px;
            background-color: #7aa87d;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        button:hover {
            background-color: #679563;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>상품 수정</h2>
    <form method="post" action="${pageContext.request.contextPath}/item/edit" enctype="multipart/form-data">
        <input type="hidden" name="id" value="${item.id}" />
        <div class="mb-3">
            <label for="title">Title:</label>
            <input type="text" id="title" name="title" value="${item.title}" required />
        </div>
        <div class="mb-3">
            <label for="content">Content:</label>
            <textarea id="content" name="content" rows="4" required>${item.content}</textarea>
        </div>
        <div class="mb-3">
            <label for="region">Region:</label>
            <input type="text" id="region" name="region" value="${item.region}" required />
        </div>
        <div class="mb-3">
            <label for="price">Price:</label>
            <input type="number" id="price" name="price" value="${item.price}" required />
        </div>
        <div class="mb-3">
            <label for="itemLink">Item Link:</label>
            <input type="url" id="itemLink" name="itemLink" value="${item.itemLink}" />
        </div>
        <div class="mb-3">
            <label for="kakao">Kakao Chat Link:</label>
            <input type="url" id="kakao" name="kakao" value="${item.kakao}" />
        </div>
        <div class="mb-3">
            <label for="peopleLimit">People Limit:</label>
            <input type="number" id="peopleLimit" name="peopleLimit" value="${item.peopleLimit}" required />
        </div>
        <div class="mb-3">
            <label for="filename">Filename:</label>
            <input type="file" id="filename" name="filename" />
            <p>Current Image: <img src="${pageContext.request.contextPath}/resources/img/${item.filename}" alt="Current Image" width="100" /></p>
        </div>
        <button type="submit">Update</button>
    </form>
</div>
</body>
</html>
