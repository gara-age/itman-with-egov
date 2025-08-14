<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html lang="ko" style="background-color: #f0f5f5">
 <head>
	 <jsp:include page="${pageContext.request.contextPath}/WEB-INF/jsp/itman/_inc/checkSession.jsp"/>
	 <jsp:include page="${pageContext.request.contextPath}/WEB-INF/jsp/itman/_inc/title.jsp" />
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
