<%@ include file="top.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>My Page</title>
</head>
<body>

<h1>마이페이지</h1>

<!-- 유저 정보 -->
<div>
    <h2>내 정보</h2>
    <table border="1">
        <tr>
            <th>이름</th>
            <td>${user.name}</td>
        </tr>
        <tr>
            <th>이메일</th>
            <td>${user.email}</td>
        </tr>
        <tr>
            <th>가입일</th>
            <td>${user.regdate}</td>
        </tr>
    </table>
</div>

<!-- 내가 찜한 목록 -->
<div>
    <h2>내가 찜한 목록</h2>
    <table border="1" cellpadding="10" cellspacing="0" style="width: 100%; text-align: center;">
        <thead>
        <tr>
            <th>상품명</th>
            <th>가격</th>
            <th>자세히 보기</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="favorite" items="${favorites}">
            <tr>
                <td>${favorite.title}</td>
                <td>${favorite.price}원</td>
                <td><a href="viewitem.jsp?id=${favorite.id}">보기</a></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

<!-- 내가 작성한 Add Item -->
<div>
    <h2>내가 작성한 Add Item</h2>
    <table border="1" cellpadding="10" cellspacing="0" style="width: 100%; text-align: center;">
        <thead>
        <tr>
            <th>상품명</th>
            <th>가격</th>
            <th>수정</th>
            <th>삭제</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="item" items="${myItems}">
            <tr>
                <td>${item.title}</td>
                <td>${item.price}원</td>
                <td><a href="edititem.jsp?id=${item.id}">수정</a></td>
                <td><a href="deleteitem.do?id=${item.id}">삭제</a></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

<!-- 내가 작성한 Add Subscribe -->
<div>
    <h2>내가 작성한 Add Subscribe</h2>
    <table border="1" cellpadding="10" cellspacing="0" style="width: 100%; text-align: center;">
        <thead>
        <tr>
            <th>상품명</th>
            <th>가격</th>
            <th>시작일</th>
            <th>종료일</th>
            <th>수정</th>
            <th>삭제</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="subscribe" items="${mySubscribes}">
            <tr>
                <td>${subscribe.title}</td>
                <td>${subscribe.price}원</td>
                <td>${subscribe.startDate}</td>
                <td>${subscribe.endDate}</td>
                <td><a href="editsubscribe.jsp?id=${subscribe.id}">수정</a></td>
                <td><a href="deletesubscribe.do?id=${subscribe.id}">삭제</a></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

</body>
</html>
