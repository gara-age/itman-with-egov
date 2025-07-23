<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" language="java" %>
<?php
    	include "../../../_inc/dbconn.php";

        /**
         * 세션 체크
         */
        include "../../../_inc/loginTest.php";
        login_check();

        $REG_IDX = $_SESSION['userIDX'];
        $ASS_IDX =$_POST['ass_idx'];
        $SUP_IDX = $_POST['sup_idx'];
        $SUP_CODE = $_POST['sup_code'];
        $SUP_TEL = $_POST['sup_tel'];
        $GRO_IDX = $_POST['gro_idx'];
        $AL_NOTE = $_POST['sl_no'];

        $SUP_NAME_AFTER = $_POST['sup_name'];

        $itm_name_sql = "SELECT * FROM ITM_ASSET ia
                         LEFT JOIN ITM_SUPPLIER its ON ia.SUP_IDX = its.SUP_IDX
                         WHERE ia.ASS_IDX = $ASS_IDX";
        $itm_name_query = mysqli_query($dbconn, $itm_name_sql);
        $itm_name_result = mysqli_fetch_array($itm_name_query);

        $SUP_NAME_BEFORE = $itm_name_result['SUP_NAME'];
        
        $SUP_NAME = $SUP_NAME_BEFORE.'->'.$SUP_NAME_AFTER;
       
        $ASS_NAME = $itm_name_result['ASS_NAME'];


        //수정
        $itm_asset_SQL = "UPDATE ITM_ASSET
                          SET MOD_DATE= now(), MOD_IDX = '{$REG_IDX}', SUP_IDX = '{$SUP_IDX}'
                          WHERE ASS_IDX = '{$ASS_IDX}'";
        $itm_asset_query = mysqli_query($dbconn, $itm_asset_SQL);

        if (!$itm_supplier_query) {
            echo(mysqli_error($dbconn));
        }

        $IP = $_SERVER['REMOTE_ADDR'];
        
        if($SUP_IDX != $itm_name_result['SUP_IDX'] ){
            $sup_sql3 = "INSERT INTO ITM_ASS_LOG(ASS_IDX, ASS_NAME_LOG,AL_TYPE , AL_CAT, AL_CONT, REG_DATE, REG_IDX, REG_IP, AL_NOTE)
            VALUES ('$ASS_IDX', '{$ASS_NAME}', '수정', '자산 구매처', '{$SUP_NAME}', now(), '{$REG_IDX}', '{$IP}', '{$AL_NOTE}')";

            $sup_result = mysqli_query($dbconn, $sup_sql3);

            echo "<script>alert('자산 구매처 정보가 성공적으로 변경되었습니다!');opener.parent.location.reload();window.close();</script>";
        }else{
            echo "<script>alert('동일한 구매처를 선택하셨습니다. 다시 선택해주세요!');history.go('-1');</script>";
        }

       

?>