<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%--<?php--%>
<%--	include "../_inc/dbconn.php";--%>

<%--    /**--%>
<%--     * 세션 체크--%>
<%--     */--%>
<%--    include "../_inc/loginTest.php";--%>
<%--    login_check();--%>
<%--    $group = $_SESSION['group'];--%>

<%--	$like = $_POST['like'];--%>
<%--	$page = $_GET['page'];--%>

<%--	$sql = ""; $sql_count = "";--%>

<%--	$first_limit = 0;--%>
<%--	$count_limit = 5;--%>

<%--	if(empty($page)){--%>
<%--		$first_limit = 0;--%>
<%--	}else{--%>
<%--		$first_limit = ($page-1) * $count_limit;--%>
<%--	}--%>


<%--	if(empty($like)){--%>
<%--		$sql = "SELECT * FROM ITM_LOCATION WHERE GRO_IDX = $group AND DEL_YN = 'N' LIMIT $first_limit, $count_limit";--%>
<%--		$sql_count = "SELECT * FROM ITM_LOCATION WHERE GRO_IDX = $group AND DEL_YN = 'N'";--%>
<%--	}else{--%>
<%--		$sql = "SELECT * FROM ITM_LOCATION WHERE GRO_IDX = $group AND LOC_NAME LIKE '%{$like}%' AND DEL_YN = 'N' LIMIT $first_limit, $count_limit";--%>
<%--		$sql_count = "SELECT * FROM ITM_LOCATION WHERE GRO_IDX = $group AND LOC_NAME LIKE '%{$like}%' AND DEL_YN = 'N'";--%>
<%--	}--%>
<%--	--%>
<%--	$result = mysqli_query($dbconn, $sql);--%>
<%--	$result_count = mysqli_query($dbconn, $sql_count);--%>
<%--	$count = mysqli_num_rows($result_count);--%>
<%--	--%>

<%--	$total_page = ceil($count / $count_limit);--%>

<%--    function find_div_name($dbconn, $div_idx){--%>
<%--        $div_sql = "SELECT DIV_NAME FROM ITM_DIVISION WHERE DIV_IDX = {$div_idx} ";--%>
<%--        $div_query = mysqli_query($dbconn, $div_sql);--%>
<%--        $div_result = mysqli_fetch_array($div_query);--%>
<%--        return $div_result["DIV_NAME"];--%>
<%--    }--%>

<%--	function find_pos_name($dbconn, $pos_idx){--%>
<%--        $pos_sql = "SELECT POS_NAME FROM ITM_POSITION WHERE POS_IDX = $pos_idx";--%>
<%--        $pos_query = mysqli_query($dbconn, $pos_sql);--%>
<%--        $pos_result = mysqli_fetch_array($pos_query);--%>
<%--        return $pos_result["POS_NAME"];--%>
<%--    }--%>

<%--?>--%>
<!doctype html>
<html lang="ko">
 <head>
	 <jsp:include page="${pageContext.request.contextPath}/WEB-INF/jsp/itman/_inc/title.jsp" />
 </head>
<body>

	<div id="popup">
		<div class="pop_tit">
			<p class="title">위치 찾기</p>
		</div>
		<div class="pop_cont">
			<ul class="contEdit">
				<li>
				<form action="${pageContext.request.contextPath}/itman/popup/locationPop.do" id="searchForm" method="post" >
					<input type="hidden" id="page"      name="page"      value="${pagination.page}" />
					<input type="hidden" id="range"     name="range"     value="${pagination.range}" />
					<input type="hidden" id="rangeSize" name="rangeSize" value="${pagination.rangeSize}" />

					<p class="cont">
							<input type="text" name="searching.searchKeyword"  placeholder="위치를 작성해주세요." class="search" value="${pagination.searching.searchKeyword}" onsubmit="this.page.value=1; this.range.value=1;"><a href="javascript:form_submit()">위치 검색</a>
					</p>
					</form>
				</li>
			</ul>
			<ul class="popList">
				<c:if test="${empty locations}">
					<li class="nocont">검색결과가 없습니다.</li>
				</c:if>
				<c:if test="${!empty locations}">
					<c:forEach var="l" items="${locations}">
						<li>
							<a href="javascript:onClick(${l.locIdx});"><span class="tit" id="loc_name${l.locIdx}">${l.locName} / ${l.locCode}</span> </a></li>
						<input type="hidden" id="${l.locIdx}" value="${l.locIdx}" />
					</c:forEach>
				</c:if>
<%--				<?php--%>
<%--					while($row = (mysqli_fetch_array($result))) {--%>
<%--				?>--%>
<%--				<li><a href="javascript:onClick(<?=$row['LOC_IDX'];?>);"><span class="tit" id = <?="loc_name".$row['LOC_IDX']?>><?= $row['LOC_NAME']?> / <?= $row['LOC_CODE']?></a></li>--%>
<%--				<input type="hidden" id="<?=$row['LOC_IDX'];?>" value="<?=$row['LOC_IDX'];?>"/>--%>
<%--				<?php };?>--%>
			</ul>
			<p class="paging">
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
	document.getElementById("frm").submit();
}
function onClick(idx){
	opener.document.getElementById("loc_idx").value = idx;
	window.opener.LOC_IDX = idx;
	opener.document.getElementById("loc_name").innerHTML = document.getElementById("loc_name"+idx).innerHTML;
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
	var url = "${pageContext.request.contextPath}/itman/popup/locationPop.do";
	url = url + "?page=" + 1;
	url = url + "&range=" + 1;
	location.href = url;	}
//이전 버튼 이벤트
function fn_prev(page, range, rangeSize) {
	var page = (((range - 2) * rangeSize) + 1) <= 1 ? 1 : ((range - 2) * rangeSize) + 1 ;
	var range = (range - 1) <= 1 ? 1 : range - 1;
	var url = "${pageContext.request.contextPath}/itman/popup/locationPop.do";
	url = url + "?page=" + page;
	url = url + "&range=" + range;
	location.href = url;	}
//페이지 번호 클릭
function fn_pagination(page, range, rangeSize, searchType, keyword) {
	var url = "${pageContext.request.contextPath}/itman/popup/locationPop.do";
	url = url + "?page=" + page;
	url = url + "&range=" + range;
	location.href = url;		}
//다음 버튼 이벤트
function fn_next(pageCnt, page, range, rangeSize) {
	var page = (parseInt((range * rangeSize)) + 1) >= pageCnt ? pageCnt / rangeSize * 10 : parseInt((range * rangeSize)) + 1 ;
	var range = (parseInt(range) + 1) >= parseInt(pageCnt / rangeSize + 1) ? parseInt(pageCnt / rangeSize + 1) : (parseInt(range) + 1) ;
	var url = "${pageContext.request.contextPath}/itman/popup/locationPop.do";
	url = url + "?page=" + page;
	url = url + "&range=" + range;
	location.href = url;	}
//마지막 버튼 이벤트
function fn_maxNext(pageCnt, range, rangeSize) {
	var page =  pageCnt / rangeSize * 10;
	var range =    parseInt(pageCnt / rangeSize + 1);
	var url = "${pageContext.request.contextPath}/itman/popup/locationPop.do";
	url = url + "?page=" + page;
	url = url + "&range=" + range;
	location.href = url;
}
</script>
</html>
