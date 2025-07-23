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
        $DIV_NAME = $_POST['div_name'];
        $DIV_CODE = $_POST['div_code'];
        $DIV_LOC = $_POST['div_loc'];
        $DIV_TEL = $_POST['div_tel'];
        $DIV_YN = $_POST['gener'];
        $SL_NO = $_POST['sl_no'];


    //직원 분류 코드 중복이 되는지 체크 
    $check_DIV_CODE_SQL ="SELECT count(*) FROM ITM_DIVISION WHERE DIV_CODE = $DIV_CODE AND GRO_IDX = $GRO_IDX";
    $check_DIV_CODE_query = mysqli_query($dbconn, $check_DIV_CODE_SQL);
    $check_DIV_CODE_arr = mysqli_fetch_array($check_DIV_CODE_query);
	
    if(!$check_DIV_CODE_arr[0] == ""){
        echo "<script>alert('부서 코드가 중복입니다 다시 입력해 주세요.');history.go(-1);</script>";
    }else{
        $itm_div_SQL = "INSERT INTO ITM_DIVISION
                            (GRO_IDX, DIV_CODE, DIV_NAME, DIV_YN, DIV_LOC, DIV_TEL, REG_DATE, REG_IDX, DEL_YN)
                            VALUES( '{$GRO_IDX}', '{$DIV_CODE}', '{$DIV_NAME}', '{$DIV_YN}', '{$DIV_LOC}', '{$DIV_TEL}', now(), '{$REG_IDX}', 'N' )";
        $itm_div_query = mysqli_query($dbconn, $itm_div_SQL);

        if($itm_div_query===false){
            $error = mysqli_error($dbconn);
            echo('<script>alert("'.$error.'");history.go(-1);</script>');
        }else{
            //ITM_SYS_LOG 작성 필요


        echo "<script>alert('부서가 성공적으로 저장되었습니다!');opener.parent.location.reload();window.close();</script>";
        }

        
    }
    