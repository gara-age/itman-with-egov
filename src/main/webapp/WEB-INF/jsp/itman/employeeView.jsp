<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<html>
<head>
    <title>직원 상세</title>
    <style>
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
            text-align: left;
            font-size: 14px;
        }
        th {
            background-color: #4CAF50;
            color: white;
            width: 150px;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        .button-area {
            text-align: center;
            margin-top: 20px;
        }
        .btn {
            display: inline-block;
            padding: 10px 20px;
            margin: 5px;
            font-size: 14px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            text-decoration: none;
        }
        .btn:hover {
            background-color: #45a049;
        }
        .btn.delete {
            background-color: #e53935;
        }
        .btn.delete:hover {
            background-color: #c62828;
        }
        .btn.back {
            background-color: #888;
        }
        .btn.back:hover {
            background-color: #555;
        }
    </style>
</head>
<body>
<h2>직원 관리</h2>
<table>
    <tr>
        <th>사번</th>
        <td>${result.empNum}</td>
    </tr>
    <tr>
        <th>이름</th>
        <td>${result.empName}</td>
    </tr>
    <tr>
        <th>이메일</th>
        <td>${result.empMail}</td>
    </tr>
    <tr>
        <th>휴대폰</th>
        <td>${result.empTel}</td>
    </tr>
    <tr>
        <th>부서</th>
        <td>${result.empDiv}</td>
    </tr>
    <tr>
        <th>직위</th>
        <td>${result.posName}</td>
    </tr>
    <tr>
        <th>상태</th>
        <td>${result.empState}</td>
    </tr>
</table>

<div class="button-area">
    <button class="btn" onclick="location.href='/itman/employeeForm.do?empIdx=${result.empIdx}'">수정</button>
    <button class="btn delete" onclick="confirmDelete(${result.empIdx})">삭제</button>
    <button class="btn back" onclick="location.href='/itman/employeeList.do'">목록으로</button>
</div>
</body>
<script type="text/javascript">
    function confirmDelete(empIdx) {
        if (confirm("정말 삭제하시겠습니까?")) {
            // 삭제 진행
            // location.href로 페이지 이동
            location.href = "/itman/delete.do?empIdx=" + empIdx + "&deleted=Y";
        }
    }
</script>
<c:if test="${not empty msg}">
    <script>
        alert("${msg}");
    </script>
</c:if>
</html>
