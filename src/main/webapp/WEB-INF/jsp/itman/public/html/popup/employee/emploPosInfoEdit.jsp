<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" language="java" %>
<?php
	include "../../_inc/dbconn.php";

	/**
	 * 세션 체크
	 */
	include "../../_inc/loginTest.php";
	login_check();

	$GROUP = $_SESSION['group'];
	$EMP_IDX = $_GET['emp_idx'];

	$sql = "SELECT * FROM ITM_POSITION WHERE GRO_IDX = $GROUP AND DEL_YN = 'N'";
	$query = mysqli_query($dbconn, $sql);
?>
<!doctype html>
<html lang="ko">
 <head>
  <? include "../../_inc/title.php"; ?>
 </head>
<body>

	<div id="popup">
		<form method="post" action="pp_process/emploPosInfoEdit_proc.jsp" id="form">
			<input type="hidden" name="emp_idx" value="<?=$EMP_IDX?>" />
		<div class="pop_tit">
			<p class="title">직위 변경</p>
		</div>
		<div class="pop_cont">
			<ul class="contEdit">
				<li>
				<p class="tit">직위 분류</p><!-- 분류, 상태, 위치, 구매처 등 셀렉 폼-->
					<p class="cont">
						<select name="pos_idx">
							<?php 
								while ($row = mysqli_fetch_array($query)) {
							?>
							<option value="<?=$row['POS_IDX']?>"><?=$row['POS_NAME']?></option>
							<?php }; ?>
						</select>
					</p>
				</li>
			</ul>
			<p class="pop_btn"><a href="javascript:window.close();" class="del">취소</a><a href="#" onclick="formSubmit();" class="comp">수정</a></p>
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
