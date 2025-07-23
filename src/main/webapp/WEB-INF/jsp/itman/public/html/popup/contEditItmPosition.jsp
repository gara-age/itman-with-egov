<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" language="java" %>

<?php
    include("../_inc/dbconn.php");
    // group 불러오기
    include "../_inc/loginTest.php";
    login_check();
    $group = $_SESSION['group'];
	$REG_IDX = $_SESSION['userIDX'];

	$group_sql = "SELECT * FROM ITM_GROUP WHERE REG_IDX = $REG_IDX";
	$group_query = mysqli_query($dbconn, $group_sql);

	// 기존 값 불러오기
	$idx = $_GET['idx'];
	$sql = "SELECT * FROM ITM_POSITION WHERE POS_IDX = $idx";
	$query = mysqli_query($dbconn, $sql);
	$valueRow = (mysqli_fetch_array($query));
?>
<!doctype html>
<html lang="ko">
 <head>
  <? include "../_inc/title.php"; ?>

	</script-x>
 </head>
<body>
	<div id="popup">
		<div class="pop_tit">
			<p class="title">직위 수정 팝업</p>
		</div>
		<div class="pop_cont">
			<form method="post" id="itmSupplierForm" action="pp_process/updatePosition_proc.jsp">
			<ul class="contEdit">
				<li>
					<input type="hidden" id="POS_IDX" name="POS_IDX" value="<?=$valueRow['POS_IDX']?>">
					<p class="tit">직위명<span>*</span></p>
					<p class="cont"><input type="text" id="POS_NAME" name="POS_NAME" placeholder="직위명을 입력해주세요." value="<?=$valueRow['POS_NAME']?>"></p>
				</li>
                <li>
					<p class="tit">직위 코드<span>*</span></p>
					<p class="cont"><input type="text" id="POS_CODE" name="POS_CODE" placeholder="직위 연락처를 입력해 주세요." value="<?=$valueRow['POS_CODE']?>"></p>
				</li>
			
				<!-- 비고란 -->
				<li>
					<p class="tit">비고</p>
					<p class="cont"><input type="text" name="sl_no" value="<?=$valueRow['SUP_MEMO']?>"/></p>
				</li>
			</ul>
			<p class="pop_btn"><a href="javascript:window.close();" class="del">취소</a><a href="javascript:formSubmit();" class="comp">수정</a></p>
		</div>
	</div>
<script>
    function formSubmit(){
		$POS_CODE = $("#POS_CODE").val().trim();
		$POS_NAME = $("#POS_NAME").val().trim();
		if(!$POS_CODE || !$POS_NAME){
			alert("필수 값을 입력해주세요!");
		}else{
			$("#itmSupplierForm").submit();
		}
    }

</script>
</body>
</html>
