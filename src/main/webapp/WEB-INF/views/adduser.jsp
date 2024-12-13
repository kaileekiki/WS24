<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>회원가입</title>
</head>
<body>
<h1>회원가입</h1>
<form method="post" action="/user/add">
    <div>
        <label for="userid">아이디:</label>
        <input type="text" id="userid" name="userid" required />
    </div>
    <div>
        <label for="password">비밀번호:</label>
        <input type="password" id="password" name="password" required />
    </div>
    <div>
        <button type="submit">회원가입</button>
    </div>
</form>
</body>
</html>
