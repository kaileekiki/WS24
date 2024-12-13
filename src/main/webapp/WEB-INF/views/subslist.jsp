<%--
  Created by IntelliJ IDEA.
  User: dongheonkim
  Date: 24. 12. 13.
  Time: 오후 2:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" isELIgnored="false" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>공동구독 상품 목록</title>
</head>
<body>
<h1>공동구독 상품 목록</h1>
<table border="1" cellpadding="10" cellspacing="0" style="width: 100%; text-align: center;">
    <thead>
    <tr>
        <th>상품명</th>
        <th>가격</th>
        <th>Start date</th>
        <th>End date</th>

    </tr>
    </thead>
    <tbody>
            <c:forEach var="subs" items="${subscribelist}">
                <tr>
                    <td>
                        <a href="${pageContext.request.contextPath}/subscribe/view?id=${subs.id}">
                                ${subs.title}
                        </a>
                    </td>
                    <td>${subs.price}원</td>
                    <td>${subs.startDate}</td>
                    <td>${subs.endDate}</td>
                </tr>
            </c:forEach>

    </tbody>
</table>
</body>
</html>

