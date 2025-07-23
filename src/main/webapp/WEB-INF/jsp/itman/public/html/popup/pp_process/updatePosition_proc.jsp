<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" language="java" %>
<?php
    	include "../../_inc/dbconn.php";

        /**
         * 세션 체크
         */
        include "../../_inc/loginTest.php";
        login_check();

        $GRO_IDX = $_SESSION['group'];
        $REG_IDX = $_SESSION['userIDX'];
        $POS_IDX = $_POST['POS_IDX'];
        $POS_NAME = $_POST['POS_NAME'];
        $POS_CODE = $_POST['POS_CODE'];
        $SL_NO = $_POST['sl_no'];
		
		//자산 분류 코드 중복이 되는지 체크 
		$check_POS_CODE_SQL ="SELECT count(*) FROM ITM_POSITION WHERE POS_CODE = $POS_CODE AND GRO_IDX = $GRO_IDX AND POS_IDX != $POS_IDX";
		$check_POS_CODE_query = mysqli_query($dbconn, $check_POS_CODE_SQL);
		$check_POS_CODE_arr = mysqli_fetch_array($check_POS_CODE_query);
		if(!$check_POS_CODE_arr[0] == ""){
			echo "<script>alert('직위 코드가 중복입니다 다시 입력해 주세요.');history.go(-1);</script>";
			exit;
		}

    /**
     * ITM_SUPPLIER 테이블에 데이터 삽입 
     */
        $itm_supplier_SQL = "UPDATE ITM_POSITION
                            SET  POS_NAME = '{$POS_NAME}', POS_CODE = '{$POS_CODE}', MOD_DATE= now(), MOD_IDX = '{$REG_IDX}', GRO_IDX = '{$GRO_IDX}'
                            WHERE POS_IDX = $POS_IDX";
        $itm_supplier_query = mysqli_query($dbconn, $itm_supplier_SQL);

        if (!$itm_supplier_query) {
            echo(mysqli_error($dbconn));
        }

        //ITM_SYS_LOG 작성 필요

        echo "<script>alert('직위가 성공적으로 저장되었습니다!');opener.parent.location.reload(); window.close();</script>";

?>