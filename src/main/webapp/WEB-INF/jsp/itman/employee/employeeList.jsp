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
        width: 900px;
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
    .btn-container {
        display: flex;
        justify-content: flex-end;
    }
    .insert-btn {
        width: 100px;
        height: 100px;
        margin: 20px 0;
        padding: 10px;
        background-color: #4CAF50;
        color: #fff;
        text-align: center;
        border-radius: 30px;
        display: inline-flex;
        justify-content: center;
        align-items: center;
        box-shadow: 0px 0px 10px gray;


    }
    #addEmpSvg {
        width: 50px;
        height: 50px;
        display: flex;
        margin: auto;
    }
    .insert-btn:hover {
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
        width: 900px;
        margin: 0px auto 0 auto;
        align-items: center;
    }

    .search-left {
        display: flex;
        justify-content: flex-start;
        /*gap: 10px;*/
        align-items: center;
    }
    .search-left details {
        position: relative;
        overflow: visible;
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
    li {
        display: inline;
        list-style-type: none;
    }

    #paginationBox {
        display: flex;
        justify-content: center;
    }
    #paginationBox .pagination {
        width: fit-content;
        margin: 15px 0 0 0 ;
    }

    #paginationBox .pagination .page-link {
        color: black;
        margin: 0 5px 0 5px;
    }
    #selectedEmployee {
        margin-top: 10px;
    }
    details { margin:5px 0 10px; }
    details > summary { background:#444; color:#fff; padding:10px; outline:0; border-radius:5px; cursor:pointer; transition:background 0.5s; text-align:left; box-shadow: 1px 1px 2px gray;}
    details > summary::-webkit-details-marker { background:#444; color:#fff; background-size:contain; transform:rotate3d(0, 0, 1, 90deg); transition:transform 0.25s;}
    details[open] > summary::-webkit-details-marker { transform:rotate3d(0, 0, 1, 180deg);}
    details[open] > summary { background:#444;}
    details[open] > summary ~ * { animation:reveal 0.5s;}
    .tpt { }

    @keyframes reveal {
        from { opacity:0; transform:translate3d(0, -30px, 0); }
        to { opacity:1; transform:translate3d(0, 0, 0); }
    }
    summary::marker{ content: "상세검색"; }
    details[open] summary::marker { content: "️접어두기 "; }

    .search-left details > #expandedDiv {
        position: absolute;
        top: 100%;       /* summary 바로 아래 */
        left: 0;         /* summary 왼쪽과 정렬 */
        margin: 5px 0;   /* 원하는 간격만 살리고 기존 margin 제거 */
        width: 900px;    /* form/table 너비에 맞춰주세요 */
        z-index: 10;     /* 위로 올라오도록 충분히 큰 값 */

        /* 기존 스타일 유지 */
        background: #444;
        color: #fff;
        padding: 5px 10px;
        border-radius: 5px;
        box-shadow: 1px 1px 2px gray;

        display: flex;
        flex-direction: row;
        align-items: center;
        gap: 12px;
    }

    select {
        padding: 0 20px 0 0px;
        font:400 15px/18px "Open Sans", "Noto Sans KR", sans-serif;
        color: white;
        border:none;
        outline:none;
        -moz-appearance:none;
        -webkit-appearance:none;
        appearance:none;
        background-color: transparent;

    }
</style>
    </head>
<body>
<body>
<h2>직원 목록</h2>
<p class="totcnt">
    조회된 총 직원 수 : <strong>${pagination.listCnt}</strong> 명
</p>
<form method="get" action="/bbs/bbsList.do" class="search-form" id="searchForm">
    <!-- 왼쪽: 검색 -->
    <div class="search-left">
        <details>
            <summary></summary>
            <div id="expandedDiv">

<%--            <table id="expandedTable">--%>
<%--            <tr>--%>
<%--                <td>--%>
                    <select>
                        <option selected>부서를 선택해주세요</option>
                    </select>
<%--                </td>--%>
<%--                <td>--%>
                    <select>
                        <option selected>직위를 선택해주세요</option>
                    </select>
<%--                </td>--%>
<%--                <td>--%>
                    <select>
                        <option selected>상태를 선택해주세요</option>
                    </select>
<%--                </td>--%>
<%--            </tr>--%>
<%--        </table>--%>
                    <input type="text" name="searchKeyword" value="${searchKeyword}" class="search-input" />
                    <button type="submit" class="search-btn">검색</button>
        </div>
        </details>


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

<table id="selectedEmployee">
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
<!-- pagination{s} -->
<div id="paginationBox">
    <ul class="pagination">
    <c:if test="${pagination.prev}">
        <li class="page-item"><a class="page-link" href="#" onClick="fn_prev('${pagination.page}', '${pagination.range}', '${pagination.rangeSize}')">Previous</a></li>
    </c:if>
    <c:forEach begin="${pagination.startPage}" end="${pagination.endPage}" var="idx">
        <li class="page-item <c:out value="${pagination.page == idx ? 'active' : ''}"/> ">
            <a class="page-link" href="#" onClick="fn_pagination('${idx}', '${pagination.range}', '${pagination.rangeSize}')">
                    ${idx}
            </a>
        </li>
    </c:forEach>
    <c:if test="${pagination.next}">
        <li class="page-item"><a class="page-link" href="#" onClick="fn_next('${pagination.range}', '${pagination.range}', '${pagination.rangeSize}')">
            Next</a>
        </li>
    </c:if>
</ul>
</div>
<!-- pagination{e} -->
<div class="btn-container">
<a href="/itman/employeeForm.do" class="insert-btn"><img id="addEmpSvg" src="/images/_img/addEmployeeSvg.png"/> </a>
</div>

<script>
    //이전 버튼 이벤트
    function fn_prev(page, range, rangeSize) {
        var page = ((range - 2) * rangeSize) + 1;
        var range = range - 1;
        var url = "${pageContext.request.contextPath}/itman/employeeList.do";
        url = url + "?page=" + page;
        url = url + "&range=" + range;
        location.href = url;	}
    //페이지 번호 클릭
    function fn_pagination(page, range, rangeSize, searchType, keyword) {
        var url = "${pageContext.request.contextPath}/itman/employeeList.do";
        url = url + "?page=" + page;
        url = url + "&range=" + range;
        location.href = url;		}
    //다음 버튼 이벤트
    function fn_next(page, range, rangeSize) {
        var page = parseInt((range * rangeSize)) + 1;
        var range = parseInt(range) + 1;
        var url = "${pageContext.request.contextPath}/itman/employeeList.do";
        url = url + "?page=" + page;
        url = url + "&range=" + range;
        location.href = url;	}
</script>
</div>

</body>
</body>
</html>
