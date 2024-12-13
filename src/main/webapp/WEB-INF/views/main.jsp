<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: dongheonkim
  Date: 24. 12. 13.
  Time: 오전 4:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" language="java" %>
<html>
<head>
    <title>Main</title>
</head>
<body>
<jsp:include page="top.jsp"/>

<h1>메인페이지</h1>

<div>
    <h3>공동구매</h3>
    <table id="itemlist">
        <thead>
        <tr>
            <th>상품</th>
            <th>가격</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${itemlist}" var="u">
            <tr>
                <td>${u.title}</td>
                <td>${u.price}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <button type="button" onclick="location.href='${pageContext.request.contextPath}/item/list'">공동구매하러 가기</button>

    <h3>공동구독</h3>
    <table id="subscribelist">
        <thead>
        <tr>
            <th>상품</th>
            <th>가격</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${subscribelist}" var="u">
            <tr>
                <td>${u.title}</td>
                <td>${u.price}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <button type="button" onclick="location.href='${pageContext.request.contextPath}/subscribe/list'">공동구독하러 가기</button>

    <div>
        <button type="button" onclick="location.href='  '">공동구매 상품 등록하기</button>
        <button type="button" onclick="location.href='  '">공동구독 상품 등록하기</button>
    </div>
</div>

</body>
</html>

