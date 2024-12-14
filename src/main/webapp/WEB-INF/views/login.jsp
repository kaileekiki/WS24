<%--
  Created by IntelliJ IDEA.
  User: dongheonkim
  Date: 24. 12. 13.
  Time: 오전 3:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #FDFCF5;
            color: #333;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .login-container {
            background-color: #FFFFFF;
            border: 1px solid #E5E5E5;
            border-radius: 10px;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
            padding: 20px 30px;
            width: 300px;
            text-align: center;
        }

        .login-container h1 {
            color: #A47340;
            font-size: 24px;
            margin-bottom: 20px;
        }

        .login-container form {
            display: flex;
            flex-direction: column;
            gap: 15px;
        }

        .login-container label {
            font-size: 14px;
            text-align: left;
            margin-bottom: 5px;
            color: #333;
        }

        .login-container input {
            padding: 10px;
            font-size: 14px;
            border: 1px solid #D4D4D4;
            border-radius: 5px;
            background-color: #FAF8F2;
        }

        .login-container button {
            background-color: #B4D69E;
            color: #FFFFFF;
            border: none;
            padding: 10px;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .login-container button:hover {
            background-color: #A4C48A;
        }

        .login-container .signup-button {
            background-color: #A47340;
            margin-top: 15px;
        }

        .login-container .signup-button:hover {
            background-color: #8C5E33;
        }

        .divider {
            margin: 20px 0;
            border: 0;
            border-top: 1px solid #E5E5E5;
        }
    </style>
</head>
<body>
<div class="login-container">
    <h1>로그인</h1>
    <form method="post" action="loginOk">
        <div>
            <label for="userid">아이디</label>
            <input type="text" id="userid" name="userid" required />
        </div>
        <div>
            <label for="password">비밀번호</label>
            <input type="password" id="password" name="password" required />
        </div>
        <button type="submit">로그인</button>
    </form>

    <hr class="divider">

    <button class="signup-button" type="button" onclick="location.href='${pageContext.request.contextPath}/user/add'">회원가입</button>
</div>
</body>
</html>
