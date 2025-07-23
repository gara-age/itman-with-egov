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
$STA_IDX = $_GET['sta_idx'];


$sql = "SELECT * FROM ITM_STATE WHERE GRO_IDX = $GROUP";
$query = mysqli_query($dbconn, $sql);

$compare_sql = "SELECT * FROM ITM_ASSET WHERE ASS_IDX = $ASS_IDX ";
$compare_query = mysqli_query($dbconn, $compare_sql);
$compare_result = mysqli_fetch_array($compare_query);
?>
<!doctype html>
<html lang="ko">
 <head>
  <? include "../../_inc/title.php"; ?>
 </head>
<body>

	<div id="popup">
		<form method="post" action="pp_process/assetStateInfoEdit_proc.jsp" id="form">
			<input type="hidden" name="ass_idx" value="<?=$ASS_IDX?>" />
			<input type="hidden" id="sta_name" name="sta_name" value="" />
		<div class="pop_tit">
			<p class="title">자산 상태 변경</p>
		</div>
		<div class="pop_cont">
			<ul class="contEdit">
				<li>
				<p class="tit">자산 상태</p><!-- 분류, 상태, 위치, 구매처 등 셀렉 폼-->
					<p class="cont">
						<select id="sta_idx" name="sta_idx">
							<?php 
								while ($row = mysqli_fetch_array($query)) {
							?>
							<option value="<?=$row['STA_IDX']?>" <?= $STA_IDX == $row['STA_IDX'] ? "selected" :"";?> > <?=$row['STA_NAME']?></option>
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
		$sta_name = $("#sta_idx option:checked").text();
		$("#sta_name").val($sta_name);
        $("#form").submit();
    }
</script>
</body>
</html>
