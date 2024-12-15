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

        h2 {
            color: #5f4b32;
            margin-bottom: 30px;
            text-align: center;
            font-size: 28px;
            font-weight: bold;
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

        .actions {
            text-align: center;
            margin-bottom: 40px;
        }

        .actions button {
            background-color: #7aa87d;
            color: #fff;
            border: none;
            border-radius: 5px;
            padding: 10px 20px;
            cursor: pointer;
            font-size: 16px;
            margin: 10px;
            transition: background-color 0.3s;
        }

        .actions button:hover {
            background-color: #679563;
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
    <!-- 사용자 정보 -->
    <h2>마이 페이지</h2>
    <div class="account-info">
        <h3 class="subtitle text-center">내 계정 정보</h3>
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

    <!-- 유저 디테일 등록 버튼 -->
    <div class="actions">
        <button type="button" onclick="location.href='${pageContext.request.contextPath}/userdetail/add'">유저 디테일 등록</button>
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
                <!-- Edit 버튼 -->
                <button class="edit" onclick="location.href='${pageContext.request.contextPath}/item/edit?id=${item.id}'">Edit</button>
                <!-- Delete 버튼 -->
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

<script>
    // URL에서 errorMessage 파라미터를 추출하는 함수
    function getParameterByName(name) {
        const url = window.location.href;
        name = name.replace(/[\[\]]/g, '\\$&');
        const regex = new RegExp('[?&]' + name + '(=([^&#]*)|&|#|$)');
        const results = regex.exec(url);
        if (!results) return null;
        if (!results[2]) return '';
        return decodeURIComponent(results[2].replace(/\+/g, ' '));
    }

    // 에러 메시지가 있는 경우 팝업으로 표시
    document.addEventListener('DOMContentLoaded', function () {
        const errorMessage = getParameterByName('errorMessage');
        if (errorMessage) {
            alert(errorMessage);
        }
    });

    <%--function deleteItem(button) {--%>
    <%--    // 부모 요소에서 data-id 속성을 가져옴--%>
    <%--    const itemId = button.closest('.item').getAttribute('data-id');--%>
    <%--    console.log("Deleting item with ID:", itemId); // 디버깅용 로그--%>

    <%--    if (itemId) {--%>
    <%--        if (confirm("이 상품을 삭제하시겠습니까?")) {--%>
    <%--            location.href = `${pageContext.request.contextPath}/item/delete?id=${itemId}`;--%>
    <%--        }--%>
    <%--    } else {--%>
    <%--        alert("유효하지 않은 아이템 ID입니다.");--%>
    <%--    }--%>
    <%--}--%>


    <%--function deleteSubscribe(subscribeId) {--%>
    <%--    console.log("Deleting subscribe with ID:", subscribeId); // 디버깅용 로그--%>
    <%--    if (confirm("이 구독 상품을 삭제하시겠습니까?")) {--%>
    <%--        location.href = `${pageContext.request.contextPath}/subscribe/delete?id=${subscribe.id}`;--%>
    <%--    }--%>

    // Flash Attribute로 전달된 메시지 확인
    const message = "${message}";
    if (message) {
        alert(message); // 메시지를 팝업으로 표시
    }
</script>
<jsp:include page="bottom.jsp" />
</body>
</html>
