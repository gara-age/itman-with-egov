<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" language="java" %>
<?php
    	include "../../../_inc/dbconn.php";

        /**
         * 세션 체크
         */
        include "../../../_inc/loginTest.php";
        login_check();

        $MOD_IDX = $_SESSION['userIDX'];
        $ASS_IDX = $_POST['ass_idx'];
        $BUY_DATE = $_POST['buy_date'];
        $SL_NO = $_POST['sl_no'];

        $compare_sql = "SELECT * FROM ITM_ASSET 
                        WHERE ASS_IDX = $ASS_IDX";
        $compare_query =mysqli_query($dbconn, $compare_sql);
        $compare_result = mysqli_fetch_array($compare_query);

        $BEFORE_DATE = $compare_result['BUY_DATE'];
        
        $BUY_DATE_LOG = $BEFORE_DATE.'->'.$BUY_DATE;

        $ASS_NAME = $compare_result['ASS_NAME'];

    /**
     * ITM_ASSET 테이블에 데이터 삽입 
     */
        $itm_asset_SQL = "UPDATE ITM_ASSET
                            SET  BUY_DATE = '{$BUY_DATE}', MOD_DATE= now(), MOD_IDX = $MOD_IDX
                            WHERE ASS_IDX = '{$ASS_IDX}'";

        $itm_asset_query = mysqli_query($dbconn, $itm_asset_SQL);

        if (!$itm_asset_query) {
            echo"<script>alert(".mysqli_error($dbconn).");</script>";
        }

        $IP = $_SERVER['REMOTE_ADDR'];

        if($BUY_DATE != $BEFORE_DATE){
            $log_sql = "INSERT INTO ITM_ASS_LOG(ASS_IDX, ASS_NAME_LOG, AL_TYPE , AL_CAT, AL_CONT, REG_DATE, REG_IDX, REG_IP, AL_NOTE)
            VALUES ('$ASS_IDX', '{$ASS_NAME}', '수정', '최초 구매일', '{$BUY_DATE_LOG}', now(), '{$MOD_IDX}', '{$IP}', '{$SL_NO}')";
            $log_result = mysqli_query($dbconn, $log_sql);
            echo "<script>alert('최초 구매일이 성공적으로 변경되었습니다!');opener.parent.location.reload();window.close();</script>";
        }{
            echo "<script>alert('동일한 일자를 선택하셨습니다. 다시 선택해주세요!');history.go('-1');</script>";
        }

        
?>