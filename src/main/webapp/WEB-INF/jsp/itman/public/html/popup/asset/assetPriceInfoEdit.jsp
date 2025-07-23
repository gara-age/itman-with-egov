<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" language="java" %>
<?php
    include "../../_inc/dbconn.php";

    /**
     * 세션 체크
     */
    include "../../_inc/loginTest.php";
    login_check();

    $ASS_IDX= $_GET['ass_idx'];
    $change_price_sql="SELECT * FROM ITM_ASSET WHERE ASS_IDX=$ASS_IDX";
    
    $change_price_query = mysqli_query($dbconn, $change_price_sql);
    $change_price_result = mysqli_fetch_array($change_price_query);
   
    
?>
<!doctype html>
<html lang="ko">
 <head>
  <? include "../../_inc/title.php"; ?>
 </head>
<body>

	<div id="popup">
		<div class="pop_tit">
			<p class="title">재고 구매 가격 변경</p>
		</div>
		<div class="pop_cont">
            <form method="post" id="itmSupplierForm" action="pp_process/assetUpdatePrice_proc.jsp">
                <input type="hidden" name="ass_idx" value="<?=$ASS_IDX?>">
			<ul class="contEdit">
				<li>
					<p class="tit">구매 가격</p> <!-- 자산명, 최초 구매일, 가격(원) 등 인풋폼-->
					<p class="cont"><input type="text" id="price" name="price" value="<?=$change_price_result['PRICE']?>"  placeholder="변경할 구매 가격을 입력하세요."></p>
				</li>
				<!-- 비고란 -->
				<li>
					<p class="tit">비고</p>
					<p class="cont"><input type="text" name="sl_no" /></p>
				</li>
			</ul>
            </form>
			<p class="pop_btn"><a href="#" class="del">취소</a><a href="javascript:formSubmit();" class="comp">수정</a></p>
		</div>
	</div>
<script>
    function formSubmit(){
        $("#itmSupplierForm").submit();
    }

	document.getElementById('price').addEventListener('input', function (e) {
		let value = e.target.value;

		// 숫자만 남기기
		value = value.replace(/[^0-9]/g, '');

		// 천 단위 콤마 추가
		value = value.replace(/\B(?=(\d{3})+(?!\d))/g, ',');

		e.target.value = value;
	});		

</script>
</body>
</html>
