<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" language="java" %>

<!doctype html>
<html lang="ko" style="background-color: #f0f5f5">
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
			$state_empty = $("#state").val().trim();

			if(!$state_empty){
				alert("자산 상태를 선택해주세요");
			} else {
				document.forms['form'].submit();

				setTimeout(() => {
					window.opener.location.reload();
					window.close();
				}, 300);
			}

		}
</script>
</body>
</html>
