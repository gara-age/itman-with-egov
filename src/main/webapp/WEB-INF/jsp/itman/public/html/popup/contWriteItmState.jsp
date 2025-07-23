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
 </head>
<body>

	<div id="popup">
		<div class="pop_tit">
			<p class="title">자산 상태 추가 팝업</p>
		</div>
		<div class="pop_cont">
			<form method="post" id="stateCateForm" action="pp_process/writeItmState_proc.jsp">
			<ul class="contEdit">
				<li>
					<p class="tit">자산 상태명<span>*</span></p>
					<p class="cont"><input type="text" id="sta_name" name="sta_name" placeholder="자산 상태명을 입력해주세요." value=""></p>
				</li>
				<li>
					<p class="tit">상태코드번호<span>*</span></p>
					<p class="cont"><input type="text" id="sta_code" name="sta_code" placeholder="자산 상태 코드 번호를 입력해 주세요. ex)000"></p>
				</li>
			
				<!-- 비고란 -->
				<li>
					<p class="tit">비고</p>
					<p class="cont"><input type="text" name="sta_note"/></p>
				</li>
				
			</ul>
			<p class="pop_btn"><a href="javascript:window.close();" class="del">취소</a><a href="javascript:formSubmit();" class="comp">등록</a></p>
		</div>
	</div>
<script>

    function formSubmit(){
			$sta_name_empty = $("#sta_name").val().trim();
			$sta_code_empty = $("#sta_code").val().trim();

			if(!$sta_name_empty || !$sta_code_empty){
				alert("필수 값을 입력해주세요!");
			}else{
				$("#stateCateForm").submit();
			}
		}
		
</script>
</body>
</html>