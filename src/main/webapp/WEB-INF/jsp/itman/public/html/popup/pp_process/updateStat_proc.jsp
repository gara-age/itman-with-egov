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
        $STA_IDX = $_POST['sta_idx'];
        $STA_NAME = $_POST['sta_name'];
        $STA_CODE = $_POST['sta_code'];
        $STA_NOTE = $_POST['sta_note'];
        $SL_NO = $_POST['sl_no'];

        echo($REG_IDX);
        echo(" | ");
        echo($STA_IDX);
        echo(" | ");
        echo($STA_NAME);
        echo(" | ");
        echo($STA_CODE);
        echo(" | ");
        echo($STA_NOTE);
        echo(" | ");
        echo($GRO_IDX);
        echo(" | ");
		
		//자산 분류 코드 중복이 되는지 체크 
		$check_STA_CODE_SQL ="SELECT count(*) FROM ITM_STATE WHERE STA_CODE = $STA_CODE AND GRO_IDX = $GRO_IDX AND STA_IDX != $STA_IDX";
		$check_STA_CODE_query = mysqli_query($dbconn, $check_STA_CODE_SQL);
		$check_STA_CODE_arr = mysqli_fetch_array($check_STA_CODE_query);
		if(!$check_STA_CODE_arr[0] == ""){
			echo "<script>alert('자산 상태 코드가 중복입니다 다시 입력해 주세요.');history.go(-1);</script>";
			exit;
		}

        $itm_stat_SQL = "UPDATE ITM_STATE
                            SET  MOD_IDX = '{$REG_IDX}', STA_NAME = '{$STA_NAME}', STA_CODE = '{$STA_CODE}', STA_NOTE = '{$STA_NOTE}', MOD_DATE= now(), GRO_IDX = '{$GRO_IDX}'
                            WHERE STA_IDX = $STA_IDX";
        $itm_stat_query = mysqli_query($dbconn, $itm_stat_SQL);

        if (!$itm_stat_query) {
            echo(mysqli_error($dbconn));
        }

        //ITM_SYS_LOG 작성 필요

        echo "<script>alert('자산 상태가 성공적으로 수정되었습니다!');opener.parent.location.reload(); window.close();</script>";

?>