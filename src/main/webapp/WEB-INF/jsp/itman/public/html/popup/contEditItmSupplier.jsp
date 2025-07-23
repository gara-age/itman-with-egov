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
	$sql = "SELECT * FROM ITM_SUPPLIER WHERE SUP_IDX = $idx";
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
			<p class="title">구매처 수정 팝업</p>
		</div>
		<div class="pop_cont">
			<form method="post" id="itmSupplierForm" action="pp_process/updateSupplier_proc.jsp">
			<ul class="contEdit">
				<li>
					<input type="hidden" name="sup_idx" value="<?=$valueRow['SUP_IDX']?>">
					<p class="tit">구매처 명<span>*</span></p>
					<p class="cont"><input type="text" id="sup_name" name="sup_name" placeholder="구매처 명을 입력해주세요." value="<?=$valueRow['SUP_NAME']?>"></p>
				</li>
				<li>
					<p class="tit">사업자 </br>등록번호<span>*</span></p>
					<p class="cont"><input type="text" id="sup_bnum" name="sup_bnum" placeholder="사업자 등록번호를 입력해 주세요. ex)000" value="<?=$valueRow['SUP_BNUM']?>"></p>
				</li>
				<li>
					<p class="tit">e-mail</p>
					<p class="cont"><input type="text" name="sup_mail" placeholder="이메일를 입력해 주세요. ex)000" value="<?=$valueRow['SUP_MAIL']?>"></p>
				</li>
                <li>
					<p class="tit">구매처연락처</p>
					<p class="cont"><input type="text" name="sup_tel" placeholder="구매처 연락처를 입력해 주세요." value="<?=$valueRow['SUP_TEL']?>"></p>
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
		$sup_name = $("#sup_name").val().trim();
		$sup_bnum = $("#sup_bnum").val().trim();
		if(!$sup_name || !$sup_bnum){
			alert("필수 값을 입력해주세요!");
		}else{
			$("#itmSupplierForm").submit();
		}


    }

</script>
</body>
</html>
