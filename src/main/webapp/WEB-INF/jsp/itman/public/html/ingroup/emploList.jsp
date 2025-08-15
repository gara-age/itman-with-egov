<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!-- 1. 타이틀과 헤더 포함 -->
<!doctype html>
<html lang="ko">
<head>
    <jsp:include page="${pageContext.request.contextPath}/WEB-INF/jsp/itman/_inc/checkSession.jsp"/>
    <jsp:include page="${pageContext.request.contextPath}/WEB-INF/jsp/itman/_inc/title.jsp" />
    <jsp:include page="${pageContext.request.contextPath}/WEB-INF/jsp/itman/_inc/header.jsp" />

</head>
<body>

<div id="contents">
    <!-- 2. 검색 폼: action과 hidden 필드로 페이지 정보 유지 -->
    <div class="tit_search">
        <h2>직원 관리</h2>
        <form id="searchForm" name="searchForm" method="get" action="${pageContext.request.contextPath}/itman/employeeList.do" onsubmit="this.page.value=1; this.range.value=1;">
            <input type="hidden" id="page"      name="page"      value="${pagination.page}" />
            <input type="hidden" id="range"     name="range"     value="${pagination.range}" />
            <input type="hidden" id="rangeSize" name="rangeSize" value="${pagination.rangeSize}" />

            <p class="list_search">
<%--                <select id="DIV_IDX" name="searching.divIdx" onchange="document.getElementById('searchForm').submit()">--%>
<%--                    <option value="" selected>부서 선택</option>--%>
<%--                    <c:forEach var="d" items="${divisionList}">--%>
<%--                                <option value="${d.divIdx}" ${d.divIdx == pagination.searching.divIdx ? "selected" : ""}>${d.divName}</option>--%>
<%--                    </c:forEach>--%>
<%--                </select>--%>
<%--    <select id="POS_IDX" name="searching.posIdx" onchange="document.getElementById('searchForm').submit()">--%>
<%--        <option value=""  selected>직위 선택</option>--%>
<%--        <c:forEach var="p" items="${positionList}">--%>
<%--                    <option value="${p.posIdx}" ${p.posIdx == pagination.searching.posIdx ? "selected" : ""}>${p.posName}</option>--%>

<%--        </c:forEach>--%>
<%--    </select>--%>

