<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" language="java" %>

<!doctype html>
<html lang="ko" style="background-color: #f0f5f5">
 <head>
	 <jsp:include page="${pageContext.request.contextPath}/WEB-INF/jsp/itman/_inc/title.jsp" />
 </head>
<body>

	<div id="popup">
		<form method="post" action="${pageContext.request.contextPath}/itman/asset/updateAssetSupplyInfo.do" id="form">
			<input type="hidden" name="assIdx" value="${asset.assIdx}" />
			<input type="hidden" id="supName" name="supName" value="" />
		<div class="pop_tit">
			<p class="title">자산 구매처 변경</p>
		</div>
		<div class="pop_cont">
			<ul class="contEdit">
				<li>
				<p class="tit">구매처 분류</p><!-- 분류, 상태, 위치, 구매처 등 셀렉 폼-->
					<p class="cont">
<%--						<select id="sup_idx" name="sup_idx">--%>
<%--							<?php --%>
<%--								while ($row = mysqli_fetch_array($query)) {--%>
<%--							?>--%>
<%--							<option value="<?=$row['SUP_IDX']?>" <?= $SUP_IDX == $row['SUP_IDX'] ? "selected" :"";?> ><?=$row['SUP_NAME']?></option>--%>
<%--							<?php }; ?>--%>
<%--						</select>--%>
						<select id="supply" name="supIdx">
							<c:forEach var="s" items="${suppliers}">
								<option value="${s.supIdx}" name="supIdx" ${asset.supIdx== s.supIdx ? 'selected' : ''} >${s.supName}</option>
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
		// $SUP_NAME = $("#sup_idx option:checked").text();
		// $("#sup_name").attr("value", $SUP_NAME);
        // $("#ItmSupplyform").submit();
		//
		document.forms['form'].submit();

		setTimeout(() => {
			window.opener.location.reload();
			window.close();
		}, 300);
    }
	<%--function updateAsset() {--%>
	<%--	const assIdx = "${asset.assIdx}";--%>
	<%--	const supply = encodeURIComponent(document.getElementById("supply").value);--%>

	<%--	const url = "/itman/asset/updateAssetSupplyInfo.do?assIdx=" + assIdx + "&supIdx=" + supply;--%>

	<%--	window.opener.location.href = url;--%>
	<%--	window.close();--%>
	<%--}--%>
</script>
</body>
</html>