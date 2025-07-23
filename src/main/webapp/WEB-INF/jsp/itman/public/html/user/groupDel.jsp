<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" language="java" %>

<?php
	include "../_inc/dbconn.php";

	 /**
	  * 세션 체크
	  */
	include "../_inc/loginTest.php";
	login_check();
 
    $method = $_GET['id'];
    $target = $_GET['target'];
?>

<!doctype html>
<html lang="ko">
 <head>
  <? include "../_inc/title.php";  ?>

 </head>
<body>

	<div id="popup">
		<div class="pop_tit">
			<p class="title">삭제하시겠습니까?</p>
		</div>
		<div class="pop_cont">
			<ul class="contEdit">
				<li>
					<form action="groupDel_proc.jsp" name="frm" id="frm" method="post">
						<input type="hidden" name="id" value="<?=$method?>"/>
						<input type="hidden" name="target" value="<?=$target?>"/>
						<p class="tit">비밀번호</p>
						<p class="cont"><input id="password" name="password" type="password"/></p>
					</form>
				</li>
			</ul>
			<p class="pop_btn"><a href="javascript:window.close();" class="del">취소</a><a href="javascript:form_submit();" class="comp">삭제</a></p>
		</div>
	</div>

</body>
<script>
	function form_submit() {
		$("#frm").submit();
	  }
	</script>
</html>
