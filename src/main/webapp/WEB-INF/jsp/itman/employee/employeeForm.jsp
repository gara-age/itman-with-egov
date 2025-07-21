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
        select {
        padding: 0 20px 0 0px;
            font:400 15px/18px "Open Sans", "Noto Sans KR", sans-serif;
            color:#222; border:none;
            outline:none;
            -moz-appearance:none;
            -webkit-appearance:none;
            appearance:none;
            background-color: transparent;

        }
        option {
            background-color: transparent;

        }
    </style>
</head>
<body>
<h2>직원정보 ${empty resultVo.empIdx ? '추가' : '수정'}</h2>
<input type="hidden" name="groIdx" value="${resultVo.groIdx}" />
<input type="hidden" name="posIdx" value="${resultVo.posIdx}" />
<input type="hidden" name="empStIdx" value="${resultVo.empStIdx}" />

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
                    <c:choose>
                        <c:when test="${!empty resultVo.empIdx}">
                            <input type="text" name="empNum" value="${resultVo.empNum }" />
                        </c:when>
                        <c:otherwise>
                            <input type="text" name="empNum" placeholder="사번을 입력해주세요."  value="${resultVo.empNum }" />
                        </c:otherwise>
                    </c:choose>

                </td>
            </tr>

            <tr>
                <th>이름</th>
                <td>
                    <c:choose>
                        <c:when test="${!empty resultVo.empIdx}">
                            <input type="text" name="empName" value="${resultVo.empName }" />
                        </c:when>
                        <c:otherwise>
                            <input type="text" name="empName" placeholder="이름을 입력해주세요." value="${resultVo.empName }" />
                        </c:otherwise>
                    </c:choose>

                </td>
            </tr>
            <tr>
                <th>이메일</th>
                <td>
                    <c:choose>
                        <c:when test="${!empty resultVo.empIdx}">
                            <input type="text" name="empMail" value="${resultVo.empMail }" />
                        </c:when>
                        <c:otherwise>
                            <input type="text" name="empMail" placeholder="이메일을 입력해주세요." value="${resultVo.empMail }" />
                        </c:otherwise>
                    </c:choose>

            </td>
            </tr>
            <tr>
                <th>휴대폰</th>
                <td>
                    <c:choose>
                        <c:when test="${!empty resultVo.empIdx}">
                            <input type="text" name="empTel" value="${resultVo.empTel }" />
                        </c:when>
                        <c:otherwise>
                            <input type="text" name="empTel" placeholder="휴대폰번호를 입력해주세요." value="${resultVo.empTel }" />
                        </c:otherwise>
                    </c:choose>
                </td>
            </tr>
            <tr>
                <th>부서</th>
                <td>
                    <select name="divIdx">
                         <option value="" >부서를 선택해주세요</option>
                        <c:forEach var="d" items="${divisionList}">

                            <c:choose>
                                <c:when test="${d.divIdx == resultVo.divIdx}">
                                    <c:if test="${!empty d.divIdx}">
                                        <option value="${d.divIdx}" selected="selected">${d.divName}</option>
                                    </c:if>

                                </c:when>
                                <c:otherwise>
                                    <option value="${d.divIdx}">${d.divName}</option>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
                    </select>
                </td>
            </tr>
            <tr>
                <th>직위</th>
                <td>
                    <select name="posIdx">
                        <option value="" >직위를 선택해주세요</option>
                        <c:forEach var="p" items="${positionList}">

                            <c:choose>
                                <c:when test="${p.posIdx == resultVo.posIdx}">
                                    <c:if test="${!empty p.posIdx}">
                                        <option value="${p.posIdx}" selected="selected">${p.posName}</option>
                                    </c:if>

                                </c:when>
                                <c:otherwise>
                                    <option value="${p.posIdx}">${p.posName}</option>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
                    </select>

<%--                    <input type="text" name="posIdx" placeholder="직위를 선택해주세요." value="${resultVo.posIdx }" />--%>
                </td>
            </tr>
            <tr>
                <th>상태</th>
                <td>
                    <select name="empStIdx">
                        <option value="" >상태를 선택해주세요</option>
                        <c:forEach var="s" items="${empStateList}">

                            <c:choose>
                                <c:when test="${s.empStIdx == resultVo.empStIdx}">
                                    <c:if test="${!empty s.empStIdx}">
                                        <option value="${s.empStIdx}" selected="selected">${s.empStName}</option>
                                    </c:if>

                                </c:when>
                                <c:otherwise>
                                    <option value="${s.empStIdx}">${s.empStName}</option>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
                    </select>

<%--                    <input type="text" name="empStIdx" placeholder="상태를 선택해주세요." value="${resultVo.empStIdx }" />--%>
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
        const empDivIdx = form.divIdx.value.trim();
        const empPosIdx = form.posIdx.value.trim();
        const empStIdx = form.empStIdx.value.trim();


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

        if (empDivIdx === "") {
            alert("부서를 선택하세요.");
            form.divIdx.focus();
            return false;
        }

        if (empPosIdx === "") {
            alert("직위를 선택하세요.");
            form.posIdx.focus();
            return false;
        }

        if (empStIdx === "") {
            alert("상태를 선택하세요.");
            form.empStIdx.focus();
            return false;
        }

        return true;
    }
</script>
</body>
</html>
