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
			<from method="POST" id="delForm" action="./pp_process/listDeleteProc.php">
			<ul class="contEdit">
				<li>
					<p class="tit">비고</p>
					<p class="cont"><input type="text" id="SL_NOTE"/></p>
				</li>
			</ul>
			<input type="hidden" id="method" value="<?= $method ?>">
			<input type="hidden" id="target" value="<?= $target ?>">
		
				<!--<p class="pop_btn"><a href="javascript:;window.close();" class="del">취소</a><a href="./pp_process/listDeleteProc.jsp?id=<?=$method?>&target=<?=$target?>" class="comp">삭제</a></p> -->
				<p class="pop_btn"><a href="javascript:;window.close();" class="del">취소</a><a id="check" class="comp">삭제</a></p>
	</div>
<script>
	$(document).on('click', '#check', function(e){
            e.preventDefault();
            var url = "./pp_process/listDeleteProc.jsp";
            url += "?method=" + $('#method').val();
            url += "&target=" + $('#target').val();
            url += "&SL_NOTE=" + $('#SL_NOTE').val();
            location.href = url;
            console.log(url);
        });

</script>
</body>
</html>

