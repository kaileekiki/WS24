<%@ page contentType="text/html; charset=UTF-8" isELIgnored="false" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>구독 상세 정보</title>
</head>
<body>
<h1>구독 상품 상세 정보</h1>

<table border="1" cellpadding="10" cellspacing="0" style="width: 100%; text-align: left;">
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


</body>
</html>
