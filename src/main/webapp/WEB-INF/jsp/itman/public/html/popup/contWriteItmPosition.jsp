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
			<p class="title">직위 작성 팝업</p>
		</div>
		<div class="pop_cont">
			<form method="post" id="itmPositionForm" action="pp_process/writePosition_proc.jsp">
			<ul class="contEdit">
				<li>
					<p class="tit">직위명<span>*</span></p>
					<p class="cont"><input type="text" id="pos_name" name="pos_name" placeholder="직위 명을 입력해주세요." value=""></p>
				</li>
				<li>
					<p class="tit">직위 코드<span>*</span></p>
					<p class="cont"><input type="text" id="pos_code" name="pos_code" placeholder="직위 코드 번호를 입력해 주세요. ex)000"></p>
				</li>
				
				<!-- 비고란 -->
				<li>
					<p class="tit">비고</p>
					<p class="cont"><input type="text" name="sl_note" value="<?=$valueRow['SL_NOTE']?>"/></p>
				</li>
			</ul>
			<p class="pop_btn"><a href="javascript:window.close();" class="del">취소</a><a href="javascript:formSubmit();" class="comp">작성</a></p>
		</div>
	</div>
<script>
    function formSubmit(){
		$pos_name = $("#pos_name").val().trim();
		$pos_code = $("#pos_code").val().trim();
		if(!$pos_name || !$pos_code){
			alert("필수 값을 입력해주세요!");
		}else{
			$("#itmPositionForm").submit();
		}
    }

</script>
</body>
</html>
