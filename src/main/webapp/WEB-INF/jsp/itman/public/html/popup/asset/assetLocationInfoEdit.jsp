<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--<?php--%>
<%--include "../../_inc/dbconn.php";--%>

<%--/**--%>
<%-- * 세션 체크--%>
<%-- */--%>
<%--include "../../_inc/loginTest.php";--%>
<%--login_check();--%>

<%--$GROUP = $_SESSION['group'];--%>
<%--$ASS_IDX = $_GET['ass_idx'];--%>
<%--$LOC_IDX = $_GET['loc_idx'];--%>

<%--$sql = "SELECT * FROM ITM_LOCATION WHERE GRO_IDX = $GROUP";--%>
<%--$query = mysqli_query($dbconn, $sql);--%>

<%--?>--%>
<!doctype html>
<html lang="ko">
 <head>
	 <jsp:include page="${pageContext.request.contextPath}/WEB-INF/jsp/itman/_inc/title.jsp" />
<%--	 <link rel="stylesheet" href="${pageContext.request.contextPath}/css/_css/default.css" />--%>
 </head>
<body>

	<div id="popup">
		<form method="post" action="${pageContext.request.contextPath}/itman/asset/updateAssetLocationInfo.do" id="form">
			<input type="hidden" name="assIdx" value="${asset.assIdx}" />
			<input type="hidden" id="locName" name="locName" value="" />
		<div class="pop_tit">
			<p class="title">자산 위치 변경</p>
		</div>
		<div class="pop_cont">
			<ul class="contEdit">
				<li>
				<p class="tit">자산 위치</p><!-- 분류, 상태, 위치, 구매처 등 셀렉 폼-->
					<p class="cont">
<%--						<select id="loc_idx" name="locIdx">--%>
<%--							<?php --%>
<%--								while ($row = mysqli_fetch_array($query)) {--%>
<%--							?>--%>
<%--							<option value="<?=$row['LOC_IDX']?>"  <?= $LOC_IDX == $row['LOC_IDX'] ? "selected" :"";?> > <?=$row['LOC_NAME']?></option>--%>
<%--							<?php }; ?>--%>
<%--						</select>--%>
						<select id="loc_idx" name="locIdx">
							<c:forEach var="l" items="${locations}">
								<option value="${l.locIdx}" name="locIdx" ${asset.locIdx== l.locIdx ? 'selected':''}>${l.locName}</option>
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
			document.forms['form'].submit();

			setTimeout(() => {
				window.opener.location.reload();
				window.close();
			}, 300);
		}

	<%--function updateAsset() {--%>
	<%--	const assIdx = "${asset.assIdx}";--%>
	<%--	const location = encodeURIComponent(document.getElementById("loc_idx").value);--%>

	<%--	const url = "/itman/asset/updateAssetLocationInfo.do?assIdx=" + assIdx + "&locIdx=" + location;--%>

	<%--	window.opener.location.href = url;--%>
	<%--	window.close();--%>
	<%--}--%>
</script>
</body>
</html>
