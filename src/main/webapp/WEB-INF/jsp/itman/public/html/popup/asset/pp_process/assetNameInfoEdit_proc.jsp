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
        $ASS_NAME = $_POST['ass_name'];
        $ASS_ULID = $_POST['ass_ulid'];
        $AL_NOTE = $_POST['al_note'];

        
        $itm_name_sql = "SELECT ASS_NAME FROM ITM_ASSET
                        WHERE ASS_IDX = $ASS_IDX";
        $itm_name_query = mysqli_query($dbconn, $itm_name_sql);
        $itm_name_result = mysqli_fetch_array($itm_name_query);

        $ASS_NAME_BEFORE = $itm_name_result['ASS_NAME'];

        $ASS_NAME_LOG = $ASS_NAME_BEFORE.'->'.$ASS_NAME;


        
        //수정 
        $itm_asset_SQL = "UPDATE ITM_ASSET
                            SET  ASS_NAME = '{$ASS_NAME}', MOD_DATE= now(), MOD_IDX = $MOD_IDX
                            WHERE ASS_IDX = '{$ASS_IDX}'";
        $itm_asset_query = mysqli_query($dbconn, $itm_asset_SQL);

        $asset_sql = "SELECT * FROM ITM_ASSET WHERE ASS_ULID = $ASS_ULID ";
        $asset_query = mysqli_query($dbconn, $asset_sql);
        $asset_result = mysqli_fetch_array($asset_query);
  
        if (!$itm_asset_query) {
            echo(mysqli_error($dbconn));
        }

        //ITM_SYS_LOG 작성 필요
        $IP = $_SERVER['REMOTE_ADDR'];
        
        if($ASS_NAME != $ASS_NAME_BEFORE){
            $loc_sql3 = "INSERT INTO ITM_ASS_LOG(ASS_IDX, ASS_NAME_LOG, AL_TYPE , AL_CAT, AL_CONT, REG_DATE, REG_IDX, REG_IP, AL_NOTE)
            VALUES ('$ASS_IDX', '{$ASS_NAME}', '수정', '자산 이름', '{$ASS_NAME_LOG}', now(), '{$MOD_IDX}', '{$IP}', '{$AL_NOTE}')";

            $loc_result = mysqli_query($dbconn, $loc_sql3);
            echo "<script>alert('자산명이 성공적으로 수정되었습니다!');opener.parent.location.reload(); window.close();</script>";
        }else{
            echo "<script>alert('동일한 위치를 입력하셨습니다. 다시 선택해주세요!');history.go('-1');</script>";
        }

        



        
?>