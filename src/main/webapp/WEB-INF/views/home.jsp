<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>마이 페이지</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f7;
            color: #333;
            margin: 0;
            padding: 0;
        }

        .page-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 30px;
        }

        .page-header h2 {
            color: #5f4b32;
            font-size: 28px;
            font-weight: bold;
            margin: 0;
        }

        .header-buttons {
            display: flex;
            gap: 10px;
        }

        .header-buttons button {
            border: none;
            border-radius: 5px;
            padding: 10px 15px;
            cursor: pointer;
            font-size: 14px;
            transition: background-color 0.3s;
        }

        .wishlist-button {
            background-color: #ff6f61; /* 주홍색 */
            color: white;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 10px 15px;
            border-radius: 5px;
            font-weight: bold;
        }

        .wishlist-button:hover {
            background-color: #e65b4e;
        }

        .wishlist-button i {
            margin-right: 5px;
        }

        .user-detail-button {
            background-color: #7aa87d;
            color: white;
        }

        .user-detail-button:hover {
            background-color: #679563;
        }

        .container {
            max-width: 900px;
            margin: 30px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .account-info {
            background-color: #faf8f2;
            padding: 20px;
            border-radius: 8px;
            border: 1px solid #e2e2e0;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            margin-bottom: 40px;
        }

        .account-info p {
            font-size: 16px;
            color: #555;
            margin-bottom: 10px;
        }

        .account-info img {
            display: block;
            margin: 20px auto;
            border-radius: 10px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .item, .subscribe {
            border: 1px solid #e2e2e0;
            border-radius: 8px;
            padding: 15px;
            margin-bottom: 20px;
            background-color: #faf8f2;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .item h3, .subscribe h3 {
            margin: 0;
            font-size: 18px;
            color: #5f4b32;
            flex: 1;
        }

        .item p, .subscribe p {
            margin: 0;
            font-size: 14px;
            color: #555;
            flex: 2;
        }

        .item-buttons, .subscribe-buttons {
            flex: 1;
            text-align: right;
        }

        .item-buttons button, .subscribe-buttons button {
            padding: 8px 12px;
            margin-left: 10px;
            font-size: 14px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .item-buttons button.edit, .subscribe-buttons button.edit {
            background-color: #7aa87d;
            color: white;
        }

        .item-buttons button.delete, .subscribe-buttons button.delete {
            background-color: palevioletred;
            color: white;
        }

        .item-buttons button.edit:hover, .subscribe-buttons button.edit:hover {
            background-color: #679563;
        }

        .item-buttons button.delete:hover, .subscribe-buttons button.delete:hover {
            background-color: crimson;
        }
    </style>
</head>
<body>
<jsp:include page="top.jsp"/>

<div class="container">
    <!-- Page Header -->
    <div class="page-header">
        <h2>My Page</h2>
        <div class="header-buttons">
            <!-- Wishlist Button -->
            <button type="button" class="wishlist-button" onclick="location.href='${pageContext.request.contextPath}/wishlist'">
                <i class="fas fa-heart"></i> 찜 페이지로 이동
            </button>
            <!-- User Detail Register Button -->
            <button type="button" class="user-detail-button" onclick="location.href='${pageContext.request.contextPath}/userdetail/add'">유저 디테일 등록</button>
        </div>
    </div>

    <!-- 사용자 정보 -->
    <div class="account-info">
        <h3 class="subtitle text-center">My Information</h3>
        <p><strong>닉네임:</strong> ${userDetails.nickname}</p>
        <p><strong>카카오톡:</strong> ${userDetails.kakao}</p>
        <p><strong>전화번호:</strong> ${userDetails.phoneNum}</p>
        <c:if test="${userDetails.filename != null}">
            <img src="${pageContext.request.contextPath}/resources/img/${userDetails.filename}" alt="사용자 사진" width="150" />
        </c:if>
        <c:if test="${userDetails.filename == null}">
            <p>사진이 없습니다.</p>
        </c:if>
    </div>

    <!-- 내가 작성한 상품 -->
    <h3 class="subtitle">내가 작성한 상품</h3>
    <c:forEach var="item" items="${userItems}">
        <div class="item" data-id="${item.id}">
            <div>
                <h3>${item.title}</h3>
                <p>${item.content}</p>
                <p><strong>가격:</strong> ${item.price}원</p>
            </div>
            <div class="item-buttons">
                <button class="view" onclick="location.href='${pageContext.request.contextPath}/item/view?id=${item.id}'">View</button>
                <button class="edit" onclick="location.href='${pageContext.request.contextPath}/item/edit?id=${item.id}'">Edit</button>
                <button class="delete" onclick="location.href='${pageContext.request.contextPath}/item/delete?id=${item.id}'">Delete</button>
            </div>
        </div>
    </c:forEach>

    <!-- 내가 작성한 구독 상품 -->
    <h3 class="subtitle">내가 작성한 구독 상품</h3>
    <c:forEach var="subscribe" items="${userSubscribes}">
        <div class="subscribe">
            <div>
                <h3>${subscribe.title}</h3>
                <p><strong>기간:</strong> ${subscribe.startDate} ~ ${subscribe.endDate}</p>
                <p><strong>가격:</strong> ${subscribe.price}원</p>
            </div>
            <div class="subscribe-buttons">
                <button class="view" onclick="location.href='${pageContext.request.contextPath}/subscribe/view?id=${subscribe.id}'">View</button>
                <button class="edit" onclick="location.href='${pageContext.request.contextPath}/subscribe/edit?id=${subscribe.id}'">Edit</button>
                <button class="delete" onclick="location.href='${pageContext.request.contextPath}/subscribe/delete?id=${subscribe.id}'">Delete</button>
            </div>
        </div>
    </c:forEach>
</div>

<script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
<jsp:include page="bottom.jsp"/>
</body>
</html>
