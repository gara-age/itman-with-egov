<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" language="java" %>

<%--<?php--%>
<%--    include("../_inc/dbconn.php");--%>
<%--    // group 불러오기--%>
<%--    include "../_inc/loginTest.php";--%>
<%--    login_check();--%>
<%--    $group = $_SESSION['group'];--%>
<%--	$REG_IDX = $_SESSION['userIDX'];--%>

<%--	$group_sql = "SELECT * FROM ITM_GROUP WHERE REG_IDX = $REG_IDX";--%>
<%--	$group_query = mysqli_query($dbconn, $group_sql);--%>
<%--	--%>
<%--	// 기존 값 불러오기--%>
<%--	$idx = $_GET['idx'];--%>
<%--	$sql = "SELECT * FROM ITM_ASSET_CATEGORY WHERE ASS_CAT_IDX = $idx";--%>
<%--	$query = mysqli_query($dbconn, $sql);--%>
<%--	$valueRow = (mysqli_fetch_array($query));--%>
<%--?>--%>
<!doctype html>
<html lang="ko">
 <head>
  <jsp:include page="${pageContext.request.contextPath}/WEB-INF/jsp/itman/_inc/title.jsp" />
 </head>
<body>
	<div id="popup">
		<div class="pop_tit">
			<p class="title">자산 분류 수정 팝업</p>
		</div>
		<div class="pop_cont">
			<form method="post" id="form" action="${pageContext.request.contextPath}/itman/updateAssetCategory.do">
			<input type="hidden" name="assCatIdx" value="${assetCategory.assCatIdx}" />
			<ul class="contEdit">
				<li>
					<p class="tit">자산 분류명<span>*</span></p>
					<p class="cont"><input type="text" id="ASS_CAT_NAME" name="assCatName" placeholder="자산 분류 명을 입력해주세요." value="${assetCategory.assCatName}"></p>
				</li>
				<li>
					<p class="tit">코드번호<span>*</span></p>
					<p class="cont"><input type="text" id="ASS_CAT_CODE" name="assCatCode" placeholder="자산 분류 코드 번호를 입력해 주세요. ex)000" value="${assetCategory.assCatCode}"></p>
				</li>
				
				<!-- 비고란 -->
				<li>
					<p class="tit">비고</p>
					<p class="cont"><input type="text" name="slNote" value="${assetCategory.slNote}" /></p>
				</li>
			</ul>
			<p class="pop_btn"><a href="javascript:window.close();" class="del">취소</a><a href="#" onclick="formSubmit()" class="comp">수정</a></p>
			</form>
		</div>
	</div>
<script>

   function formSubmit(){
			$ass_cat_name_empty = $("#ASS_CAT_NAME").val().trim();
			$ass_cat_code_empty = $("#ASS_CAT_CODE").val().trim();

			if(!$ass_cat_name_empty || !$ass_cat_code_empty){
				alert("필수 값을 입력해주세요!");
			}else{
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
