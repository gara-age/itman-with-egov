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
        $LOC_IDX = $_POST['loc_idx'];
        $AL_NOTE = $_POST['al_note'];

        $LOC_NAME_AFTER = $_POST['loc_name'];

        $itm_name_sql = "SELECT * FROM ITM_ASSET ia
                         LEFT JOIN ITM_LOCATION il ON ia.LOC_IDX = il.LOC_IDX
                         WHERE ia.ASS_IDX = $ASS_IDX";
        $itm_name_query = mysqli_query($dbconn, $itm_name_sql);
        $itm_name_result = mysqli_fetch_array($itm_name_query);

        $LOC_NAME_BEFORE = $itm_name_result['LOC_NAME'];
        
        $LOC_NAME = $LOC_NAME_BEFORE.'->'.$LOC_NAME_AFTER;

        $ASS_NAME = $itm_name_result['ASS_NAME'];

        //수정 
        $itm_loc_SQL = "UPDATE ITM_ASSET
                        SET LOC_IDX = $LOC_IDX, MOD_DATE= now(), MOD_IDX = $MOD_IDX
                        WHERE ASS_IDX = $ASS_IDX";
        $itm_loc_query = mysqli_query($dbconn, $itm_loc_SQL);

        $cate_sql = "SELECT * FROM ITM_ASSET ia
                     LEFT JOIN ITM_ASSET_CATEGORY iac ON ia.ASS_CAT_IDX = iac.ASS_CAT_IDX
                     LEFT JOIN ITM_LOCATION il ON ia.LOC_IDX = il.LOC_IDX
                     WHERE ia.ASS_IDX = $ASS_IDX ";
        $cate_query = mysqli_query($dbconn, $cate_sql);
        $cate_result = mysqli_fetch_array($cate_query);

        $ASS_CAT_CODE = $cate_result['ASS_CAT_CODE'];
        $LOC_CODE = $cate_result['LOC_CODE'];

        $compare = $ASS_CAT_CODE."-".$LOC_CODE;

        $ulid_sql = "SELECT * FROM ITM_ASSET
                    WHERE ASS_ULID LIKE '%{$compare}%'
                    ORDER BY ASS_ULID DESC LIMIT 1";
        $ulid_query = mysqli_query($dbconn, $ulid_sql);
        $ulid_result = mysqli_fetch_array($ulid_query);

        $ulid_find_result = $ulid_result['ASS_ULID'];
        $ulid_arr = explode("-", $ulid_result['ASS_ULID']);
        
        $ulid_num = sprintf("%04d", (int)($ulid_arr[2]+1));

        $ulid = $compare.'-'.$ulid_num;
        
        $set_ulid_sql = "UPDATE ITM_ASSET
                         SET ASS_ULID = '{$ulid}'
                         WHERE ASS_IDX = '{$ASS_IDX}'";
        $set_ulid_query = mysqli_query($dbconn, $set_ulid_sql);


        //에러 처리
        if (!$itm_loc_query) {
            echo"<script>alert(".mysqli_error($dbconn).");history.go('-1');</script>";
        }

        $IP = $_SERVER['REMOTE_ADDR'];
        
        if($LOC_IDX != $itm_name_result['LOC_IDX'] ){
            $loc_sql3 = "INSERT INTO ITM_ASS_LOG(ASS_IDX, ASS_NAME_LOG, AL_TYPE , AL_CAT, AL_CONT, REG_DATE, REG_IDX, REG_IP, AL_NOTE)
            VALUES ('$ASS_IDX', '{$ASS_NAME}', '수정', '자산 위치', '{$LOC_NAME}', now(), '{$MOD_IDX}', '{$IP}', '{$AL_NOTE}')";

            $loc_result = mysqli_query($dbconn, $loc_sql3);

            echo "<script>alert('자산 위치가 성공적으로 변경되었습니다!');opener.parent.location.reload();window.close();</script>";
        }else{
            echo "<script>alert('동일한 위치를 선택하셨습니다. 다시 선택해주세요!');history.go('-1');</script>";
        }
        

        

        
?>