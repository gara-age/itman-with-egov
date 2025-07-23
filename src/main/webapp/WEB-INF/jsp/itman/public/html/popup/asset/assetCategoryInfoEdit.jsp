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
	$ASS_CAT_IDX = $_GET['ass_cat_idx'];

	$sql = "SELECT * FROM ITM_ASSET_CATEGORY WHERE GRO_IDX = $GROUP";
	$query = mysqli_query($dbconn, $sql);

?>

<!doctype html>
<html lang="ko">
 <head>
  <? include "../../_inc/title.php"; ?>
 </head>
<body>

	<div id="popup">
		<form method="post" action="pp_process/assetCategoryInfoEdit_proc.jsp" id="form">
			<input type="hidden" name="ass_idx" value="<?=$ASS_IDX?>" />
			<input type="hidden" id="ass_cat_name" name="ass_cat_name" value="" />
		<div class="pop_tit">
			<p class="title">자산 분류 변경</p>
		</div>
		<div class="pop_cont">
			<ul class="contEdit">
				<li>
				<p class="tit">자산 분류</p><!-- 분류, 상태, 위치, 구매처 등 셀렉 폼-->
					<p class="cont">
						<select id="ass_cat_idx" name="ass_cat_idx">
							<?php 
								while ($row = mysqli_fetch_array($query)) {
							?>
							<option value="<?=$row['ASS_CAT_IDX']?>" <?= $ASS_CAT_IDX == $row['ASS_CAT_IDX'] ? "selected" :"";?> ><?=$row['ASS_CAT_NAME']?></option>
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
		$ass_cat_name = $("#ass_cat_idx option:checked").text();
		$("#ass_cat_name").val($ass_cat_name);
        $("#form").submit();
    }
</script>
</body>
</html>
