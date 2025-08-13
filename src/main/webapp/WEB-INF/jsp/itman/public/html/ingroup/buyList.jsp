<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" language="java" %>

<!doctype html>
<html lang="ko">
 <head>
	 <jsp:include page="/WEB-INF/jsp/itman/_inc/title.jsp" />
	 <jsp:include page="/WEB-INF/jsp/itman/_inc/header.jsp" />
	 <link href="https://webfontworld.github.io/gmarket/GmarketSans.css" rel="stylesheet" />
 </head>
<body>
	<div id="contents">
		<div class="tit_search">
			<h2>구매처 관리</h2>
			<form name="searchForm" method="get" id="searchForm" action="${pageContext.request.contextPath}/itman/supplierList.do" onsubmit="this.page.value=1; this.range.value=1;">
				<input type="hidden" id="page"      name="page"      value="${pagination.page}" />
				<input type="hidden" id="range"     name="range"     value="${pagination.range}" />
				<input type="hidden" id="rangeSize" name="rangeSize" value="${pagination.rangeSize}" />

                <p class="list_search">
                    <select name="searching.searchCondition">
						<option value="" >전체</option>
						<option value="supName" ${pagination.searching.searchCondition == 'supName' ? 'selected' : ''} >구매처명</option>
						<option value="supBnum" ${pagination.searching.searchCondition == 'supBnum' ? 'selected' : ''}>사업자등록번호</option>
						<option value="supMail" ${pagination.searching.searchCondition == 'supMail' ? 'selected' : ''}>이메일</option>
						<option value="supTel" ${pagination.searching.searchCondition == 'supTel' ? 'selected' : ''}>연락처</option>
                    </select>
					<input type="text" name="searching.searchKeyword"  value="${pagination.searching.searchKeyword}" placeholder="검색어를 입력해주세요.">
					<a href="#" onclick="const form = this.closest('form'); form.page.value=1; form.range.value=1; form.submit();">검색</a>
				</p>
            </form>
		</div>
		<div class="num_list">
			<p class="total">총 <span>${pagination.listCnt}</span>건의 결과가 있습니다.</p>
		</div>

		<!-- 글쓰기 버튼-->
		<p class="addContent"><a onclick="window.open('/itman/asset/contWriteSupplier.do', '구매처 추가 팝업', 'width=500, height=500, status=no,toolbar=no,scrollbars=no')" class="edit">><span></span><span></span><span></span></a></p>
		<div class="Basic">
			<ul class="adminList">
                <li class="tit">
					<p class="num">No</p>
					<p class="tit">구매처명</p>
					<p class="bnum">사업자등록번호</p>
					<p class="mail">이메일</p>
					<p class="tel">연락처</p>
					<p class="editDel">관리</p>
				</li>
				<c:if test="${!empty resultList}">
					<c:forEach var="supply" items="${resultList}">
						<input type="hidden" name="supIdx" value="${supply.supIdx}"/>
						<li>
							<p class="num">${supply.rowNum}</p>
							<p class="tit">${supply.supName}</p>
							<p class="bnum">${supply.supBnum}</p>
							<p class="mail">${!empty supply.supMail ? supply.supMail : '-'}</p>
							<p class="tel">${!empty supply.supTel ? supply.supTel : '-'}</p>
							<p class="editDel" style="padding: 0">
								<a onclick="window.open('/itman/supplierEdit.do?supIdx=${supply.supIdx}', '수정 팝업', 'width=500, height=500, status=no,toolbar=no,scrollbars=no')" class="edit">수정</a>
								<a onclick="window.open('/itman/confirmSupplierDel.do?supIdx=${supply.supIdx}', '삭제 팝업', 'width=500, height=500, status=no,toolbar=no,scrollbars=no')" class="del">삭제</a>
							</p>
						</li>
					</c:forEach>
				</c:if>
				<c:if test="${empty resultList}">
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
			var url = "${pageContext.request.contextPath}/itman/supplierList.do";
			url = url + "?page=" + 1;
			url = url + "&range=" + 1;
			location.href = url;	}
		//이전 버튼 이벤트
		function fn_prev(page, range, rangeSize,searchDiv, searchPos, searchSt, searchSort, searchKyeword) {
			var page = (((range - 2) * rangeSize) + 1) <= 1 ? 1 : ((range - 2) * rangeSize) + 1 ;
			var range = (range - 1) <= 1 ? 1 : range - 1;
			var url = "${pageContext.request.contextPath}/itman/supplierList.do";
			url = url + "?page=" + page;
			url = url + "&range=" + range;
			location.href = url;	}
		//페이지 번호 클릭
		function fn_pagination(page, range, rangeSize, searchType, keyword) {
			var url = "${pageContext.request.contextPath}/itman/supplierList.do";
			url = url + "?page=" + page;
			url = url + "&range=" + range;
			location.href = url;		}
		//다음 버튼 이벤트
		function fn_next(pageCnt, page, range, rangeSize) {
			var page = (parseInt((range * rangeSize)) + 1) >= pageCnt ? pageCnt / rangeSize * 10 : parseInt((range * rangeSize)) + 1 ;
			var range = (parseInt(range) + 1) >= parseInt(pageCnt / rangeSize + 1) ? parseInt(pageCnt / rangeSize + 1) : (parseInt(range) + 1) ;
			var url = "${pageContext.request.contextPath}/itman/supplierList.do";
			url = url + "?page=" + page;
			url = url + "&range=" + range;
			location.href = url;	}
		//마지막 버튼 이벤트
		function fn_maxNext(pageCnt, range, rangeSize) {
			var page =  pageCnt / rangeSize * 10;
			var range =    parseInt(pageCnt / rangeSize + 1);
			var url = "${pageContext.request.contextPath}/itman/supplierList.do";
			url = url + "?page=" + page;
			url = url + "&range=" + range;
			location.href = url;
		}
	</script>
</body>
</html>

<%--<?php--%>
<%--	function queryCount($sql){--%>
<%--		include "../_inc/dbconn.php";--%>
<%--		$query_count = mysqli_query($dbconn, $sql);--%>
<%--        $count =mysqli_num_rows($query_count); --%>
<%--		return $count;--%>
<%--	}--%>

<%--?>--%>