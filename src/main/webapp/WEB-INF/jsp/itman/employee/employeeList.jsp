<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html>
<head>
    <title>직원 목록</title><style>
    body {
        font-family: "맑은 고딕", sans-serif;
        background-color: #f9f9f9;
        padding: 40px;
    }
    h2 {
        color: #333;
        text-align: center;
    }
    table {
        width: 800px;
        margin: 0 auto;
        border-collapse: collapse;
        background-color: #fff;
        box-shadow: 0 0 10px rgba(0,0,0,0.1);
    }
    th, td {
        border: 1px solid #ddd;
        padding: 12px;
        text-align: center;
        font-size: 14px;
    }
    th {
        background-color: #4CAF50;
        color: white;
    }
    tr:nth-child(even) {
        background-color: #f2f2f2;
    }
    tr:hover {
        background-color: #e0f7fa;
    }
    a {
        text-decoration: none;
        color: #007BFF;
    }
    a:hover {
        text-decoration: underline;
    }
    .insert-btn {
        display: block;
        width: 120px;
        margin: 20px auto;
        padding: 10px;
        background-color: #4CAF50;
        color: #fff;
        text-align: center;
        border-radius: 5px;
    }
    .write-btn:hover {
        background-color: #45a049;
    }
    .totcnt{
        text-align: center;
        margin-top: 10px;
        font-size: 16px;
        color: #333;
    }
    .search-select {
        padding: 5px;
        font-size: 14px;
        border: 1px solid #ccc;
        border-radius: 4px;
    }
    .search-input {
        width: 250px;
        padding: 5px;
        font-size: 14px;
        border: 1px solid #ccc;
        border-radius: 4px;
    }
    .search-btn {
        padding: 5px 15px;
        background-color: #4CAF50;
        color: white;
        border: none;
        border-radius: 4px;
        font-size: 14px;
        cursor: pointer;
        margin-left: 5px;
    }
    .search-btn:hover {
        background-color: #45a049;
    }
    .search-container {
        text-align: center;
        margin-top: 20px;
    }
    .search-form {
        display: flex;
        justify-content: space-between;
        width: 800px;
        margin: 20px auto 0 auto;
        align-items: center;
    }

    .search-left {
        display: flex;
        gap: 10px;
        align-items: center;
    }

    .search-right {
        display: flex;
        gap: 10px;
        align-items: center;
    }

    .order-select {
        padding: 5px;
        font-size: 14px;
        border: 1px solid #ccc;
        border-radius: 4px;
    }

    #list {
        cursor: pointer;
    }
</style>
    </head>
<body>
<body>
<h2>직원 목록</h2>
<p class="totcnt">
    총 직원 수 : <strong>${fn:length(resultList)}</strong> 건
</p>
<form method="get" action="/bbs/bbsList.do" class="search-form" id="searchForm">
    <!-- 왼쪽: 검색 -->
    <div class="search-left">
        <select name="searchDiv" class="search-select">
            <option value="">-- 선택 --</option>
            <option value="title" <c:if test="${searchDiv eq 'title'}">selected</c:if>>제목</option>
            <option value="content" <c:if test="${searchDiv eq 'content'}">selected</c:if>>내용</option>
        </select>

        <input type="text" name="searchKeyword" value="${searchKeyword}" class="search-input" />

        <button type="submit" class="search-btn">검색</button>
    </div>

    <!-- 오른쪽: 정렬 -->
    <div class="search-right">
        <span class="order-label">정렬:</span>
        <select name="orderBy" class="order-select" onchange="document.getElementById('searchForm').submit();">
            <option value="">-- 정렬 선택 --</option>
            <option value="created_at DESC" <c:if test="${orderBy eq 'recent'}">selected</c:if>>최신순</option>
            <option value="created_at ASC" <c:if test="${orderBy eq 'past'}">selected</c:if>>등록순</option>
            <option value="hits DESC" <c:if test="${orderBy eq 'hits'}">selected</c:if>>조회수 높은순</option>
            <option value="title ASC" <c:if test="${orderBy eq 'titleAsc'}">selected</c:if>>제목 가나다순</option>
        </select>
    </div>

</form>

<table>
    <tr>
        <th>사번</th>
        <th>이름</th>
        <th>부서</th>
        <th>직위</th>
        <th>이메일</th>
        <th>휴대폰</th>
        <th>상태</th>
    </tr>
    <c:forEach var="vo" items="${resultList}" varStatus="status">
        <tr id="list" onclick="location.href='/itman/employeeView.do?empIdx=${vo.empIdx}'">
            <!-- 내림차순 번호 출력 -->
            <td> ${vo.empNum} </td>
            <td> ${vo.empName} </td>
            <td> ${vo.empDiv} </td>
            <td> ${vo.posName} </td>
            <td> ${vo.empMail}</td>
            <td> ${vo.empTel} </td>
            <td> ${vo.empState} </td>
        </tr>
    </c:forEach>
</table>
<c:if test="${!empty msg}">
    <script>
        alert("${msg}");
    </script>
</c:if>
<a href="/itman/employeeForm.do" class="insert-btn">직원 추가</a>
</body>
</body>
</html>
