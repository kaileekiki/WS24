<%@ page contentType="text/html; charset=UTF-8" isELIgnored="false" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>공동구매 상품 목록</title>
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
      border-collapse: collapse;
      margin: 0 auto;
      max-width: 800px; /* 테이블 너비 제한 */
      background-color: #fff;
      border: 1px solid #e2e2e0;
      border-radius: 8px;
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
      overflow: hidden;
    }

    th, td {
      padding: 15px;
      text-align: left;
      border-bottom: 1px solid #e2e2e0;
    }

    th {
      background-color: #f2f2f0;
      color: #5f4b32;
      font-weight: bold;
    }

    tr:hover {
      background-color: #faf8f2;
    }

    a {
      text-decoration: none;
      color: #7aa87d;
      font-weight: bold;
    }

    a:hover {
      color: #679563;
    }

    img {
      border-radius: 5px;
      box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    }

    tbody tr:last-child td {
      border-bottom: none;
    }
  </style>
</head>
<body>
<h1>공동구매 상품 목록</h1>
<table>
  <thead>
  <tr>
    <th>사진</th>
    <th>상품명</th>
    <th>가격</th>
  </tr>
  </thead>
  <tbody>
  <c:forEach var="item" items="${itemlist}">
    <tr>
      <td><img src="${pageContext.request.contextPath}/resources/img/${item.filename}" alt="이미지" width="100"/></td>
      <td><a href="${pageContext.request.contextPath}/item/view?id=${item.id}">${item.title}</a></td>
      <td>${item.price}원</td>
    </tr>
  </c:forEach>
  </tbody>
</table>
</body>
</html>
