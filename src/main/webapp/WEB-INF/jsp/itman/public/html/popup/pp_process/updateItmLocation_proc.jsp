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
        $LOC_IDX = $_POST['loc_idx'];
        $LOC_NAME = $_POST['loc_name'];
        $LOC_CODE = $_POST['loc_code'];
        $SL_NOTE = $_POST['sl_note'];
        $SL_NO = $_POST['sl_no'];

        echo($REG_IDX);
        echo(" | ");
        echo($LOC_IDX);
        echo(" | ");
        echo($LOC_NAME);
        echo(" | ");
        echo($LOC_CODE);
        echo(" | ");
        echo($SL_NOTE);
        echo(" | ");
        echo($GRO_IDX);
        echo(" | ");

		$check_LOC_CODE_SQL ="SELECT * FROM ITM_LOCATION WHERE LOC_CODE = $LOC_CODE AND GRO_IDX = $GRO_IDX AND LOC_IDX != $LOC_IDX";
		$check_LOC_CODE_query = mysqli_query($dbconn, $check_LOC_CODE_SQL);
		$check_LOC_CODE_result =mysqli_num_rows($check_LOC_CODE_query);
		
		if(!$check_LOC_CODE_result == 0){
			echo "<script>alert('위치 코드가 중복입니다 다시 입력해 주세요.');history.go(-1)</script>";
			exit;
		}

    /**
     * ITM_SUPPLIER 테이블에 데이터 삽입 
     */
        $itm_location_SQL = "UPDATE ITM_LOCATION
                            SET  MOD_IDX = '{$REG_IDX}', LOC_NAME = '{$LOC_NAME}', LOC_CODE = '{$LOC_CODE}', SL_NOTE = '{$SL_NOTE}', MOD_DATE= now(), GRO_IDX = '{$GRO_IDX}'
                            WHERE LOC_IDX = $LOC_IDX";
        $itm_location_query = mysqli_query($dbconn, $itm_location_SQL);

        $loc_sql = "SELECT * FROM ITM_LOCATION WHERE LOC_CODE = $LOC_CODE ";
        $loc_query = mysqli_query($dbconn, $loc_sql);
        $lco_result = mysqli_fetch_array($loc_query);

         $itm_location_SQL2 = "INSERT INTO ITM_SYS_LOG(GRO_IDX, SL_TYPE, SL_CAT, REG_DATE, REG_IDX, SL_NOTE)
         VALUES ('{$lco_result['GRO_IDX']}', '수정', '구매처', now(), '{$REG_IDX}', '{$SL_NO}')";

        $loc_result = mysqli_query($dbconn, $itm_location_SQL2);

        if (!$itm_location_query) {
            echo(mysqli_error($dbconn));
        }

        echo "<script>alert('위치가 성공적으로 수정되었습니다!');opener.parent.location.reload(); window.close();</script>";

?>