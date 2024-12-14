<%@ page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Footer</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }

        .content {
            flex: 1; /* 컨텐츠가 푸터 위에 배치되도록 설정 */
        }

        .footer {
            background-color: #f4ede3; /* 연갈색 배경 */
            color: #5a372b; /* 글씨 색상 */
            border-top: 1px solid #e5d8c3; /* 연한 테두리 */
            padding: 10px 0;
            width: 100%;
            bottom: 0;
        }

        .footer .container-fluid {
            display: flex;
            justify-content: space-between;
            align-items: center;
            font-size: 14px;
        }

        .footer p {
            margin: 0;
        }

        .footer a {
            color: #854442; /* 링크 색상 */
            text-decoration: none;
            margin: 0 10px;
        }

        .footer a:hover {
            color: #a67c52; /* 호버 시 색상 */
        }
    </style>
</head>
<body>
<div class="content">
    <!-- 여기에 페이지의 메인 컨텐츠가 들어감 -->
</div>
<footer class="footer">
    <div class="container-fluid">
        <p>&copy; 2024 BYTE. All rights reserved.</p>
        <div>
            <a href="#">About Us</a>
            <a href="#">Privacy Policy</a>
            <a href="#">Contact</a>
        </div>
    </div>
</footer>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
