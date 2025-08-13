<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" language="java" %>

<%--<?php--%>
<%--    include("_inc/dbconn.php");--%>
<%--    session_start();--%>
<%--    $group = $_SESSION['group'];--%>
<%--    $sql = "SELECT * FROM ITM_GROUP WHERE GRO_OWNER_IDX = '".$_SESSION['userIDX']."' AND DEL_YN = 'N'";--%>
<%--    $result = mysqli_query($dbconn, $sql);--%>
<%--?>--%>

<!doctype html>
<html lang="ko">
 <head>
     <jsp:include page="${pageContext.request.contextPath}/WEB-INF/jsp/itman/_inc/title.jsp" />
     <jsp:include page="${pageContext.request.contextPath}/WEB-INF/jsp/itman/_inc/header.jsp" />
     <link href="https://webfontworld.github.io/gmarket/GmarketSans.css" rel="stylesheet" />
  <script>
	window.onload = function(){
		var width_size = window.innerWidth;

		if (width_size < 821) {
			$('.ham a').removeClass('on');
			$('.smn').removeClass('open');
		}else{
			$('.ham a').addClass('on');
			$('.smn').addClass('open');
			$(function(){ 
				$('.groupBox').masonry({
					itemSelector: '.groupItem',
					horizontalOrder: true
				});
			})		
		}
	}

  </script>

 </head>
<body id="group">
	<div id="contents">
<div class="groupBox">
	<div class="groupItem">
		<a onclick="window.open('${pageContext.request.contextPath}/itman/addGroup.do', '그룹생성팝업', 'width=500, height=400')" href="#" class="addBox">그룹 생성하기</a>
	</div>

    <c:if test="${!empty groupList}">
        <c:set var="colors" value="${fn:split('c01,c02,c03', ',')}" />
        <c:forEach var="group" items="${groupList}" varStatus="st">
            <c:set var="color" value="${colors[ st.index mod fn:length(colors) ]}" />
            <div class="groupItem">
                <div class="Box ${color}">
                    <p class="name">
                        <a href="#" onclick="goWithSession(${group.groIdx}, '/itman/dashboard.do')">${group.groName}</a>
                    </p>
                    <p class="going">
                        <a href="#" onclick="goWithSession(${group.groIdx}, '/itman/assetsList.do')">
                            자산<span>${group.groAssetCnt}</span>
                        </a>
                        <a href="#" onclick="goWithSession(${group.groIdx}, '/itman/employeeList.do')">
                            직원<span>${group.groEmployeeCnt}</span>
                        </a>
                    </p>
                </div>
            </div>
        </c:forEach>
    </c:if>



    
</div>




	</div>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/jsp/itman/_inc/footer.jsp" />
<script>
    function goWithSession(groIdx, targetUrl){
        fetch("${pageContext.request.contextPath}/itman/setGroIdx.do", {
            method: "POST",
            headers: {
                "Content-Type": "application/x-www-form-urlencoded"},
            body: new URLSearchParams({groIdx: groIdx}),
            credentials: "same-origin"
        }).then(res => {
                if (res.ok) {
                    location.href = targetUrl + "?groIdx=" + groIdx;
                } else {
                    alert("세션 저장 실패");
                }
        });
        }
</script>
</body>
</html>

