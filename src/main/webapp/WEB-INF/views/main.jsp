<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Main</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f7;
            color: #333;
            margin: 0;
            padding: 0;
        }

        h1 {
            text-align: center;
            color: #5f4b32;
        }

        .container {
            display: flex;
            justify-content: space-around;
            align-items: flex-start;
            margin: 20px auto;
            padding: 20px;
            max-width: 1200px;
        }

        .section {
            width: 45%;
            background-color: #fff;
            border: 1px solid #e2e2e0;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 20px;
            position: relative;
        }

        .section h3 {
            color: #a97b5d; /* 연갈색 */
            border-bottom: 2px solid #e2e2e0;
            padding-bottom: 10px;
            margin-bottom: 20px;
        }

        .table-container {
            max-height: 300px;
            overflow-y: auto;
            margin-bottom: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            text-align: left;
            padding: 10px;
            border-bottom: 1px solid #e2e2e0;
        }

        th {
            background-color: #f2f2f0;
            color: #5f4b32;
        }

        td {
            color: #333;
        }

        button {
            background-color: #a2d5a2; /* 연한 초록색 */
            color: #fff;
            border: none;
            border-radius: 4px;
            padding: 10px 15px;
            cursor: pointer;
            font-size: 14px;
            margin-right: 10px;
        }

        button:hover {
            background-color: #8fcf8f;
        }

        .actions {
            margin-top: 20px;
        }

        .actions .btn-action {
            float: right; /* 우측 하단으로 배치 */
        }

        .btn-list-action {
            background-color: #79c979; /* 진한 초록색 */
        }

        .btn-list-action:hover {
            background-color: #66b866;
        }
    </style>
</head>
<body>
<jsp:include page="top.jsp"/>

<h1>Bytegether</h1>

<div class="container">
    <!-- 공동구매 Section -->
    <div class="section">
        <h3>공동구매 list</h3>
        <div class="table-container">
            <table id="itemlist">
                <thead>
                <tr>
                    <th>Item</th>
                    <th>Price</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${itemlist}" var="u">
                    <tr>
                        <td>${u.title}</td>
                        <td>${u.price}원</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
        <div class="actions">
            <button type="button" class="btn-list-action" onclick="location.href='${pageContext.request.contextPath}/item/list'">공동구매하러 가기</button>
            <button type="button" class="btn-action" onclick="location.href='${pageContext.request.contextPath}/item/add'">공동구매 등록</button>
        </div>
    </div>

    <!-- 공동구독 Section -->
    <div class="section">
        <h3>공동구독 list</h3>
        <div class="table-container">
            <table id="subscribelist">
                <thead>
                <tr>
                    <th>Platform</th>
                    <th>Price</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${subscribelist}" var="u">
                    <tr>
                        <td>${u.title}</td>
                        <td>${u.price}원</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
        <div class="actions">
            <button type="button" class="btn-list-action" onclick="location.href='${pageContext.request.contextPath}/subscribe/list'">공동구독하러 가기</button>
            <button type="button" class="btn-action" onclick="location.href='${pageContext.request.contextPath}/subscribe/add'">공동구독 등록</button>
        </div>
    </div>
</div>

<jsp:include page="bottom.jsp"/>
</body>
</html>
