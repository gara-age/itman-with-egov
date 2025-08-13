<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!doctype html>
<html lang="ko">
 <head>
	 <jsp:include page="${pageContext.request.contextPath}/WEB-INF/jsp/itman/_inc/title.jsp" />
 </head>
<body>

	<div id="popup">
		<div class="pop_tit">
			<p class="title">구매처 찾기</p>
		</div>
		<div class="pop_cont">
			<ul class="contEdit">
				<li>
				<form action="${pageContext.request.contextPath}/popup/selectAssetSupplier.do" id="searchForm" method="post"onsubmit="this.page.value=1; this.range.value=1;" >
					<input type="hidden" id="page"      name="page"      value="${pagination.page}" />
					<input type="hidden" id="range"     name="range"     value="${pagination.range}" />
					<input type="hidden" id="rangeSize" name="rangeSize" value="${pagination.rangeSize}" />
					<p class="cont">
						<input type="text" name="searching.searchKeyword"  placeholder="구매처 이름을 작성해주세요." class="search" value="${pagination.searching.searchKeyword}" onsubmit="this.page.value=1; this.range.value=1;"><a href="javascript:form_submit()">검색</a>
					</p>
					</form>
				</li>
			</ul>
			<ul class="popList">
				<c:if test="${!empty supplierList}">
					<c:forEach var="supplier" items="${supplierList}">
						<li><a href="javascript:onClick(${supplier.supIdx});"><span  class="tit" id="sup_name${supplier.supIdx}">${supplier.supName}</span>
							<span class="sub" id="${supplier.supIdx}">${supplier.supName} / ${supplier.supBnum} / ${supplier.supTel}</span>
						</a></li>
						<input type="hidden" id="sup_idx${supplier.supIdx}" value="${supplier.supIdx}"/>
					</c:forEach>
				</c:if>
				<c:if test="${empty supplierList}">
					<li class="nocont">검색결과가 없습니다.</li>
				</c:if>
			</ul>
<%--			<ul class="popList">--%>
<%--				<!-- 				<li class="nocont">검색결과가 없습니다.</li> -->--%>
<%--				<?php--%>
<%--        while($row = (mysqli_fetch_array($result))) {--%>
<%--        ?>--%>
<%--				<li><a href="javascript:onClick(<?=$row['SUP_IDX'];?>);"><span class="tit" id = <?="sup_name".$row['SUP_IDX']?>><?= $row['SUP_NAME']?></a></li>--%>
<%--				<input type="hidden" id="<?=$row['SUP_IDX'];?>" value="<?=$row['SUP_IDX'];?>"/>--%>
<%--				<?php };?>--%>
<%--			</ul>--%>

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

			<p class="pop_btn"><a href="javascript:window.close();" class="del">취소</a></p>
		</div>
	</div>

</body>
<script>
function form_submit(){
	document.getElementById("searchForm").submit();
}
function onClick(idx){
	// result = [];
	// str = document.getElementById(idx).innerHTML;
	// split_str = str.split('/');

	// for( const item of split_str){
	// 	result.push(item);
	// }


	opener.document.getElementById("sup_idx").value = idx;
	opener.document.getElementById("sup_name").innerHTML = document.getElementById("sup_name"+idx).innerHTML;
	window.close();

}
function changePage(page, range, rangeSize) {
	const form = document.getElementById('searchForm');
	form.page.value = page;
	form.range.value = range;
	form.rangeSize.value = rangeSize;
	form.submit();
}
//처음 버튼 이벤트
function fn_maxPrev() {
	var url = "${pageContext.request.contextPath}/popup/selectAssetSupplier.do";
	url = url + "?page=" + 1;
	url = url + "&range=" + 1;
	location.href = url;	}
//이전 버튼 이벤트
function fn_prev(page, range, rangeSize) {
	var page = (((range - 2) * rangeSize) + 1) <= 1 ? 1 : ((range - 2) * rangeSize) + 1 ;
	var range = (range - 1) <= 1 ? 1 : range - 1;
	var url = "${pageContext.request.contextPath}/popup/selectAssetSupplier.do";
	url = url + "?page=" + page;
	url = url + "&range=" + range;
	location.href = url;	}
//페이지 번호 클릭
function fn_pagination(page, range, rangeSize, searchType, keyword) {
	var url = "${pageContext.request.contextPath}/popup/selectAssetSupplier.do";
	url = url + "?page=" + page;
	url = url + "&range=" + range;
	location.href = url;		}
//다음 버튼 이벤트
function fn_next(pageCnt, page, range, rangeSize) {
	var page = (parseInt((range * rangeSize)) + 1) >= pageCnt ? pageCnt / rangeSize * 10 : parseInt((range * rangeSize)) + 1 ;
	var range = (parseInt(range) + 1) >= parseInt(pageCnt / rangeSize + 1) ? parseInt(pageCnt / rangeSize + 1) : (parseInt(range) + 1) ;
	var url = "${pageContext.request.contextPath}/popup/selectAssetSupplier.do";
	url = url + "?page=" + page;
	url = url + "&range=" + range;
	location.href = url;	}
//마지막 버튼 이벤트
function fn_maxNext(pageCnt, range, rangeSize) {
	var page =  pageCnt / rangeSize * 10;
	var range =    parseInt(pageCnt / rangeSize + 1);
	var url = "${pageContext.request.contextPath}/popup/selectAssetSupplier.do";
	url = url + "?page=" + page;
	url = url + "&range=" + range;
	location.href = url;
}
</script>
</html>
