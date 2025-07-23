<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" language="java" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

<!doctype html>
<html lang="ko">
<head>
    <jsp:include page="${pageContext.request.contextPath}/WEB-INF/jsp/itman/_inc/title.jsp" />

    <jsp:include page="${pageContext.request.contextPath}/WEB-INF/jsp/itman/_inc/header.jsp" />
    <link href="https://webfontworld.github.io/gmarket/GmarketSans.css" rel="stylesheet" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/_css/default.css" />
</head>
<body>
<!-- 세션 정보 설정 -->
<%--<c:set var="useremail" value="${sessionScope.useremail}" />--%>
<%--<c:set var="username"  value="${sessionScope.username}" />--%>
<%--<c:set var="userIDX"   value="${sessionScope.userIDX}" />--%>

<%--<header class="h_index">--%>
<%--    <div class="h_left">--%>
<%--        <h1 class="logo"><a href="#"><img src="/images/_img/main_logo.png" alt="아이티맨" /></a></h1>--%>
<%--    </div>--%>
<%--    <c:choose>--%>
<%--        <c:when test="${empty useremail || empty username}">--%>
<%--            <!-- 로그인 전 -->--%>
<%--            <p class="h_right_index">--%>
<%--                <a href="user/login.jsp">로그인</a>--%>
<%--                <a href="user/join01.jsp" class="join">회원가입</a>--%>
<%--            </p>--%>
<%--        </c:when>--%>
<%--        <c:otherwise>--%>
<%--            <!-- 로그인 후: 그룹 개수 조회 -->--%>
<%--            <sql:setDataSource var="db" driver="com.mysql.jdbc.Driver"--%>
<%--                               url="jdbc:mysql://localhost:3306/yourdb?useUnicode=true&amp;characterEncoding=UTF-8"--%>
<%--                               user="dbuser"  password="dbpass" />--%>
<%--            <sql:query var="grpCount" dataSource="${db}">--%>
<%--                SELECT COUNT(*) AS cnt--%>
<%--                FROM ITM_GROUP--%>
<%--                WHERE GRO_OWNER_IDX = ?--%>
<%--                AND DEL_YN = 'N'--%>
<%--            </sql:query>--%>
<%--            <c:set var="haveGroup" value="${grpCount.rows[0].cnt}" />--%>

<%--            <div class="h_right">--%>
<%--                <a href="#" class="hr_btn"><span></span><span></span><span></span></a>--%>
<%--                <p class="hr_box">--%>
<%--                    <span>${username}님</span>--%>
<%--                    <a href="user/mypage.jsp" class="btn mypage">마이페이지</a>--%>
<%--                    <a href="user/logout_proc.jsp" class="btn logout">로그아웃</a>--%>
<%--                    <a href="group.jsp" class="btn group">전체그룹메인</a>--%>
<%--                </p>--%>
<%--            </div>--%>
<%--        </c:otherwise>--%>
<%--    </c:choose>--%>
<%--</header>--%>

<div id="contents" class="index">
    <p class="logo"><img src="/images/_img/itman_logo.png" alt="아이티맨" /></p>
    <p class="index_tt">
        개인과 기업이 할 수 있는 자산관리 시스템
        <span>자산 데이터와 코드 관리 전반에 활용할 수 있는 <br />제품과 솔루션</span>
    </p>
    <ul class="index_service">
        <li><a href="group.jsp"><span>Service 01</span>자산 관리</a></li>
        <li><a href="group.jsp"><span>Service 02</span>직원 관리</a></li>
        <li><a href="group.jsp"><span>Service 03</span>부서 관리</a></li>
        <li><a href="group.jsp"><span>Service 04</span>직위 관리</a></li>
        <li><a href="group.jsp"><span>Service 05</span>구매처 관리</a></li>
        <li><a href="group.jsp"><span>Service 06</span>위치 관리</a></li>
    </ul>
    <p class="index_st">무료로 이용해보기</p>
    <p class="index_btn">
        <c:choose>
            <c:when test="${empty useremail || empty username}">
                <a href="group.jsp">그룹 생성하기</a>
            </c:when>
            <c:otherwise>
                <a onclick="window.open('popup/addGroup.jsp','그룹생성팝업','width=500,height=350')" href="#" class="addBox">그룹 생성하기</a>
            </c:otherwise>
        </c:choose>
        <a href="javascript:unready();">유료로 더 많은 기능 사용하기</a>
    </p>
</div>

<jsp:include page="../../../itman/_inc/footer.jsp" />

<script>
    function unready(){
        alert("아직 준비중입니다.");
    }
</script>
</body>
</html>