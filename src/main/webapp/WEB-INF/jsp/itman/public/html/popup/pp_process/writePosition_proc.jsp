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
        $POS_NAME = $_POST['pos_name'];
        $POS_CODE = $_POST['pos_code'];
        $SL_NOTE = $_POST['sl_note'];
        $SL_NO = $_POST['sl_no'];

    /**
     * ITM_STATE 테이블에 데이터 삽입 
     */

    //자산 분류 코드 중복이 되는지 체크 
    $check_POS_CODE_SQL ="SELECT count(*) FROM ITM_POSITION WHERE POS_CODE = $POS_CODE AND GRO_IDX = $GRO_IDX";
    $check_POS_CODE_query = mysqli_query($dbconn, $check_POS_CODE_SQL);
    $check_POS_CODE_arr = mysqli_fetch_array($check_POS_CODE_query);
    if(!$check_POS_CODE_arr[0] == ""){
        echo "<script>alert('직위 코드가 중복입니다 다시 입력해 주세요.');history.go(-1);</script>";
    }else{
        $itm_pos_SQL = "INSERT INTO ITM_POSITION
                            (GRO_IDX, POS_CODE, POS_NAME, SL_NOTE, REG_DATE, REG_IDX, DEL_YN)
                            VALUES( '{$GRO_IDX}', '{$POS_CODE}', '{$POS_NAME}', '{$SL_NOTE}', now(), '{$REG_IDX}', 'N' )";
        $itm_pos_query = mysqli_query($dbconn, $itm_pos_SQL);

        if($itm_pos_query===false){
            $error = mysqli_error($dbconn);
            echo('<script>alert("'.$error.'");history.go(-1);</script>');
        }else{
            //ITM_SYS_LOG 작성 필요


        echo "<script>alert('직위가 성공적으로 저장되었습니다!');opener.parent.location.reload();window.close();</script>";
        }

        
    }
    