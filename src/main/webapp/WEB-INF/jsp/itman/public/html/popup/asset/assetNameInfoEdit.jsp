<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" language="java" %>
<?php
include "../../_inc/dbconn.php";

/**
 * 세션 체크
 */
include "../../_inc/loginTest.php";
login_check();

$MOD_IDX = $_SESSION['userIDX'];

$ASS_IDX = $_GET['ass_idx'];


$sql = "SELECT * FROM ITM_ASSET WHERE ASS_IDX = $ASS_IDX";
$query = mysqli_query($dbconn, $sql);
$result = mysqli_fetch_array($query);
?>
<!doctype html>
<html lang="ko">
 <head>
  <? include "../../_inc/title.php"; ?>
 </head>
<body>

	<div id="popup">
		<form method="post" action="pp_process/assetNameInfoEdit_proc.jsp" id="form">
			<input type="hidden" name="ass_idx" value="<?=$ASS_IDX?>" />
		<div class="pop_tit">
			<p class="title">자산명 변경</p>
		</div>
		<div class="pop_cont">
			<ul class="contEdit">
				<li>
					<p class="tit">자산명</p> <!-- 자산명, 최초 구매일, 가격(원) 등 인풋폼-->
					<p class="cont"><input type="text" id="name" name="ass_name" value="<?=$result['ASS_NAME']?>"></p>
				</li>
				<!-- 비고란 -->
				<li>
					<p class="tit">비고</p>
					<p class="cont"><input name="al_note" type="text" /></p>
				</li>
			</ul>
			<p class="pop_btn"><a href="javascript:window.close();" class="del">취소</a><a href="javascript:formSubmit()" onclick="" class="comp">수정</a></p>
		</div>
		</form>
	</div>
	<script>
    function formSubmit(){
        $("#form").submit();
    }
</script>
</body>
</html>
