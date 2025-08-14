<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" language="java" %>

<!doctype html>
<html lang="ko" style="background-color: #f0f5f5">
 <head>
     <jsp:include page="${pageContext.request.contextPath}/WEB-INF/jsp/itman/_inc/title.jsp" />
 </head>
<body>

	<div id="popup">
		<div class="pop_tit">
			<p class="title">최초 구매일 변경</p>
		</div>
		<div class="pop_cont">
            <form method="post" id="form" action="/itman/asset/updateAssetBuyDateInfo.do">
                <input type="hidden" name="assIdx" value="${asset.assIdx}">
			<ul class="contEdit">
				<li>
					<p class="tit">최초 구매일</p> <!-- 자산명, 최초 구매일, 가격(원) 등 인풋폼-->
					<p class="cont"><input id="buyDate" name="buyDate" value="${asset.buyDate}" type="date" placeholder="변경할 최초 구매일을 입력해주세요"></p>
				</li>
				<!-- 비고란 -->
				<li>
					<p class="tit">비고</p>
					<p class="cont"><input type="text" name="alNote" /></p>
				</li>
			</ul>
            </form>
			<p class="pop_btn"><a href="javascript:window.close();" class="del">취소</a><a href="#" onclick="formSubmit();" class="comp">수정</a></p>
		</div>
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
	<%--	const buyDate = encodeURIComponent(document.getElementById("buyDate").value);--%>

	<%--	const url = "/itman/asset/updateAssetBuyDateInfo.do?assIdx=" + assIdx + "&buyDate=" + buyDate;--%>

	<%--	window.opener.location.href = url;--%>
	<%--	window.close();--%>
	<%--}--%>
</script>
</body>
</html>
