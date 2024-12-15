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
<jsp:include page="top.jsp" />


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
    <form action="${pageContext.request.contextPath}/joinitem/add" method="post">
        <input type="hidden" name="itemId" value="${item.id}" />
        <button type="submit" class="back-button">찜</button>
    </form>
</div>
<div>
    <a href="${pageContext.request.contextPath}/item/list" class="back-button">상품 목록으로 돌아가기</a>
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
