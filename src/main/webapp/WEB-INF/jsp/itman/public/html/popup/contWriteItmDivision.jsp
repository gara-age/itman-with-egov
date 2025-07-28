<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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
<%--  <? include "../_inc/title.php"; ?>--%>
	<jsp:include page="${pageContext.request.contextPath}/WEB-INF/jsp/itman/_inc/title.jsp" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/_css/default.css" />
 </head>
<body>

	<div id="popup">
		<div class="pop_tit">
			<p class="title">부서 추가 팝업</p>
		</div>
		<div class="pop_cont">
			<form method="post" id="divisionCateForm" action="pp_process/writeItmDivision_proc.jsp">
			<ul class="contEdit">
				<li>
					<p class="tit">부서명<span>*</span></p>
					<p class="cont"><input type="text" id="div_name" name="div_name" placeholder="부서명을 입력해주세요." value=""></p>
				</li>
				<li>
					<p class="tit">부서코드번호<span>*</span></p>
					<p class="cont"><input type="text" id="div_code" name="div_code" placeholder="부서 코드 번호를 입력해 주세요."></p>
				</li>
				<li>
					<p class="tit">사용유무<span>*</span></p>
					<p class="cont"><input type="radio" id="yes" name="gener" value="Y"><label for="yes">사용</label> <input type="radio" id="no" name="gener" value="N" checked><label for="no">사용안함</label></p>
				</li>
			</ul>
			<p class="pop_btn"><a href="javascript:window.close();" class="del">취소</a><a href="javascript:formSubmit();" class="comp">등록</a></p>
		</div>
	</div>
<script>
    function formSubmit(){
		$div_name = $("#div_name").val().trim();
		$div_code = $("#div_code").val().trim();
		
		if(!$div_name || !$div_code){
			alert("필수 값을 입력해주세요!");
		}else{
			$("#divisionCateForm").submit();
		}
    }
</script>
</body>
</html>

