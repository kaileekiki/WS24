<%@ page contentType="text/html; charset=UTF-8" isELIgnored="false" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>${item.title}</title>
</head>
<body>

<h1>공동구매 상품 상세정보</h1>

<table border="1" cellpadding="5" cellspacing="0">
    <thead>
    <tr>
        <th colspan="2">상품 정보</th>
    </tr>
    </thead>
    <tbody>

    <tr>
        <td>상품 이미지</td>
        <img src="${pageContext.request.contextPath}/uploads/${item.filename}" alt="상품 이미지">
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
    <a href="${pageContext.request.contextPath}/item/list">상품 목록으로 돌아가기</a>
</div>

</body>
</html>
