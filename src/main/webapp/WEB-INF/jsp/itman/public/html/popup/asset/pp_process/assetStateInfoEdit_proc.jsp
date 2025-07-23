<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" language="java" %>
<?php
    	include "../../../_inc/dbconn.php";

        /**
         * 세션 체크
         */
        include "../../../_inc/loginTest.php";
        login_check();

        $MOD_IDX = $_SESSION['userIDX'];
        $STA_IDX = $_POST['sta_idx'];
        $AL_NOTE = $_POST['al_note'];
        $ASS_IDX = $_POST['ass_idx'];

        $STA_NAME_AFTER = $_POST['sta_name'];
        
        $itm_name_sql = "SELECT * FROM ITM_ASSET ia
        LEFT JOIN ITM_STATE its ON ia.STA_IDX = its.STA_IDX 
        WHERE ia.ASS_IDX = $ASS_IDX";
        
        $itm_name_query = mysqli_query($dbconn, $itm_name_sql);
        $itm_name_result = mysqli_fetch_array($itm_name_query);

        $STA_NAME_BEFORE = $itm_name_result['STA_NAME'];

        $STA_NAME = $STA_NAME_BEFORE.'->'.$STA_NAME_AFTER;

        $ASS_NAME = $itm_name_result['ASS_NAME'];



        //수정 
        $itm_state_SQL = "UPDATE ITM_ASSET
                            SET STA_IDX = $STA_IDX, MOD_DATE= now(), MOD_IDX = $MOD_IDX
                            WHERE ASS_IDX = $ASS_IDX";

        $itm_state_query = mysqli_query($dbconn, $itm_state_SQL);

        //에러 처리
        if (!$itm_state_query) {
            echo"<script>alert(".mysqli_error($dbconn).");history.go('-1');</script>";
        }

        //ITM_SYS_LOG 작성 필요
        $IP = $_SERVER['REMOTE_ADDR'];

        if($STA_IDX != $itm_name_result['STA_IDX']){
            $loc_sql3 = "INSERT INTO ITM_ASS_LOG(ASS_IDX, ASS_NAME_LOG, AL_TYPE , AL_CAT, AL_CONT, REG_DATE, REG_IDX, REG_IP, AL_NOTE)
            VALUES ('$ASS_IDX', '{$ASS_NAME}', '수정', '자산 상태', '{$STA_NAME}', now(), '{$MOD_IDX}', '{$IP}', '{$AL_NOTE}')";
    
            $loc_result = mysqli_query($dbconn, $loc_sql3);
            echo "<script>alert('자산 상태가 성공적으로 변경되었습니다!');opener.parent.location.reload();window.close();</script>";
        }else{
            echo "<script>alert('동일한 상태를 선택하셨습니다. 다시 선택해주세요!');history.go('-1');</script>";
        }
?>