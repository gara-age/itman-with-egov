<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" language="java" %>
<?php
include "../../_inc/dbconn.php";

/**
 * 세션 체크
 */
include "../../_inc/loginTest.php";
login_check();

$GROUP = $_SESSION['group'];
$ASS_IDX = $_GET['ass_idx'];
$LOC_IDX = $_GET['loc_idx'];

$sql = "SELECT * FROM ITM_LOCATION WHERE GRO_IDX = $GROUP";
$query = mysqli_query($dbconn, $sql);

?>
<!doctype html>
<html lang="ko">
 <head>
  <? include "../../_inc/title.php"; ?>
 </head>
<body>

	<div id="popup">
		<form method="post" action="pp_process/assetLocationInfoEdit_proc.jsp" id="form">
			<input type="hidden" name="ass_idx" value="<?=$ASS_IDX?>" />
			<input type="hidden" id="loc_name" name="loc_name" value="" />
		<div class="pop_tit">
			<p class="title">자산 위치 변경</p>
		</div>
		<div class="pop_cont">
			<ul class="contEdit">
				<li>
				<p class="tit">자산 위치</p><!-- 분류, 상태, 위치, 구매처 등 셀렉 폼-->
					<p class="cont">
						<select id="loc_idx" name="loc_idx">
							<?php 
								while ($row = mysqli_fetch_array($query)) {
							?>
							<option value="<?=$row['LOC_IDX']?>"  <?= $LOC_IDX == $row['LOC_IDX'] ? "selected" :"";?> > <?=$row['LOC_NAME']?></option>
							<?php }; ?>
						</select>
					</p>
				</li>
				<!-- 비고란 -->
				<li>
					<p class="tit">비고</p>
					<p class="cont"><input name="al_note" type="text" /></p>
				</li>
			</ul>
			<p class="pop_btn"><a href="javascript:window.close();" class="del">취소</a><a href="#" onclick="formSubmit();" class="comp">수정</a></p>
		</div>
		</form>
	</div>
	<script>
    function formSubmit(){
		$loc_name = $("#loc_idx option:checked").text();
		$("#loc_name").attr("value", $loc_name);
        $("#form").submit();
    }
</script>
</body>
</html>
