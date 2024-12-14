<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>회원가입</title>
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

        .signup-container {
            background-color: #FFFFFF;
            border: 1px solid #E5E5E5;
            border-radius: 10px;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
            padding: 25px 30px;
            width: 320px;
            text-align: center;
        }

        .signup-container h1 {
            color: #A47340;
            font-size: 24px;
            margin-bottom: 20px;
        }

        .signup-container form {
            display: flex;
            flex-direction: column;
            gap: 10px;
        }

        .signup-container label {
            font-size: 14px;
            text-align: left;
            margin-bottom: 5px;
            color: #333;
        }

        .signup-container input {
            padding: 10px;
            font-size: 14px;
            border: 1px solid #D4D4D4;
            border-radius: 5px;
            background-color: #FAF8F2;
            width: 100%;
            box-sizing: border-box;
        }

        .signup-container button {
            background-color: #B4D69E;
            color: #FFFFFF;
            border: none;
            padding: 10px;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s;
            width: 100%;
        }

        .signup-container button:hover {
            background-color: #A4C48A;
        }
    </style>
</head>
<body>
<div class="signup-container">
    <h1>회원가입</h1>
    <form method="post" action="addok">
        <div>
            <label for="userid">아이디:</label>
            <input type="text" id="userid" name="userid" required />
        </div>
        <div>
            <label for="password">비밀번호:</label>
            <input type="password" id="password" name="password" required />
        </div>
        <div>
            <label for="username">유저이름:</label>
            <input type="text" id="username" name="username" required />
        </div>
        <div>
            <button type="submit">가입하기</button>
        </div>
    </form>
</div>
</body>
</html>
