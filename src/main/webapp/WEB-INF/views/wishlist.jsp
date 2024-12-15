<%@ page contentType="text/html; charset=UTF-8" isELIgnored="false" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Wishlist</title>
</head>
<body>
<jsp:include page="top.jsp" />

<h1>Wishlist</h1>

<!-- Item Table -->
<table border="1">
    <thead>
    <tr>
        <th>Title</th>
        <th>Price</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="item" items="${joinedItems}">
        <tr>
            <td>${item.itemVO.title}</td>
            <td>${item.itemVO.price}</td>
        </tr>
    </c:forEach>
    </tbody>
</table>

<!-- Subscription Table -->
<table border="1">
    <thead>
    <tr>
        <th>Title</th>
        <th>Region</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="subs" items="${joinedSubs}">
        <tr>
            <td>${subs.subscribeVO.title}</td>
            <td>${subs.subscribeVO.price}</td>
        </tr>
    </c:forEach>
    </tbody>
</table>

<jsp:include page="bottom.jsp" />
</body>
</html>
