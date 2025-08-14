<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!doctype html>
<html lang="ko">
 <head>
	 <jsp:include page="${pageContext.request.contextPath}/WEB-INF/jsp/itman/_inc/checkSession.jsp"/>
	 <jsp:include page="${pageContext.request.contextPath}/WEB-INF/jsp/itman/_inc/title.jsp" />
	 <jsp:include page="${pageContext.request.contextPath}/WEB-INF/jsp/itman/_inc/header.jsp" />
 </head>
<body>

	<div id="contents">
		<div class="tit_search">
			<h2>부서 관리</h2>
			<form  id="searchForm" name="searchForm" method="get" action="${pageContext.request.contextPath}/itman/departList.do" onsubmit="this.page.value=1; this.range.value=1;">
				<input type="hidden" id="page"      name="page"      value="${pagination.page}" />
				<input type="hidden" id="range"     name="range"     value="${pagination.range}" />
				<input type="hidden" id="rangeSize" name="rangeSize" value="${pagination.rangeSize}" />

				<p class="list_search">
					<select name="searching.searchCondition">
						<option value="" >전체</option>
						<option value="divCode" ${pagination.searching.searchCondition=='divCode' ? 'selected' : ''}>코드번호</option>
						<option value="divName" ${pagination.searching.searchCondition=='divName' ? 'selected' : ''}>부서명</option>
					</select>
					<input name="searching.searchKeyword" type="text" value="${pagination.searching.searchKeyword}" placeholder="검색어를 입력해주세요."/>
					<a href="#" onclick="const form = this.closest('form'); form.page.value=1; form.range.value=1; form.submit();">검색</a>

				</p>
			</form>
		</div>


		<div class="num_list">
			<p class="total">총 <span>${pagination.listCnt}</span>건의 결과가 있습니다.</p>
		</div>
		
		<!-- 글쓰기 버튼-->
		<p class="addContent">
			<a href="#" onclick="window.open('/itman/divisionWrite.do' ,'부서 추가 팝업' ,'width=500, height=335, status=no,toolbar=no,scrollbars=no' )" class="edit"><span></span><span></span><span></span></a></p>

		<div class="Basic">
			<ul class="adminList">
				<li class="tit">
					<p class="num">No</p>
					<p class="cod">코드번호</p>
					<p class="tit">부서명</p>
					<p class="pos">사용유무</p>
					<p class="editDel">관리</p>
				</li>
				<c:if test="${!empty resultList}">
					<c:forEach var="row" items="${resultList}">
				<li>
				<p class="num">${row.rowNum}</p>
				<p class="cod">${row.divCode}</p>
				<p class="tit">${row.divName}</p>
				<p class="pos">
					<c:choose>
						<c:when test="${row.divYn == 'Y'}">사용</c:when>
						<c:otherwise>사용안함</c:otherwise>
					</c:choose>
				</p>
				<p class="editDel" style="padding: 0;">
					<a href="#" onclick="window.open('/itman/divisionWrite.do?divIdx=${row.divIdx}', 'EditPopUp', 'width=500, height=350, status=no,toolbar=no,scrollbars=no')" class="edit">수정</a>
					<a href="#" onclick="window.open('/itman/confirmDivisionDel.do?divIdx=${row.divIdx}', 'EditPopUp', 'width=500, height=350, status=no,toolbar=no,scrollbars=no')" class="del">삭제</a>
				</p>
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
	<c:if test="${not empty msg}">
		<script>
			alert("${msg}");
		</script>
	</c:if>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/jsp/itman/_inc/footer.jsp" />
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
		var url = "${pageContext.request.contextPath}/itman/departList.do";
		url = url + "?page=" + 1;
		url = url + "&range=" + 1;
		location.href = url;	}
	//이전 버튼 이벤트
	function fn_prev(page, range, rangeSize,searchDiv, searchPos, searchSt, searchSort, searchKyeword) {
		var page = (((range - 2) * rangeSize) + 1) <= 1 ? 1 : ((range - 2) * rangeSize) + 1 ;
		var range = (range - 1) <= 1 ? 1 : range - 1;
		var url = "${pageContext.request.contextPath}/itman/departList.do";
		url = url + "?page=" + page;
		url = url + "&range=" + range;
		location.href = url;	}
	//페이지 번호 클릭
	function fn_pagination(page, range, rangeSize, searchType, keyword) {
		var url = "${pageContext.request.contextPath}/itman/departList.do";
		//page=1&range=1&rangeSize=10&searching.divIdx=&searching.posIdx=1&searching.stIdx=&searching.orderBy=empName&searching.searchKeyword=#
		//페이지 , 레인지, 레인지 사이즈, 검색부서, 직위, 상태, 정렬, 검색어
		url = url + "?page=" + page;
		url = url + "&range=" + range;
		location.href = url;		}
	//다음 버튼 이벤트
	function fn_next(pageCnt, page, range, rangeSize) {
		var page = (parseInt((range * rangeSize)) + 1) >= pageCnt ? pageCnt / rangeSize * 10 : parseInt((range * rangeSize)) + 1 ;
		var range = (parseInt(range) + 1) >= parseInt(pageCnt / rangeSize + 1) ? parseInt(pageCnt / rangeSize + 1) : (parseInt(range) + 1) ;
		var url = "${pageContext.request.contextPath}/itman/departList.do";
		url = url + "?page=" + page;
		url = url + "&range=" + range;
		location.href = url;	}
	//마지막 버튼 이벤트
	function fn_maxNext(pageCnt, range, rangeSize) {
		var page =  pageCnt / rangeSize * 10;
		var range =    parseInt(pageCnt / rangeSize + 1);
		var url = "${pageContext.request.contextPath}/itman/departList.do";
		url = url + "?page=" + page;
		url = url + "&range=" + range;
		location.href = url;
	}
</script>
</body>

