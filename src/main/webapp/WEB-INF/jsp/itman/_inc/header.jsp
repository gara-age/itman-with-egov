<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<jsp:include page="dbconn.jsp" />
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700&family=Open+Sans:wght@300;400;500;700&display=swap" />


<%--<jsp:include page="loginTest.jsp" />--%>

<%--<?php--%>
<%--    include("dbconn.php");--%>
<%--	include "/home/itman/public_html/html/_inc/loginTest.php";--%>
<%--    $group = $_SESSION['group'];--%>
<%--    // $smn_sql = "SELECT * FROM ITM_GROUP WHERE GRO_OWNER_IDX = '".$_SESSION['userIDX']."'";--%>
<%--	$smn_sql = "SELECT * FROM ITM_GROUP WHERE REG_IDX = '{$_SESSION['userIDX']}' AND DEL_YN = 'N'";--%>
<%--    $smn_result = mysqli_query($dbconn, $smn_sql);--%>
<%--	// $_SESSION['group'] = $_GET['group'];--%>

<%--	$GROUP_IMG_SQL = "SELECT GRO_IMG FROM ITM_GROUP WHERE GRO_IDX={$_SESSION['group']}";--%>
<%--	$GROUP_IMG_QUERY = mysqli_query($dbconn, $GROUP_IMG_SQL);--%>
<%--	$GROUP_IMG_RESULT = mysqli_fetch_array($GROUP_IMG_QUERY);--%>


<%--	$GROUP_IMG = $GROUP_IMG_RESULT['GRO_IMG'];--%>

<%--	if($GROUP_IMG == ""){--%>
<%--		$GROUP_IMG = "no_img.png";--%>
<%--	}--%>

<%--	$ITM_ASSET = "SELECT * FROM ITM_ASSET WHERE GRO_IDX={$_SESSION['group']} AND DEL_YN='N'";--%>
<%--    $ITM_ASSET_result = mysqli_query($dbconn, $ITM_ASSET);--%>
<%--	$ITM_ASSET_COUNT = mysqli_num_rows($ITM_ASSET_result);--%>

<%--    $ITM_EMPLOYEE = "SELECT * FROM ITM_EMPLOYE WHERE GRO_IDX={$_SESSION['group']} AND DEL_YN='N'";--%>
<%--    $ITM_EMPLOYEE_result = mysqli_query($dbconn, $ITM_EMPLOYEE);--%>
<%--	$ITM_EMPLOYEE_COUNT = mysqli_num_rows($ITM_EMPLOYEE_result);--%>

<%--    $ITM_DIVISION = "SELECT * FROM ITM_DIVISION WHERE GRO_IDX={$_SESSION['group']} AND DEL_YN='N'";--%>
<%--    $ITM_DIVISION_result = mysqli_query($dbconn, $ITM_DIVISION);--%>
<%--	$ITM_DIVISION_COUNT = mysqli_num_rows($ITM_DIVISION_result);--%>

<%--    $ITM_POSITION = "SELECT * FROM ITM_POSITION WHERE GRO_IDX={$_SESSION['group']} AND DEL_YN='N'";--%>
<%--    $ITM_POSITION_result = mysqli_query($dbconn, $ITM_POSITION);--%>
<%--	$ITM_POSITION_COUNT = mysqli_num_rows($ITM_POSITION_result);--%>

<%--    $ITM_SUPPLIER = "SELECT * FROM ITM_SUPPLIER WHERE GRO_IDX={$_SESSION['group']} AND DEL_YN='N'";--%>
<%--    $ITM_SUPPLIER_result = mysqli_query($dbconn, $ITM_SUPPLIER);--%>
<%--	$ITM_SUPPLIER_COUNT = mysqli_num_rows($ITM_SUPPLIER_result);--%>

<%--    $ITM_LOCATION = "SELECT * FROM ITM_LOCATION WHERE GRO_IDX={$_SESSION['group']} AND DEL_YN='N'";--%>
<%--    $ITM_LOCATION_result = mysqli_query($dbconn, $ITM_LOCATION);--%>
<%--	$ITM_LOCATION_COUNT = mysqli_num_rows($ITM_LOCATION_result);--%>

<%--    $ITM_STATE = "SELECT * FROM ITM_STATE WHERE GRO_IDX={$_SESSION['group']} AND DEL_YN='N'";--%>
<%--    $ITM_STATE_result = mysqli_query($dbconn, $ITM_STATE);--%>
<%--	$ITM_STATE_COUNT = mysqli_num_rows($ITM_STATE_result);--%>

<%--    $ITM_EMP_STATE = "SELECT * FROM ITM_EMP_STATE WHERE GRO_IDX={$_SESSION['group']} AND DEL_YN='N'";--%>
<%--    $ITM_EMP_STATE_result = mysqli_query($dbconn, $ITM_EMP_STATE);--%>
<%--	$ITM_EMP_STATE_COUNT = mysqli_num_rows($ITM_EMP_STATE_result);--%>

<%--    $ITM_ASSET_CATEGORY = "SELECT * FROM ITM_ASSET_CATEGORY WHERE GRO_IDX={$_SESSION['group']} AND DEL_YN='N'";--%>
<%--    $ITM_ASSET_CATEGORY_result = mysqli_query($dbconn, $ITM_ASSET_CATEGORY);--%>
<%--	$ITM_ASSET_CATEGORY_COUNT = mysqli_num_rows($ITM_ASSET_CATEGORY_result);--%>

