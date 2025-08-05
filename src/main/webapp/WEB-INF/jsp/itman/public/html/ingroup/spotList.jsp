<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!doctype html>
<html lang="ko">
 <head>
	 <jsp:include page="${pageContext.request.contextPath}/WEB-INF/jsp/itman/_inc/title.jsp" />
	 <jsp:include page="${pageContext.request.contextPath}/WEB-INF/jsp/itman/_inc/header.jsp" />
	 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/_css/default.css" />
 </head>
<body>

	<div id="contents">
		<div class="tit_search">
			<form  id="searchForm" name="searchForm" method="get" action="${pageContext.request.contextPath}/itman/spotList.do" onsubmit="this.page.value=1; this.range.value=1;">
			<input type="hidden" id="page"      name="page"      value="${pagination.page}" />
			<input type="hidden" id="range"     name="range"     value="${pagination.range}" />
			<input type="hidden" id="rangeSize" name="rangeSize" value="${pagination.rangeSize}" />

			<p class="list_search">
				<select name="searching.orderBy" onchange="document.getElementById('searchForm').submit();">
					<option value="" >정렬 방식</option>
					<option value="posCode" ${pagination.searching.orderBy=='posCode' ? 'selected' : ''}>코드번호순</option>
					<option value="posName" ${pagination.searching.orderBy=='posName' ? 'selected' : ''}>직위명순</option>
				</select>
				<input name="searching.searchKeyword" type="text" value="${pagination.searching.searchKeyword}" placeholder="검색어를 입력해주세요."/>
				<a href="#" onclick="const form = this.closest('form'); form.page.value=1; form.range.value=1; form.submit();">검색</a>

			</p>
		</form>
		</div>

		<div class="num_list">
			<p class="total">총 <span>${listCnt}</span>건의 결과가 있습니다.</p>
		</div>
		<!-- 글쓰기 버튼--> 
		<p class="addContent"><a onclick="" class="edit">><span></span><span></span><span></span></a></p>
		<div class="Basic">
			<ul class="adminList">
				<li class="tit">
					<p class="num">No</p>
					<p class="cod">코드번호</p>
					<p class="tit">직위명</p>
				</li>
				<c:if test="${!empty resultList}">
					<c:forEach var="row" items="${resultList}">
                    <li onClick="location.href='${pageContext.request.contextPath}/itman/positionView.do?posIdx=${row.posIdx}'">
						<p class="num">${row.rowNum}</p>
                        <p class="cod">${row.posCode}</p>
                        <p class="tit">${row.posName}</p>
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
			var url = "${pageContext.request.contextPath}/itman/spotList.do";
			url = url + "?page=" + 1;
			url = url + "&range=" + 1;
			location.href = url;	}
		//이전 버튼 이벤트
		function fn_prev(page, range, rangeSize,searchDiv, searchPos, searchSt, searchSort, searchKyeword) {
			var page = (((range - 2) * rangeSize) + 1) <= 1 ? 1 : ((range - 2) * rangeSize) + 1 ;
			var range = (range - 1) <= 1 ? 1 : range - 1;
			var url = "${pageContext.request.contextPath}/itman/spotList.do";
			url = url + "?page=" + page;
			url = url + "&range=" + range;
			location.href = url;	}
		//페이지 번호 클릭
		function fn_pagination(page, range, rangeSize, searchType, keyword) {
			var url = "${pageContext.request.contextPath}/itman/spotList.do";
			url = url + "?page=" + page;
			url = url + "&range=" + range;
			location.href = url;		}
		//다음 버튼 이벤트
		function fn_next(pageCnt, page, range, rangeSize) {
			var page = (parseInt((range * rangeSize)) + 1) >= pageCnt ? pageCnt / rangeSize * 10 : parseInt((range * rangeSize)) + 1 ;
			var range = (parseInt(range) + 1) >= parseInt(pageCnt / rangeSize + 1) ? parseInt(pageCnt / rangeSize + 1) : (parseInt(range) + 1) ;
			var url = "${pageContext.request.contextPath}/itman/spotList.do";
			url = url + "?page=" + page;
			url = url + "&range=" + range;
			location.href = url;	}
		//마지막 버튼 이벤트
		function fn_maxNext(pageCnt, range, rangeSize) {
			var page =  pageCnt / rangeSize * 10;
			var range =    parseInt(pageCnt / rangeSize + 1);
			var url = "${pageContext.request.contextPath}/itman/spotList.do";
			url = url + "?page=" + page;
			url = url + "&range=" + range;
			location.href = url;
		}
	</script>
</body>
</html>

