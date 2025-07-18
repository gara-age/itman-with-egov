<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>직원 추가</title>
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
        input[type="text"], textarea {
            width: 98%;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
            font-size: 14px;
        }
        textarea {
            resize: vertical;
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
        .btn.cancel {
            background-color: #888;
        }
        .btn.cancel:hover {
            background-color: #555;
        }
    </style>
</head>
<body>
<h2>직원정보 ${empty resultVo.empIdx ? '추가' : '수정'}</h2>

<c:set var="actionUrl" value="/itman/insert.do" />
<c:if test="${!empty resultVo.empIdx}">
    <c:set var="actionUrl" value="/itman/update.do" />
</c:if>

<form id="employeeForm" name="employeeForm" method="post" action="${actionUrl}" onsubmit="return validateForm();">
    <c:if test="${!empty resultVo.empIdx}">
        <input type="hidden" name="empIdx" value="${resultVo.empIdx}" />
    </c:if>

        <table>
            <h1>직원 관리</h1>
            <tr>
                <th>사번</th>
                <td>
                    <input type="text" name="empNum" placeholder="사번을 입력해주세요."  value="${resultVo.empNum }" />
                </td>
            </tr>

            <tr>
                <th>이름</th>
                <td>
                    <input type="text" name="empName" placeholder="이름을 입력해주세요." value="${resultVo.empName }" />
                </td>
            </tr>
            <tr>
                <th>이메일</th>
                <td>
                <input type="text" name="empMail" placeholder="이메일을 입력해주세요." value="${resultVo.empMail }" />
            </td>
            </tr>
            <tr>
                <th>휴대폰</th>
                <td>
                    <input type="text" name="empTel" placeholder="휴대폰번호를 입력해주세요." value="${resultVo.empTel }" />
                </td>
            </tr>
            <tr>
                <th>부서</th>
                <td>
                    <input type="text" name="divIdx" placeholder="부서를 선택해주세요." value="${resultVo.divIdx }" />
                </td>
            </tr>
            <tr>
                <th>직위</th>
                <td>
                    <input type="text" name="posIdx" placeholder="직위를 선택해주세요." value="${resultVo.posIdx }" />
                </td>
            </tr>
            <tr>
                <th>상태</th>
                <td>
                    <input type="text" name="empStIdx" placeholder="상태를 선택해주세요." value="${resultVo.empStIdx }" />
                </td>
            </tr>
        </table>

        <div class="button-area">
            <c:choose>
                <c:when test="${!empty resultVo.empIdx}">
                    <button type="submit" class="btn">수정</button>
                </c:when>
                <c:otherwise>
                    <button type="submit" class="btn">추가</button>
                </c:otherwise>
            </c:choose>

            <button type="button" class="btn cancel" onclick="location.href='/itman/employeeList.do'">취소</button>
        </div>
</form>

<script type="text/javascript">
    function validateForm() {
        const form = document.forms["employeeForm"];

        const empNum = form.empNum.value.trim();
        const empName = form.empName.value.trim();

        if (empNum === "") {
            alert("사번을 입력하세요.");
            form.empNum.focus();
            return false;
        }

        if (empName === "") {
            alert("이름을 입력하세요.");
            form.empName.focus();
            return false;
        }

        return true;
    }
</script>
</body>
</html>
