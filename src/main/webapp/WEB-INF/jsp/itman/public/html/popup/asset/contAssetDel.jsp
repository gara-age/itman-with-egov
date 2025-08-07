<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" language="java" %>
<%--<?php--%>
<%--	 include "../../_inc/dbconn.php";--%>

<%--	 /**--%>
<%--	  * 세션 체크--%>
<%--	  */--%>
<%--	 include "../../_inc/loginTest.php";--%>
<%--	 login_check();--%>
<%-- --%>
<%--	 $ASS_IDX= $_GET['ass_idx'];--%>
<%--?>--%>
<!doctype html>
<html lang="ko">
 <head>
	 <jsp:include page="${pageContext.request.contextPath}/WEB-INF/jsp/itman/_inc/title.jsp"/>
 </head>
<body>

	<div id="popup">
		<form method="post" action="${pageContext.request.contextPath}/itman/asset/deleteAsset.do" name="form">
		<input type="hidden" name="assIdx" value="${asset.assIdx}">
		<div class="pop_tit">
			<p class="title">자산을 삭제하시겠습니까?</p>
		</div>
		<div class="pop_cont">
			<ul class="contEdit">
				<li>
					<p class="tit">비고</p>
					<p class="cont"><input name="alNote" type="text" /></p>
				</li>
			</ul>
			<p class="pop_btn"><a href="javascript:window.close();" class="del">취소</a><a href="#" onclick="deleteAsset();" class="comp">삭제</a></p>
		</div>
		</form>
	</div>

<script>
	function deleteAsset(){
		document.forms['form'].submit();
		setTimeout(() => {
			window.opener.location.href="${pageContext.request.contextPath}/itman/assetsList.do";
			window.close();
		}, 300);
	}
</script>
</body>
</html>
