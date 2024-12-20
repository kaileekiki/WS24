<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Wishlist</title>
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
            margin-bottom: 30px;
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
        }

        .section h3 {
            color: #7aa87d;
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
            background-color: #7aa87d;
            color: #fff;
            border: none;
            border-radius: 4px;
            padding: 10px 15px;
            cursor: pointer;
            font-size: 14px;
            margin-right: 10px;
        }

        button:hover {
            background-color: #679563;
        }

        .actions {
            text-align: center;
            margin-top: 20px;
        }
    </style>
</head>
<body>
<jsp:include page="top.jsp" />

<h1>Wishlist</h1>

<div class="container">
    <!-- 공동구매 Section -->
    <div class="section">
        <h3>공동구매</h3>
        <div class="table-container">
            <table id="joinedItemsTable">
                <thead>
                <tr>
                    <th>상품</th>
                    <th>가격</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="item" items="${joinedItems}">
                    <tr>
                        <td>${item.itemVO.title}</td>
                        <td>${item.itemVO.price}원</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>

    <!-- 공동구독 Section -->
    <div class="section">
        <h3>공동구독</h3>
        <div class="table-container">
            <table id="joinedSubsTable">
                <thead>
                <tr>
                    <th>상품</th>
                    <th>지역</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="subs" items="${joinedSubs}">
                    <tr>
                        <td>${subs.subscribeVO.title}</td>
                        <td>${subs.subscribeVO.region}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>

<jsp:include page="bottom.jsp" />
</body>
</html>
