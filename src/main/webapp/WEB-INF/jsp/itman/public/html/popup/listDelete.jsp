<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" language="java" %>

<%--<?php--%>
<%--	include "../_inc/dbconn.php";--%>

<%--	 /**--%>
<%--	  * 세션 체크--%>
<%--	  */--%>
<%--	  include "../_inc/loginTest.php";--%>
<%--	  login_check();--%>
<%--	  $group = $_SESSION['group'];--%>
<%-- --%>
<%--    $method = $_GET['id'];--%>
<%--    $target = $_GET['target'];--%>

<%--?>--%>
<!doctype html>
<html lang="ko">
 <head>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/jsp/itman/_inc/title.jsp" />
 </head>
<body>
<c:if test="${!empty supply}">
	<c:set var="actionUrl" value="${pageContext.request.contextPath}/itman/deleteSupplier.do" />
</c:if>
<c:if test="${!empty location}">
	<c:set var="actionUrl" value="${pageContext.request.contextPath}/itman/deleteLocation.do" />
</c:if>
<c:if test="${!empty assetCategory}">
	<c:set var="actionUrl" value="${pageContext.request.contextPath}/itman/deleteAssetCategory.do" />
</c:if>
	<div id="popup">
		<div class="pop_tit">
			<p class="title">삭제하시겠습니까?</p>
		</div>
		<div class="pop_cont">
			<form method="POST" id="form" action="${actionUrl}">
		<input name="supIdx" type="hidden" value="${supply.supIdx}"/>
				<input name="locIdx" type="hidden" value="${location.locIdx}"/>
				<input name="assCatIdx" type="hidden" value="${assetCategory.assCatIdx}" />
			<ul class="contEdit">
				<li>
					<p class="tit">비고</p>
					<p class="cont"><input type="text" id="SL_NOTE" name="slNote"/></p>
				</li>
			</ul>
				<!--<p class="pop_btn"><a href="javascript:;window.close();" class="del">취소</a><a href="./pp_process/listDeleteProc.jsp?id=<?=$method?>&target=<?=$target?>" class="comp">삭제</a></p> -->
				<p class="pop_btn"><a href="javascript:;window.close();" class="del">취소</a><a id="check" class="comp" href="#" onclick="formSubmit();">삭제</a></p>

	</form>
	</div>
	</div>
<script>
	function formSubmit() {
		document.forms['form'].submit();

		setTimeout(() => {
			window.opener.location.reload();
			window.close();
	}, 300);
	}

</script>
</body>
</html>

