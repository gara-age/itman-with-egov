<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<jsp:include page="dbconn.jsp" />
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700&family=Open+Sans:wght@300;400;500;700&display=swap" />

<!-- 헤더 -->
<header>
	<div class="h_left">
		<p class="ham"><a href="#none"><span></span><span></span><span></span></a></p>
		<h1>
			<a href="${pageContext.request.contextPath}/itman/dashboard.do">
				<img src="${pageContext.request.contextPath}/upload/groImg/${sessionScope.group.groImg}" onerror = "this.src='${pageContext.request.contextPath}/images/_img/groupImage/no_img.png'" />

			</a>
		</h1>
		<div class="tmn">
			<p class="m_tit"></p>
			<ul class="list">

				<span>${itmAssetCount}</span>
				<li class="dash">
					<a href="dashboard.do?id=0" class="${pageNumDepth01 == 0 ? 'on' : ''}">대시보드</a>
				</li>
				<li>
					<a href="assetsList.do?id=1" class="${pageNumDepth01 == 1 ? 'on' : ''}">자산 관리<span>${headerData.groAssetCnt}</span></a>
				</li>
				<li>
					<a href="employeeList.do?id=2" class="${pageNumDepth01 == 2 ? 'on' : ''}">직원 관리<span>${headerData.groEmployeeCnt}</span></a>
				</li>
				<li>
					<a href="departList.do?id=3" class="${pageNumDepth01 == 3 ? 'on' : ''}">부서 관리<span>${headerData.groDivisionCnt}</span></a>
				</li>
				<li>
					<a href="spotList.do?id=4" class="${pageNumDepth01 == 4 ? 'on' : ''}">직위 관리<span>${headerData.groPositionCnt}</span></a>
				</li>
				<li>
					<a href="supplierList.do?id=5" class="${pageNumDepth01 == 5 ? 'on' : ''}">구매처 관리<span>${headerData.groSupplierCnt}</span></a>
				</li>
				<li>
					<a href="assetLocationList.do?id=6" class="${pageNumDepth01 == 6 ? 'on' : ''}">위치 관리<span>${headerData.groLocationCnt}</span></a>
				</li>
				<li>
					<a href="assetCategory.do?id=11" class="${pageNumDepth01 == 11 ? 'on' : ''}">자산 분류 관리<span>${headerData.groAssetCategoryCnt}</span></a>
				</li>
				<li>
					<a href="assetStateList.do?id=7" class="${pageNumDepth01 == 7 ? 'on' : ''}">자산 상태 관리<span>${headerData.groAssetStateCnt}</span></a>
				</li>
				<li>
					<a href="employeeStateList.do?id=8" class="${pageNumDepth01 == 8 ? 'on' : ''}">직원 상태 관리<span>${headerData.groEmployeeStateCnt}</span></a>
				</li>
				<li>
					<a href="assetHistory.do?id=9" class="${pageNumDepth01 == 9 ? 'on' : ''}">자산 히스토리</a>
				</li>
			</ul>
		</div>
	</div>
	<div class="h_right">
		<a href="#" class="hr_btn"><span></span><span></span><span></span></a>
		<p class="hr_box">
			<span>${userName}님</span>
			<a href="${pageContext.request.contextPath}/itman/myPage.do" class="mypage">마이페이지</a>
			<a href="${pageContext.request.contextPath}/itman/logout.do" class="logout">로그아웃</a>
			<a href="${pageContext.request.contextPath}/itman/group.do" class="group">전체그룹메인</a>
		</p>
	</div>
</header>

<!-- 사이드메뉴 -->
<div class="smn">
	<ul class="smn_list">
		<c:forEach var="group" items="${allGroupList}">
			<li>
				<p><a href="#">${group.groName}</a></p>
				<ul>
					<li><a href="dashboard.do?groIdx=${group.groIdx}&amp;id=0">대시보드</a></li>
					<li><a href="assetsList.do?groIdx=${group.groIdx}&amp;id=1">자산 관리</a></li>
					<li><a href="employeeList.do?groIdx=${group.groIdx}&amp;id=2">직원 관리</a></li>
					<li><a href="departList.do?groIdx=${group.groIdx}&amp;id=3">부서 관리</a></li>
					<li><a href="spotList.do?groIdx=${group.groIdx}&amp;id=4">직위 관리</a></li>
					<li><a href="supplierList.do?groIdx=${group.groIdx}&amp;id=5">구매처 관리</a></li>
					<li><a href="assetLocationList.do?groIdx=${group.groIdx}&amp;id=6">위치 관리</a></li>
				</ul>
			</li>
		</c:forEach>
	</ul>
	<p class="go_itman">
		<a href="${pageContext.request.contextPath}/itman/index.do">
			<span><img src="${pageContext.request.contextPath}/images/_img/_favicon/apple-icon-180x180.png" alt="아이티맨"/></span>
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
			<p class="close"><a class="cbtn" href="#none"><img src="${pageContext.request.contextPath}/images/_img/close.png" alt="닫기"/></a></p>
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
