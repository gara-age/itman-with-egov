<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" language="java" %>
<?php
    include "../../_inc/dbconn.php";

    /**
     * 세션 체크
     */
    include "../../_inc/loginTest.php";
    login_check();

    $ASS_IDX= $_GET['ass_idx'];
    $change_buydate_sql="SELECT * FROM ITM_ASSET WHERE ASS_IDX=$ASS_IDX";
    
    $change_buydate_query = mysqli_query($dbconn, $change_buydate_sql);
    $change_buydate_result = mysqli_fetch_array($change_buydate_query);
    $BUY_DATE = explode(" ",$change_buydate_result['BUY_DATE'] );
    $BUY_DATE = $BUY_DATE[0];
    
?>
<!doctype html>
<html lang="ko">
 <head>
  <? include "../../_inc/title.php"; ?>
 </head>
<body>

	<div id="popup">
		<div class="pop_tit">
			<p class="title">최초 구매일 변경</p>
		</div>
		<div class="pop_cont">
            <form method="post" id="itmSupplierForm" action="pp_process/assetUpdateBuyDate_proc.jsp">
                <input type="hidden" name="ass_idx" value="<?=$ASS_IDX?>">
			<ul class="contEdit">
				<li>
					<p class="tit">최초 구매일</p> <!-- 자산명, 최초 구매일, 가격(원) 등 인풋폼-->
					<p class="cont"><input name="buy_date" name="buy_date" value="<?=$BUY_DATE?>" type="date" placeholder="변경할 최초 구매일을 입력해주세요"></p>
				</li>
				<!-- 비고란 -->
				<li>
					<p class="tit">비고</p>
					<p class="cont"><input type="text" name="sl_no" /></p>
				</li>
			</ul>
            </form>
			<p class="pop_btn"><a href="javascript:window.close();" class="del">취소</a><a href="javascript:formSubmit();" class="comp">수정</a></p>
		</div>
	</div>
<script>
    function formSubmit(){
        $("#itmSupplierForm").submit();
    }
</script>
</body>
</html>
