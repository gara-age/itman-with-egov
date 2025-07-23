<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" language="java" %>
<?php
    include "../../_inc/dbconn.php";

    /**
     * 세션 체크
     */
    include "../../_inc/loginTest.php";
    login_check();

    $EMP_IDX= $_GET['emp_idx'];
    $sql="SELECT * FROM ITM_EMPLOYE WHERE EMP_IDX = $EMP_IDX";
    
    $query = mysqli_query($dbconn, $sql);
    $result = mysqli_fetch_array($query);
   
    
?>
<!doctype html>
<html lang="ko">
 <head>
  <? include "../../_inc/title.php"; ?>
 </head>
<body>

	<div id="popup">
		<div class="pop_tit">
			<p class="title">직원 휴대폰 변경</p>
		</div>
		<div class="pop_cont">
            <form method="post" id="form" action="pp_process/emploTelInfoEdit_proc.jsp">
                <input type="hidden" name="emp_idx" value="<?=$EMP_IDX?>">
			<ul class="contEdit">
				<li>
					<p class="tit">직원 휴대폰</p> <!-- 자산명, 최초 구매일, 가격(원) 등 인풋폼-->
					<p class="cont"><input type="text" name="emp_tel" value="<?=$result['EMP_TEL']?>"  placeholder="변경할 휴대폰 번호를 입력하세요."></p>
				</li>
				<!-- 비고란 -->
			</ul>
            </form>
			<p class="pop_btn"><a href="javascript:window.close();" class="del">취소</a><a href="javascript:formSubmit();" class="comp">수정</a></p>
		</div>
	</div>
<script>
    function formSubmit(){
        $("#form").submit();
    }
</script>
</body>
</html>
