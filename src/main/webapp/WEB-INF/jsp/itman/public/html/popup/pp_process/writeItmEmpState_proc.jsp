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
        $EMP_ST_NAME = $_POST['emp_st_name'];
        $EMP_ST_CODE = $_POST['emp_st_code'];
        $SL_NOTE = $_POST['sl_note'];
        $SL_NO = $_POST['sl_no'];


    //직원 분류 코드 중복이 되는지 체크 
    $check_EMP_STA_CODE_SQL ="SELECT count(*) FROM ITM_EMP_STATE WHERE EMP_ST_CODE = $EMP_ST_CODE AND GRO_IDX = $GRO_IDX";
    $check_EMP_STA_CODE_query = mysqli_query($dbconn, $check_EMP_STA_CODE_SQL);
    $check_EMP_STA_CODE_arr = mysqli_fetch_array($check_EMP_STA_CODE_query);
    if(!$check_EMP_STA_CODE_arr[0] == ""){
        echo "<script>alert('직원 상태 코드가 중복입니다 다시 입력해 주세요.');history.go(-1);</script>";
    }else{
        $itm_emp_state_SQL = "INSERT INTO ITM_EMP_STATE
                            (GRO_IDX, EMP_ST_CODE, EMP_ST_NAME, SL_NOTE, REG_DATE, REG_IDX, DEL_YN)
                            VALUES( '{$GRO_IDX}', '{$EMP_ST_CODE}', '{$EMP_ST_NAME}', '{$SL_NOTE}', now(), '{$REG_IDX}', 'N' )";
        $itm_emp_state_query = mysqli_query($dbconn, $itm_emp_state_SQL);

        if($itm_emp_state_query===false){
            $error = mysqli_error($dbconn);
            echo('<script>alert("'.$error.'");history.go(-1);</script>');
        }else{
            //ITM_SYS_LOG 작성 필요


        echo "<script>alert('직원 상태가 성공적으로 저장되었습니다!');opener.parent.location.reload();window.close();</script>";
        }

        
    }
    