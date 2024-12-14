<%@ page contentType="text/html; charset=UTF-8" isELIgnored="false" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>${item.title}</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f7;
            color: #333;
            margin: 0;
            padding: 20px;
        }

        h1 {
            color: #5f4b32;
            text-align: center;
            margin-bottom: 20px;
        }

        table {
            width: 100%;
            max-width: 800px;
            margin: 0 auto;
            border-collapse: collapse;
            background-color: #fff;
            border: 1px solid #e2e2e0;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            overflow: hidden;
        }

        th {
            background-color: #f2f2f0;
            color: #5f4b32;
            font-weight: bold;
            text-align: center;
            padding: 15px;
            border-bottom: 1px solid #e2e2e0;
        }

        td {
            padding: 15px;
            border-bottom: 1px solid #e2e2e0;
            text-align: left;
        }

        tr:last-child td {
            border-bottom: none;
        }

        img {
            max-width: 100%;
            height: auto;
            display: block;
            margin: 10px auto;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        a {
            text-decoration: none;
            color: #7aa87d;
            font-weight: bold;
        }

        a:hover {
            color: #679563;
        }

        .back-button {
            display: block;
            text-align: center;
            margin: 20px auto;
            background-color: #7aa87d;
            color: #fff;
            padding: 10px 20px;
            border-radius: 5px;
            max-width: 200px;
            text-decoration: none;
            font-size: 16px;
        }

        .back-button:hover {
            background-color: #679563;
        }
    </style>
</head>
<body>

<h1>공동구매 상품 상세정보</h1>

<table>
    <thead>
    <tr>
        <th colspan="2">상품 정보</th>
    </tr>
    </thead>
    <tbody>
    <tr>
        <td colspan="2">
            <img src="${pageContext.request.contextPath}/resources/img/${item.filename}" alt="상품 이미지">
        </td>
    </tr>
    <tr>
        <td>상품명</td>
        <td>${item.title}</td>
    </tr>
    <tr>
        <td>상품 설명</td>
        <td>${item.content}</td>
    </tr>
    <tr>
        <td>가격</td>
        <td>${item.price}원</td>
    </tr>
    <tr>
        <td>지역</td>
        <td>${item.region}</td>
    </tr>
    <tr>
        <td>카카오톡 링크</td>
        <td><a href="${item.kakao}" target="_blank">${item.kakao}</a></td>
    </tr>
    <tr>
        <td>상품 링크</td>
        <td><a href="${item.itemLink}" target="_blank">${item.itemLink}</a></td>
    </tr>
    <tr>
        <td>등록 인원</td>
        <td>${item.people} / ${item.peopleLimit}명</td>
    </tr>
    <tr>
        <td>등록 날짜</td>
        <td>${item.regdate}</td>
    </tr>
    </tbody>
</table>

<div>
    <a href="${pageContext.request.contextPath}/item/list" class="back-button">상품 목록으로 돌아가기</a>
</div>

</body>
</html>
