<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" language="java" %>
<?php

	include "../../_inc/dbconn.php";
		
	/**
	 * 세션 체크
	 */
	include "../../_inc/loginTest.php";
	login_check();
	
	$group = $_SESSION['group'];
	$which = $_GET['which'];
	
?>

<!doctype html>
<html lang="ko">
 <head>
  <? include "../../_inc/title.php"; ?>
 </head>
<body>

	<div id="popup">
		<div class="pop_tit">
			<p class="title">정보를 입력해주세요</p>
		</div>
		<div class="pop_cont">
			<ul class="contEdit">
				<form id="frm" method="post" action="pp_process/emploStateWrite_proc.jsp?" >
				<li>
					<p class="tit">상태이름 <span>*</span></p>
					<p class="cont"><input name="emp_st_name" type="text" placeholder="직원 상태명을 입력해 주세요."></p>
				</li>
				<li>
					<p class="tit">코드번호 <span>*</span></p>
					<p class="cont"><input name="emp_st_code" type="text" placeholder="직원상태 코드번호를 입력해 주세요."></p>
				</li>
				<!-- 비고란 -->
			</ul>
			<p class="pop_btn"><a href="javascript:;window.close();" class="del">취소</a><a href="javascript:formSubmit();" class="comp">수정</a></p>
		</div>
	</div>

	<script>
		function formSubmit(){
			$("#frm").submit();
		}
		</script>
</body>
</html>
