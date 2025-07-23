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
	$SUP_IDX = $_GET['sup_idx'];

	$sql = "SELECT * FROM ITM_SUPPLIER WHERE GRO_IDX = $GROUP and del_yn = 'N'";
	$query = mysqli_query($dbconn, $sql);

?>

<!doctype html>
<html lang="ko">
 <head>
  <? include "../../_inc/title.php"; ?>
 </head>
<body>

	<div id="popup">
		<form method="post" action="pp_process/assetUpdateSupplier_proc.jsp" id="ItmSupplyform">
			<input type="hidden" name="ass_idx" value="<?=$ASS_IDX?>" />
			<input type="hidden" id="sup_name" name="sup_name" value="" />
		<div class="pop_tit">
			<p class="title">자산 구매처 변경</p>
		</div>
		<div class="pop_cont">
			<ul class="contEdit">
				<li>
				<p class="tit">구매처 분류</p><!-- 분류, 상태, 위치, 구매처 등 셀렉 폼-->
					<p class="cont">
						<select id="sup_idx" name="sup_idx">
							<?php 
								while ($row = mysqli_fetch_array($query)) {
							?>
							<option value="<?=$row['SUP_IDX']?>" <?= $SUP_IDX == $row['SUP_IDX'] ? "selected" :"";?> ><?=$row['SUP_NAME']?></option>
							<?php }; ?>
						</select>
					</p>
				</li>
				</form>
				<!-- 비고란 -->
				<li>
					<p class="tit">비고</p>
					<p class="cont"><input name="sl_no" type="text" /></p>
				</li>
			</ul>
			<p class="pop_btn"><a href="javascript:window.close();" class="del">취소</a><a href="#" onclick="formSubmit();" class="comp">수정</a></p>
		</div>
	</div>
	<script>
    function formSubmit(){
		$SUP_NAME = $("#sup_idx option:checked").text();
		$("#sup_name").attr("value", $SUP_NAME);
        $("#ItmSupplyform").submit();
    }
</script>
</body>
</html>