<%--                <select id="EMP_ST_IDX" name="searching.stIdx" onchange="document.getElementById('searchForm').submit()">--%>
<%--                    <option value="" selected>상태 선택</option>--%>
<%--                    <c:forEach var="s" items="${empStateList}">--%>
<%--                        <option value="${s.empStIdx}" ${s.empStIdx == pagination.searching.stIdx ? "selected" : ""}>${s.empStName}</option>--%>
<%--                    </c:forEach>--%>
<%--                </select>--%>
                <select name="searching.searchCondition" >
                    <option value="" >전체</option>
                    <option value="empNum" ${pagination.searching.searchCondition=='empNum' ? 'selected' : ''}>사번</option>
                    <option value="empName" ${pagination.searching.searchCondition=='empName' ? 'selected' : ''}>이름</option>
                    <option value="empDiv" ${pagination.searching.searchCondition=='empDiv' ? 'selected' : ''}>부서</option>
                </select>
                <input name="searching.searchKeyword" type="text" value="${pagination.searching.searchKeyword}" placeholder="검색어를 입력해주세요."/>
                <a href="#" onclick="const form = this.closest('form'); form.page.value=1; form.range.value=1; form.submit();">검색</a>

            </p>
        </form>
    </div>

    <!-- 3. 결과 개수 출력 -->
    <div class="num_list">
        <p class="total">총 <span>${pagination.listCnt}</span>건의 결과가 있습니다.</p>
    </div>

    <!-- 4. 신규 등록 버튼 -->
    <p class="addContent">
        <a href="/itman/employeeWrite.do"><span></span><span></span><span></span></a>
    </p>

    <!-- 5. 목록 출력: resultList는 List<Map> 혹은 List<VO> -->
    <div class="Basic">
        <ul class="adminList click">
            <li class="tit">
                <p class="num">사번</p>
                <p class="tit">이름</p>
                <p class="depart">부서</p>
                <p class="spot">직위</p>
                <p class="mail">이메일</p>
                <p class="tel">휴대폰</p>
                <p class="stat">상태</p>
            </li>
          <c:if test="${!empty resultList}">
              <c:forEach var="row" items="${resultList}">
                  <li onclick="location.href='${pageContext.request.contextPath}/itman/employeeView.do?empIdx=${row.empIdx}'">
                      <p class="num">${row.empNum}</p>
                      <p class="tit">${row.empName}</p>
                      <div class="depSpot">
                          <p class="depart">${row.empDiv}</p>
                          <p class="spot">${row.posName}</p>
                      </div>
                      <div class="mailTel">
                          <p class="mail">${empty row.empMail ? '-' : row.empMail}</p>
                          <p class="tel">${empty row.empTel ? '-' : row.empTel}</p>
                      </div>
                      <p class="stat">${row.empState}</p>
                  </li>
              </c:forEach>
            </c:if>
            <c:if test="${listCnt == 0}">
                <div style="text-align:center; margin-top:20px;">
                    일치하는 자료가 없습니다.
                </div>
            </c:if>
        </ul>
    </div>

    <!-- 6. 페이징 처리 -->
    <p class="paging">
        <!-- 현재 JSP 경로를 얻어 두기 -->
        <c:url var="selfUrl" value="${pageContext.request.requestURI}" />

        <!-- 첫 페이지 -->
        <a href="#" class="prev end" onclick="fn_maxPrev()"><img src="${pageContext.request.contextPath}/images/_img/first.png" alt="맨처음" /></a>

        <!-- 이전 페이지 -->
        <a href="#" class="prev" onclick="fn_prev(${pagination.page} , ${pagination.range}, ${pagination.rangeSize})"><img src="${pageContext.request.contextPath}/images/_img/prev.png" alt="이전으로"/></a>

        <!-- 번호 링크 -->
        <c:forEach begin="${pagination.startPage}" end="${pagination.endPage}" var="i">
            <a class="${i == pagination.page ? 'on' : ''}" href="#" onClick="changePage(${i}, ${pagination.range}, ${pagination.rangeSize});">${i}</a>
        </c:forEach>

        <!-- 다음 페이지 -->
        <a href="#" class="next" onClick="fn_next(${pagination.pageCnt},${pagination.page}, ${pagination.range}, ${pagination.rangeSize})"><img src="${pageContext.request.contextPath}/images/_img/next.png" alt="다음으로" /></a>

        <!-- 마지막 페이지 -->
        <a href="#" class="next end" onclick="fn_maxNext(${pagination.pageCnt}, ${pagination.range}, ${pagination.rangeSize})"><img src="${pageContext.request.contextPath}/images/_img/last.png" alt="맨마지막"/></a>
    </p>
</div>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/jsp/itman/_inc/footer.jsp" />
<!-- 7. 페이지 이동 스크립트: form 사용 시 필요 -->
<script>

    function changePage(page, range, rangeSize) {
        const form = document.getElementById('searchForm');
        form.page.value = page;
        form.range.value = range;
        form.rangeSize.value = rangeSize;
        form.submit();
    }
    //처음 버튼 이벤트
    function fn_maxPrev() {
        var url = "${pageContext.request.contextPath}/itman/employeeList.do";
        url = url + "?page=" + 1;
        url = url + "&range=" + 1;
        location.href = url;	}
    //이전 버튼 이벤트
    function fn_prev(page, range, rangeSize) {
        var page = (((range - 2) * rangeSize) + 1) <= 1 ? 1 : ((range - 2) * rangeSize) + 1 ;
        var range = (range - 1) <= 1 ? 1 : range - 1;
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
    function fn_next(pageCnt, page, range, rangeSize) {
        var page = (parseInt((range * rangeSize)) + 1) >= pageCnt ? pageCnt / rangeSize * 10 : parseInt((range * rangeSize)) + 1 ;
        var range = (parseInt(range) + 1) >= parseInt(pageCnt / rangeSize + 1) ? parseInt(pageCnt / rangeSize + 1) : (parseInt(range) + 1) ;
        var url = "${pageContext.request.contextPath}/itman/employeeList.do";
        url = url + "?page=" + page;
        url = url + "&range=" + range;
        location.href = url;	}
    //마지막 버튼 이벤트
    function fn_maxNext(pageCnt, range, rangeSize) {
        var page =  pageCnt / rangeSize * 10;
        var range =    parseInt(pageCnt / rangeSize + 1);
        var url = "${pageContext.request.contextPath}/itman/employeeList.do";
        url = url + "?page=" + page;
        url = url + "&range=" + range;
        location.href = url;
    }
</script>
</body>

