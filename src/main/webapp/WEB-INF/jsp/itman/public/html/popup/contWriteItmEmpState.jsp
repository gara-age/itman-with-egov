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

	$gro_sql = "SELECT * FROM ITM_GROUP WHERE GRO_IDX = $group";
	$gro_query = mysqli_query($dbconn, $gro_sql);
	$gro_result = mysqli_fetch_array($gro_query);
	// echo($gro_result['GRO_NAME']);

?>
<!doctype html>
<html lang="ko">
 <head>
  <? include "../_inc/title.php"; ?>
 </head>
<body>

	<div id="popup">
		<div class="pop_tit">
			<p class="title"><?= $gro_result['GRO_NAME'] ?>&nbsp 직원 상태 추가 팝업</p>
		</div>
		<div class="pop_cont">
			<form method="post" id="empstateCateForm" action="pp_process/writeItmEmpState_proc.jsp">
			<ul class="contEdit">
				<li>
					<p class="tit">직원 상태명<span>*</span></p>
					<p class="cont"><input type="text" id="emp_st_name" name="emp_st_name" placeholder="직원 상태명을 입력해주세요." value=""></p>
				</li>
				<li>
					<p class="tit">상태코드번호<span>*</span></p>
					<p class="cont"><input type="text" id="emp_st_code" name="emp_st_code" placeholder="직원 상태 코드 번호를 입력해 주세요. ex)000"></p>
				</li>
				
				<!-- 비고란 -->
				<li>
					<p class="tit">비고</p>
					<p class="cont"><input type="text" name="sl_note"/></p>
				</li>
				
			</ul>
			<p class="pop_btn"><a href="javascript:window.close();" class="del">취소</a><a href="javascript:formSubmit();" class="comp">등록</a></p>
		</div>
	</div>
<script>

function formSubmit(){
			$emp_name_empty = $("#emp_st_name").val().trim();
			$emp_code_empty = $("#emp_st_code").val().trim();

			if(!$emp_name_empty || !$emp_code_empty){
				alert("필수 값을 입력해주세요!");
			}else{
				$("#empstateCateForm").submit();
			}
		}
		
</script>
</body>
</html>

