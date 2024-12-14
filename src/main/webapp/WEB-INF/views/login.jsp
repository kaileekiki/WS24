<%--
  Created by IntelliJ IDEA.
  User: dongheonkim
  Date: 24. 12. 13.
  Time: 오전 3:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%--sdf--%>
<form method="post" action="loginOk">
    <div><label>User ID: </label><input type='text' name='userid' /></div>
    <div><label>Password: </label><input type='password' name='password' /></div>
    <button type='submit'>login</button>
</form>

<button type="button" onclick="location.href='${pageContext.request.contextPath}/user/add'">회원가입</button>




</body>
</html>
