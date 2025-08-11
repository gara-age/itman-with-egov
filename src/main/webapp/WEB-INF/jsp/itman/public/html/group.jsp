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
<%--    <?php while($row = (mysqli_fetch_array($result))) { --%>
<%--        $ASSET = "SELECT * FROM ITM_ASSET WHERE GRO_IDX={$row['GRO_IDX']} AND DEL_YN = 'N'";--%>
<%--        $ASSET_result = mysqli_query($dbconn, $ASSET);--%>
<%--        $acount = mysqli_num_rows($ASSET_result);    --%>
<%--        $EMPLO = "SELECT * FROM ITM_EMPLOYE WHERE GRO_IDX={$row['GRO_IDX']} AND DEL_YN = 'N'";--%>
<%--        $EMPLO_result = mysqli_query($dbconn, $EMPLO);--%>
<%--        $ecount = mysqli_num_rows($EMPLO_result);    --%>
<%--    ?>--%>

    <c:if test="${!empty groupList}">
        <c:set var="colors" value="${fn:split('c01,c02,c03', ',')}" />
        <c:forEach var="group" items="${groupList}" varStatus="st">
            <c:set var="color" value="${colors[ st.index mod fn:length(colors) ]}" />
            <div class="groupItem">
                <div class="Box ${color}">
                    <p class="name">
                        <a href="/itman/dashboard.do?groIdx=${group.groIdx}">${group.groName}</a>
                    </p>
                    <p class="going">
                        <a href="/itman/assetsList.do?groIdx=${group.groIdx}">
                            자산<span>${group.groAssetCnt}</span>
                        </a>
                        <a href="/itman/employeeList.do?groIdx=${group.groIdx}">
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

</html>

