<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" language="java" %>
<?php
	 include "../../_inc/dbconn.php";

	 /**
	  * 세션 체크
	  */
	 include "../../_inc/loginTest.php";
	 login_check();
 
	 $ASS_IDX= $_GET['ass_idx'];
?>
<!doctype html>
<html lang="ko">
 <head>
  <?php include "../../_inc/title.php"; ?>
 </head>
<body>

	<div id="popup">
		<div class="pop_tit">
			<p class="title">자산을 삭제하시겠습니까?</p>
		</div>
		<div class="pop_cont">
			<ul class="contEdit">
				<li>
					<p class="tit">비고</p>
					<p class="cont"><input name="sl_no" type="text"/></p>
				</li>
			</ul>
			<p class="pop_btn"><a href="javascript:;window.close();" class="del">취소</a><a href="<?="./pp_process/contAssetDel_proc.php?ass_idx=".$ASS_IDX?>" class="comp">삭제</a></p>
		</div>
	</div>

</body>
</html>
