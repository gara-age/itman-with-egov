<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" language="java" %>

<!doctype html>
<html lang="ko">
 <head>
	 <jsp:include page="${pageContext.request.contextPath}/WEB-INF/jsp/itman/_inc/title.jsp" />
	 <jsp:include page="${pageContext.request.contextPath}/WEB-INF/jsp/itman/_inc/header.jsp" />
	 <link href="https://webfontworld.github.io/gmarket/GmarketSans.css" rel="stylesheet" />
	 <link rel="stylesheet" href="${pageContext.request.contextPath}/css/_css/default.css" />
 </head>
<body>
	<div id="contents">
		<div class="tit_search">
			<h2>자산 관리</h2>
			<form id="searchForm" method="get" action="${pageContext.request.contextPath}/itman/assetsList.do" onsubmit="this.page.value=1; this.range.value=1;" >
				<input type="hidden" id="page"      name="page"      value="${pagination.page}" />
				<input type="hidden" id="range"     name="range"     value="${pagination.range}" />
				<input type="hidden" id="rangeSize" name="rangeSize" value="${pagination.rangeSize}" />

				<p class="list_search" >
<%--					<select name="searching.assCatIdx" onchange="document.getElementById('searchForm').submit()">--%>
<%--						<option value="" >분류</option>--%>
<%--						<c:forEach var="c" items="${categories}">--%>
<%--							<option value="${c.assCatIdx}" ${c.assCatIdx == pagination.searching.assCatIdx ? 'selected' : ''}>${c.assCatName}</option>--%>
<%--						</c:forEach>--%>
<%--					</select>--%>
<%--					<select name="searching.staIdx" onchange="document.getElementById('searchForm').submit()">--%>
<%--						<option value="" >상태</option>--%>
<%--						<c:forEach var="s" items="${states}">--%>
<%--						<option value="${s.staIdx}" ${s.staIdx == pagination.searching.staIdx ? 'selected' : ''}>${s.staName}</option>--%>
<%--						</c:forEach>--%>
<%--					</select>--%>

					<select name="searching.searchCondition" >
						<option value="">전체</option>
						<option value="assUlid" ${pagination.searching.searchCondition == "assUlid" ? 'selected' : ''}>일련번호</option>
						<option value="assName" ${pagination.searching.searchCondition == "assName" ? 'selected' : ''}>자산명</option>
						<option value="assCatName" ${pagination.searching.searchCondition == "assCatName" ? 'selected' : ''}>분류</option>
					</select>

					<input name="searching.searchKeyword" type="text" value="${pagination.searching.searchKeyword}" placeholder="검색어를 입력해주세요."/>
					<a href="#" onclick="const form = this.closest('form'); form.page.value=1; form.range.value=1; form.submit();">검색</a>
				</p>

		<div class="num_list">
			<p class="total">총 <span>${pagination.listCnt}</span>건의 결과가 있습니다.</p>
		<p class="view">
			<select id="pageCount" name="listSize" onchange="document.getElementById('searchForm').submit(); this.page.value=1; this.range.value=1;">
				<option value="10" ${pagination.listSize== 10 ? 'selected' : ''}>10개씩보기</option>
				<option value="20" ${pagination.listSize== 20 ? 'selected' : ''}>20개씩보기</option>
				<option value="40" ${pagination.listSize== 40 ? 'selected' : ''}>40개씩보기</option>
			</select>
		</p>
		</div>
		</form>

		</div>
		<!-- 글쓰기 버튼-->
		<p class="addContent"><a href="assetsWrite.do"><span></span><span></span><span></span></a></p>

		<div class="Basic">
			<!-- 검색결과가 없을때
			<ul class="adminList">
				<li class="nocont">
				 검색 결과가 없습니다.
				</li>
			</ul>
			-->

			<ul class="adminList click img">
				<li class="tit">
					<p class="num">No</p>
					<p class="img">자산 이미지</p>
					<p class="num">일련번호</p>
					<p class="tit">자산명</p>
					<p class="cate">분류</p>
					<p class="stat">상태</p>
					<p class="name">사용 직원</p>
					<p class="loc">위치</p>
					<p class="p_info">구매처</p>
					<p class="p_date">최초구매일</p>
					<p class="p_pay">가격(원)</p>
				</li>

				<c:if test="${!empty resultList}">
				<c:forEach var="asset" items="${resultList}">
					<li onclick="location.href='assetsView.do?assIdx=${asset.assIdx}'">
					<p class="num">${asset.rowNum}</p>
					<p class="img"><span><img src="${pageContext.request.contextPath}/upload/assImg/${asset.image}" onerror = "this.src='${pageContext.request.contextPath}/images/_img/noimg.png'" alt="자산이미지 썸네일"/></span></p>
					<p class="num">${asset.assUlid}</p>
					<p class="tit">${asset.assName}</p>
					<p class="cate">${asset.assCatName}</p>
					<p class="stat">${asset.assStaName}</p>
					<div class="nameLoc">
						<p class="name">${asset.assEmpName}</p>
						<p class="loc">${asset.assLocName}</p>
					</div>
					<div class="purInfo">
						<p class="p_info">${asset.assSupName}</p>
						<p class="p_date">${asset.buyDate}</p>
						<p class="p_pay">${asset.price}</p>
					</div>
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
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/jsp/itman/_inc/footer.jsp" />
</body>
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
		 var url = "${pageContext.request.contextPath}/itman/assetsList.do";
		 url = url + "?page=" + 1;
		 url = url + "&range=" + 1;
		 location.href = url;	}
	 //이전 버튼 이벤트
	 function fn_prev(page, range, rangeSize,searchDiv, searchPos, searchSt, searchSort, searchKyeword) {
		 var page = (((range - 2) * rangeSize) + 1) <= 1 ? 1 : ((range - 2) * rangeSize) + 1 ;
		 var range = (range - 1) <= 1 ? 1 : range - 1;
		 var url = "${pageContext.request.contextPath}/itman/assetsList.do";
		 url = url + "?page=" + page;
		 url = url + "&range=" + range;
		 location.href = url;	}
	 //페이지 번호 클릭
	 function fn_pagination(page, range, rangeSize, searchType, keyword) {
		 var url = "${pageContext.request.contextPath}/itman/assetsList.do";
		 //page=1&range=1&rangeSize=10&searching.divIdx=&searching.posIdx=1&searching.stIdx=&searching.orderBy=empName&searching.searchKeyword=#
		 //페이지 , 레인지, 레인지 사이즈, 검색부서, 직위, 상태, 정렬, 검색어
		 url = url + "?page=" + page;
		 url = url + "&range=" + range;
		 location.href = url;		}
	 //다음 버튼 이벤트
	 function fn_next(pageCnt, page, range, rangeSize) {
		 var page = (parseInt((range * rangeSize)) + 1) >= pageCnt ? pageCnt / rangeSize * 10 : parseInt((range * rangeSize)) + 1 ;
		 var range = (parseInt(range) + 1) >= parseInt(pageCnt / rangeSize + 1) ? parseInt(pageCnt / rangeSize + 1) : (parseInt(range) + 1) ;
		 var url = "${pageContext.request.contextPath}/itman/assetsList.do";
		 url = url + "?page=" + page;
		 url = url + "&range=" + range;
		 location.href = url;	}
	 //마지막 버튼 이벤트
	 function fn_maxNext(pageCnt, range, rangeSize) {
		 var page =  pageCnt / rangeSize * 10;
		 var range =    parseInt(pageCnt / rangeSize + 1);
		 var url = "${pageContext.request.contextPath}/itman/assetsList.do";
		 url = url + "?page=" + page;
		 url = url + "&range=" + range;
		 location.href = url;
	 }
 </script>
</html>
