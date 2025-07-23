<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" language="java" %>

<?php
    include("../_inc/dbconn.php");
    // group 불러오기
    include "../_inc/loginTest.php";
    login_check();
    $group = $_SESSION['group'];
	$REG_IDX = $_SESSION['userIDX'];
	$orderby = $_GET['orderby'];

	$group_sql = "SELECT * FROM ITM_GROUP WHERE REG_IDX = $REG_IDX";
	$group_query = mysqli_query($dbconn, $group_sql);
	
	// 기존 값 불러오기
	$idx = $_GET['idx'];
	$sql = "SELECT * FROM ITM_DIVISION WHERE DIV_IDX = $idx";
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
			<p class="title">부서 수정 팝업</p>
		</div>
		<div class="pop_cont">
			<form method="post" id="itmDivisionForm" action="pp_process/updateDivision_proc.jsp">
			<input type="hidden" name="div_idx" value="<?= $valueRow['DIV_IDX']; ?>" >
			<ul class="contEdit">
				<li>
					<p class="tit">부서명<span>*</span></p>
					<p class="cont"><input type="text" id="div_name" name="div_name" placeholder="부서명을 입력해주세요." value="<?= $valueRow['DIV_NAME']; ?>"></p>
				</li>
				<li>
					<p class="tit">부서코드번호<span>*</span></p>
					<p class="cont"><input type="text" id="div_code" name="div_code" placeholder="부서 코드 번호를 입력해 주세요. ex)000" value="<?= $valueRow['DIV_CODE']; ?>"></p>
				</li>
				<li>
					<p class="tit">사용유무</p>
					<p class="cont"><input type="radio" id="yes" name="radio" value="Y" <?=$valueRow['DIV_YN']==="Y"?"checked":"";?> ><label for="yes">사용</label> <input type="radio" id="no" name="radio" value="N" <?=$valueRow['DIV_YN']==="N"?"checked":"";?> ><label for="no">사용안함</label></p>
				</li>
			</ul>
		</form>
			<p class="pop_btn"><a href="javascript:;window.close();" class="del">취소</a><a href="javascript:formSubmit();" class="comp">수정</a></p>
		</div>
	</div>
<script>
    function formSubmit(){
		$div_name = $("#div_name").val().trim();
		$div_code = $("#div_code").val().trim();
		
		if(!$div_name || !$div_code){
			alert("필수 값을 입력해주세요!");
		}else{
			$("#itmDivisionForm").submit();
		}
    }

</script>
</body>
</html>