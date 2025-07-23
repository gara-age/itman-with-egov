<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" language="java" %>

<?php
    include("../_inc/dbconn.php");
    
    // group 불러오기
    include "../_inc/loginTest.php";
    login_check();
    $group = $_SESSION['group'];


?>
<!doctype html>
<html lang="ko">
 <head>
  <? include "../_inc/title.php"; ?>
 </head>
<body>

	<div id="popup">
		<div class="pop_tit">
			<p class="title">자산 분류 추가 팝업</p>
		</div>
		<div class="pop_cont">
            <form method="post" id="assetCateForm" action="pp_process/writeAssetCategory_proc.jsp">
			<ul class="contEdit">
				<li>
					<p class="tit">분류이름 <span>*</span></p>
					<p class="cont"><input type="text" id="ass_cat_name" name="ass_cat_name" value=""></p>
				</li>
				<li>
					<p class="tit">코드번호 <span>*</span></p>
					<p class="cont"><input type="text" id="ass_cat_code" name="ass_cat_code" value="" placeholder="자산 일련번호에 사용될 코드 번호 입니다."></p>
				</li>
				<!-- 비고란 -->
				<li>
					<p class="tit">비고</p>
					<p class="cont"><input name="sl_no" type="text" /></p>
				</li>
			</ul>
			<p class="pop_btn"><a href="javascript:window.close();" class="del">취소</a><a href="javascript:formSubmit();" class="comp">작성</a></p>
		</div>
	</div>
<script>

    function formSubmit(){
			$ass_cat_name_empty = $("#ass_cat_name").val().trim();
			$ass_cat_code_empty = $("#ass_cat_code").val().trim();

			if(!$ass_cat_name_empty || !$ass_cat_code_empty){
				alert("필수 값을 입력해주세요!");
			}else{
				$("#assetCateForm").submit();
			}
		}

</script>
</body>
</html>
