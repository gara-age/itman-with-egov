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
        $ASS_CAT_IDX = $_POST['ASS_CAT_IDX'];
        $ASS_CAT_NAME = $_POST['ASS_CAT_NAME'];
        $ASS_CAT_CODE = $_POST['ASS_CAT_CODE'];
        $SL_NOTE = $_POST['sl_note'];
        $SL_NO = $_POST['sl_no'];

    /**
     * ITM_SUPPLIER 테이블에 데이터 삽입 
     */
        $itm_assCate_SQL = "UPDATE ITM_ASSET_CATEGORY
                            SET  MOD_IDX = '{$REG_IDX}', ASS_CAT_NAME = '{$ASS_CAT_NAME}', ASS_CAT_CODE = '{$ASS_CAT_CODE}', SL_NOTE = '{$SL_NOTE}', MOD_DATE= now(), GRO_IDX = '{$GRO_IDX}'
                            WHERE ASS_CAT_IDX = $ASS_CAT_IDX";
        $itm_assCate_query = mysqli_query($dbconn, $itm_assCate_SQL);

        $assCate_sql = "SELECT * FROM ITM_ASSET_CATEGORY WHERE ASS_CAT_CODE = $ASS_CAT_CODE ";
        $assCate_query = mysqli_query($dbconn, $assCate_sql);
        $assCate_result = mysqli_fetch_array($assCate_query);

        $itm_assCate_SQL2 = "INSERT INTO ITM_SYS_LOG(GRO_IDX, SL_TYPE, SL_CAT, REG_DATE, REG_IDX, SL_NOTE)
        VALUES ('{$assCate_result['GRO_IDX']}', '수정', '자산 분류', now(), '{$REG_IDX}', '{$SL_NOTE}')";

        $assCate_result = mysqli_query($dbconn, $itm_assCate_SQL2);

        if (!$itm_assCate_query) {
            echo(mysqli_error($dbconn));
        }

        echo "<script>alert('자산 분류가 성공적으로 수정되었습니다!');opener.parent.location.reload(); window.close();</script>";

?>