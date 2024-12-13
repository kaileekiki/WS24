<%@ page contentType="text/html; charset=UTF-8" isELIgnored="false" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>

  <meta charset="UTF-8">
  <title>공동구매 상품 목록</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <meta charset="UTF-8">
  <title>공동구매 상품 목록</title>

  <meta charset="UTF-8">
  <title>공동구매 상품 목록</title>
    <meta charset="UTF-8">
    <title>공동구매 상품 목록</title>
</head>
<body>

<h1>공동구매 상품 목록</h1>

<table border="1" cellpadding="10" cellspacing="0" style="width: 100%; text-align: center;">
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
      <td>
        <img src="${pageContext.request.contextPath}/resources/img/${item.filename}"
             alt="상품 이미지"
             style="width: 100px; height: auto;">
      </td>
      <td>
        <a href="${pageContext.request.contextPath}/item/view?id=${item.id}">${item.title}</a>
      </td>
      <td>${item.price}원</td>
    </tr>
  </c:forEach>
  </tbody>
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
      <td>

        <img src="${pageContext.request.contextPath}/resources/img/${item.filename}"
             class="file"
             alt="상품 이미지"
             style="width: 100px; height: auto;">
      </td>
      <td>
        <a href="${pageContext.request.contextPath}/item/view?id=${item.id}">${item.title}</a>
      </td>
      <td>${item.price}원</td>
    </tr>
  </c:forEach>

  </tbody>
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
      <td>

        <img src="${pageContext.request.contextPath}/resources/img/${item.filename}"
             class="file"
             alt="상품 이미지"
             style="width: 100px; height: auto;">
      </td>
      <td>
        <a href="${pageContext.request.contextPath}/item/view?id=${item.id}">${item.title}</a>
      </td>
      <td>${item.price}원</td>
    </tr>
  </c:forEach>

  </tbody>

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
            <td>

                <img src="${pageContext.request.contextPath}/resources/img/${item.filename}"
                     class="file"
                     alt="상품 이미지"
                     style="width: 100px; height: auto;">
            </td>
            <td>
                <a href="${pageContext.request.contextPath}/item/view?id=${item.id}">${item.title}</a>
            </td>
            <td>${item.price}원</td>
        </tr>
    </c:forEach>

    </tbody>
</table>

</body>
</html>