<%--?>--%>

<!-- 헤더 -->
<header>
	<div class="h_left">
		<p class="ham"><a href="#none"><span></span><span></span><span></span></a></p>
		<h1>
			<a href="${pageContext.request.contextPath}/html/ingroup/dashboard.jsp">
				<img src="/images/_img/groupImage/no_img.png" />
			</a>
		</h1>
		<div class="tmn">
			<p class="m_tit"></p>
			<ul class="list">

				<span>${itmAssetCount}</span>
				<li class="dash">
					<a href="dashboard.jsp" class="${pageNumDepth01 == 0 ? 'on' : ''}">대시보드</a>
				</li>
				<li>
					<a href="assetsList.do" class="${pageNumDepth01 == 1 ? 'on' : ''}">자산 관리<span>3<%--${timAssetCount}--%></span></a>
				</li>
				<li>
					<a href="employeeList.do" class="${pageNumDepth01 == 2 ? 'on' : ''}">직원 관리<span>2<%--${itmEmployeeCount}--%></span></a>
				</li>
				<li>
					<a href="departList.do" class="${pageNumDepth01 == 3 ? 'on' : ''}">부서 관리<span>4<%--${itmDivisionCount}--%></span></a>
				</li>
				<li>
					<a href="spotList.do" class="${pageNumDepth01 == 4 ? 'on' : ''}">직위 관리<span>5<%--${itmPositionCount}--%></span></a>
				</li>
				<li>
					<a href="supplierList.do" class="${pageNumDepth01 == 5 ? 'on' : ''}">구매처 관리<span>3<%--${itmSupplierCount}--%></span></a>
				</li>
				<li>
					<a href="assetLocationList.do" class="${pageNumDepth01 == 6 ? 'on' : ''}">위치 관리<span>5<%--${itmLocationCount}--%></span></a>
				</li>
				<li>
					<a href="assetCategory.do" class="${pageNumDepth01 == 11 ? 'on' : ''}">자산 분류 관리<span>4<%--${itmAssetCategoryCount}--%></span></a>
				</li>
				<li>
					<a href="assetStateList.do" class="${pageNumDepth01 == 7 ? 'on' : ''}">자산 상태 관리<span>7<%--${itmStateCount}--%></span></a>
				</li>
				<li>
					<a href="employeeStateList.do" class="${pageNumDepth01 == 8 ? 'on' : ''}">직원 상태 관리<span>3<%--${itmEmpStateCount}--%></span></a>
				</li>
				<li>
					<a href="ahistory.jsp" class="${pageNumDepth01 == 9 ? 'on' : ''}">자산 히스토리</a>
				</li>
			</ul>
		</div>
	</div>
	<div class="h_right">
		<a href="#" class="hr_btn"><span></span><span></span><span></span></a>
		<p class="hr_box">
			<span>${sessionScope.username}님</span>
			<a href="${pageContext.request.contextPath}/html/user/mypage.jsp" class="mypage">마이페이지</a>
			<a href="${pageContext.request.contextPath}/html/user/logout_proc.jsp" class="logout">로그아웃</a>
			<a href="${pageContext.request.contextPath}/html/group.jsp" class="group">전체그룹메인</a>
		</p>
	</div>
</header>

<!-- 사이드메뉴 -->
<div class="smn">
	<ul class="smn_list">
		<c:forEach var="row" items="${smnResult}">
			<li>
				<p><a href="#">${row.GRO_NAME}</a></p>
				<ul>
					<li><a href="group_proc.jsp?group=${row.GRO_IDX}&amp;id=0">대시보드</a></li>
					<li><a href="group_proc.jsp?group=${row.GRO_IDX}&amp;id=1">자산 관리</a></li>
					<li><a href="group_proc.jsp?group=${row.GRO_IDX}&amp;id=2">직원 관리</a></li>
					<li><a href="group_proc.jsp?group=${row.GRO_IDX}&amp;id=3">부서 관리</a></li>
					<li><a href="group_proc.jsp?group=${row.GRO_IDX}&amp;id=4">직위 관리</a></li>
					<li><a href="group_proc.jsp?group=${row.GRO_IDX}&amp;id=5">구매처 관리</a></li>
					<li><a href="group_proc.jsp?group=${row.GRO_IDX}&amp;id=6">위치 관리</a></li>
				</ul>
			</li>
		</c:forEach>
	</ul>
	<p class="go_itman">
		<a href="${pageContext.request.contextPath}/html/index.jsp">
			<span><img src="${pageContext.request.contextPath}/html/_img/_favicon/apple-icon-180x180.png" alt="아이티맨"/></span>
			아이티맨 메인으로가기
		</a>
	</p>
</div>

<!-- 팝업 레이어 -->
<div class="more_layer">
	<div class="bg"></div>
	<div class="pop-layer">
		<div class="pop_tit">
			<p class="title">비고</p>
			<p class="close"><a class="cbtn" href="#none"><img src="${pageContext.request.contextPath}/html/_img/close.png" alt="닫기"/></a></p>
		</div>
		<div class="pop_cont">
			<!-- 팝업 내용 -->
		</div>
	</div>
</div>

<script>
	function movePage(groupIDX, pageIDX) {
		location.href = '${pageContext.request.contextPath}/html/group_proc.jsp?group=' + groupIDX + '&id=' + pageIDX;
	}
</script>
