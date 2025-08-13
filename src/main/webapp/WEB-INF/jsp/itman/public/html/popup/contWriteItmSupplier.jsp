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

<%--?>--%>
<!doctype html>
<html lang="ko">
 <head>
	 <jsp:include page="${pageContext.request.contextPath}/WEB-INF/jsp/itman/_inc/title.jsp" />
 </head>
<body>

	<div id="popup">
		<div class="pop_tit">
			<p class="title">구매처 추가 팝업</p>
		</div>
		<div class="pop_cont">
			<form method="post" id="form" action="${pageContext.request.contextPath}/itman/asset/insertSupplier.do">
			<ul class="contEdit">
				<li>
					<p class="tit">구매처 명<span>*</span></p>
					<p class="cont"><input type="text" id="sup_name" name="supName" placeholder="구매처 명을 입력해주세요." value=""></p>
				</li>
				<li>
					<p class="tit">사업자 </br>등록번호<span>*</span></p>
					<p class="cont"><input type="text" id="sup_bnum" name="supBnum" placeholder="사업자 등록번호를 입력해 주세요."></p>
				</li>
				<li>
					<p class="tit">email</p>
					<p class="cont"><input type="text" name="supMail" placeholder="이메일를 입력해 주세요."></p>
				</li>
                <li>
					<p class="tit">구매처연락처</p>
					<p class="cont"><input type="text" name="supTel" placeholder="구매처 연락처를 입력해 주세요."></p>
				</li>
			
				<!-- 비고란 -->
				<li>
					<p class="tit">비고</p>
					<p class="cont"><input type="text" name="slNote"/></p>
				</li>
			</ul>
			<p class="pop_btn"><a href="javascript:window.close();" class="del">취소</a><a href="#" onclick="formSubmit();" class="comp">추가</a></p>
		</div>
	</div>
<script>
    function formSubmit(){
		$sup_name = $("#sup_name").val().trim();
		$sup_bnum = $("#sup_bnum").val().trim();
		if(!$sup_name || !$sup_bnum){
			alert("필수 값을 입력해주세요!");
		}else{
			$("#itmSupplierForm").submit();
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
