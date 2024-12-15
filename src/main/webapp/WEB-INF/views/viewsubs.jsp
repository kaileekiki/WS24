<%@ page contentType="text/html; charset=UTF-8" isELIgnored="false" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>구독 상세 정보</title>
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
            text-align: left;
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

<h1>구독 상품 상세 정보</h1>

<table>
    <tr>
        <th>상품명</th>
        <td>${subscribe.title}</td>
    </tr>
    <tr>
        <th>지역</th>
        <td>${subscribe.region}</td>
    </tr>
    <tr>
        <th>가격</th>
        <td>${subscribe.price}원</td>
    </tr>
    <tr>
        <th>카카오톡 링크</th>
        <td><a href="${subscribe.kakao}" target="_blank">${subscribe.kakao}</a></td>
    </tr>
    <tr>
        <th>정원</th>
        <td>${subscribe.people}/${subscribe.peopleLimit}명</td>
    </tr>
    <tr>
        <th>시작 날짜</th>
        <td>${subscribe.startDate}</td>
    </tr>
    <tr>
        <th>종료 날짜</th>
        <td>${subscribe.endDate}</td>
    </tr>
    <tr>
        <th>등록 날짜</th>
        <td>${subscribe.regdate}</td>
    </tr>
</table>
<div>
    <form action="${pageContext.request.contextPath}/joinsubs/add" method="post">
        <input type="hidden" name="subsId" value="${subscribe.id}" />
        <button type="submit" class="back-button">찜</button>
    </form>
</div>
<a href="${pageContext.request.contextPath}/subscribe/list" class="back-button">목록으로 돌아가기</a>

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
