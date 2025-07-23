<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" language="java" %>

<?php
	include "../_inc/dbconn.php";

	 /**
	  * 세션 체크
	  */
	  include "../_inc/loginTest.php";
	  login_check();
	  $group = $_SESSION['group'];
 
    $method = $_GET['id'];
    $target = $_GET['target'];
?>
<!doctype html>
<html lang="ko">
 <head>
  <? include "../_inc/title.php"; ?>
 </head>
<body>

	<div id="popup">
		<div class="pop_tit">
			<p class="title">삭제하시겠습니까?</p>
		</div>
		<div class="pop_cont">
			<ul class="contEdit">
				<li>
					<p class="tit">비고</p>
					<p class="cont"><input type="text"/></p>
				</li>
			</ul>
			<p class="pop_btn"><a href="javascript:;window.close();" class="del">취소</a><a href="pp_process/contDivisionDel_proc.jsp?id=<?=$method?>&target=<?=$target?>" class="comp">삭제</a></p>
	</div>

</body>
</html>


