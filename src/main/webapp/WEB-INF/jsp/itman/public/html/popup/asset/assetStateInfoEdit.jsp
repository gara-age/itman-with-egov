<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" language="java" %>
<%--<?php--%>
<%--include "../../_inc/dbconn.php";--%>

<%--/**--%>
<%-- * 세션 체크--%>
<%-- */--%>
<%--include "../../_inc/loginTest.php";--%>
<%--login_check();--%>

<%--$GROUP = $_SESSION['group'];--%>
<%--$ASS_IDX = $_GET['ass_idx'];--%>
<%--$STA_IDX = $_GET['sta_idx'];--%>


<%--$sql = "SELECT * FROM ITM_STATE WHERE GRO_IDX = $GROUP";--%>
<%--$query = mysqli_query($dbconn, $sql);--%>

<%--$compare_sql = "SELECT * FROM ITM_ASSET WHERE ASS_IDX = $ASS_IDX ";--%>
<%--$compare_query = mysqli_query($dbconn, $compare_sql);--%>
<%--$compare_result = mysqli_fetch_array($compare_query);--%>
<%--?>--%>
<!doctype html>
<html lang="ko">
 <head>
	 <jsp:include page="${pageContext.request.contextPath}/WEB-INF/jsp/itman/_inc/title.jsp" />
 </head>
<body>

	<div id="popup">
		<form method="post" action="${pageContext.request.contextPath}/itman/asset/updateAssetStateInfo.do" id="form">
			<input type="hidden" name="assIdx" value="${asset.assIdx}" />
			<input type="hidden" id="staName" name="staName" value="${asset.assStaName}" />
		<div class="pop_tit">
			<p class="title">자산 상태 변경</p>
		</div>
		<div class="pop_cont">
			<ul class="contEdit">
				<li>
				<p class="tit">자산 상태</p><!-- 분류, 상태, 위치, 구매처 등 셀렉 폼-->
					<p class="cont">
						<select id="state" name="staIdx">
							<option value="">상태선택</option>
							<c:forEach var="s" items="${states}">
								<option value="${s.staIdx}" name="staIdx" ${asset.staIdx== s.staIdx ? 'selected' : ''} >${s.staName}</option>
							</c:forEach>
						</select>
					</p>
				</li>
				<!-- 비고란 -->
				<li>
					<p class="tit">비고</p>
					<p class="cont"><input name="alNote" type="text" /></p>
				</li>
			</ul>
			<p class="pop_btn"><a href="javascript:window.close();" class="del">취소</a><a href="#" onclick="formSubmit();" class="comp">수정</a></p>
		</div>
		</form>
	</div>
	<script>
		function formSubmit(){
			// $("#form").submit();
			document.forms['form'].submit();

			setTimeout(() => {
				window.opener.location.reload();
				window.close();
			}, 300);
		}
	<%--function updateAsset() {--%>
	<%--	const assIdx = "${asset.assIdx}";--%>
	<%--	const state = encodeURIComponent(document.getElementById("state").value);--%>

	<%--	const url = "/itman/asset/updateAssetStateInfo.do?assIdx=" + assIdx + "&staIdx=" + state;--%>

	<%--	window.opener.location.href = url;--%>
	<%--	window.close();--%>
	<%--}--%>
</script>
</body>
</html>
