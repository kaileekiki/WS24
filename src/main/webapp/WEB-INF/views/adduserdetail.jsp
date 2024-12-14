<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>사용자 세부정보 추가</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f9f9f9;
        }

        .container {
            max-width: 600px;
            margin: 50px auto;
            padding: 20px;
            background: #ffffff;
            border: 1px solid #eaeaea;
            border-radius: 8px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
        }

        .form-group label {
            font-weight: bold;
        }

        .btn-primary {
            background-color: #dab894; /* 연갈색 */
            border: none;
        }

        .btn-primary:hover {
            background-color: #c6a17d; /* 조금 더 짙은 연갈색 */
        }

        .btn-secondary {
            background-color: #94c9a9; /* 연두색 */
            border: none;
        }

        .btn-secondary:hover {
            background-color: #82b397; /* 조금 더 짙은 연두색 */
        }
    </style>
</head>
<body>
<div class="container">
    <h2 class="text-center mb-4">사용자 세부정보 추가</h2>
    <form method="post" action="addok" enctype="multipart/form-data">
        <div class="form-group mb-3">
            <label for="nickname">닉네임:</label>
            <input type="text" class="form-control" id="nickname" name="nickname" placeholder="닉네임을 입력하세요" required>
        </div>
        <div class="form-group mb-3">
            <label for="phoneNum">전화번호:</label>
            <input type="text" class="form-control" id="phoneNum" name="phoneNum" placeholder="전화번호를 입력하세요" required>
        </div>
        <div class="form-group mb-3">
            <label for="kakao">카카오톡 링크:</label>
            <input type="text" class="form-control" id="kakao" name="kakao" placeholder="카카오톡 링크를 입력하세요">
        </div>
        <div class="form-group mb-3">
            <label for="filename">프로필 이미지:</label>
            <input type="file" class="form-control" id="filename" name="filename">
        </div>
        <div class="d-flex justify-content-between">
            <button type="submit" class="btn btn-primary">추가</button>
            <button type="button" class="btn btn-secondary" onclick="location.href='${pageContext.request.contextPath}/home'">취소</button>
        </div>
    </form>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
