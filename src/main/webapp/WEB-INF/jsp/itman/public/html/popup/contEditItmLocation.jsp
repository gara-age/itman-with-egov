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
	$sql = "SELECT * FROM ITM_LOCATION WHERE LOC_IDX = $idx";
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
			<p class="title">자산 위치 수정 팝업</p>
		</div>
		<div class="pop_cont">
			<form method="post" id="itmLocationForm" action="pp_process/updateItmLocation_proc.jsp">
			<input type="hidden" name="loc_idx" value="<?= $valueRow['LOC_IDX']; ?>" >
			<ul class="contEdit">
				<li>
					<p class="tit">자산 위치명<span>*</span></p>
					<p class="cont"><input type="text" id="loc_name" name="loc_name" placeholder="자산 위치 명을 입력해주세요." value="<?= $valueRow['LOC_NAME']; ?>"></p>
				</li>
				<li>
					<p class="tit">자산 위치 코드번호<span>*</span></p>
					<p class="cont"><input type="text" id="loc_code" name="loc_code" placeholder="자산 위치 코드 번호를 입력해 주세요. ex)000" value="<?= $valueRow['LOC_CODE']; ?>"></p>
				</li>
				
				<!-- 비고란 -->
				<li>
					<p class="tit">비고</p>
					<p class="cont"><input type="text" name="sl_note"/></p>
				</li>
			</ul>
			<p class="pop_btn"><a href="javascript:window.close();" class="del">취소</a><a href="javascript:formSubmit();" class="comp">수정</a></p>
		</div>
	</div>
<script>
	
     function formSubmit(){
			$loc_name_empty = $("#loc_name").val().trim();
			$loc_code_empty = $("#loc_code").val().trim();

			if(!$loc_name_empty || !$loc_code_empty){
				alert("필수 값을 입력해주세요!");
			}else{
				$("#itmLocationForm").submit();
			}
		}

</script>
</body>
</html>
