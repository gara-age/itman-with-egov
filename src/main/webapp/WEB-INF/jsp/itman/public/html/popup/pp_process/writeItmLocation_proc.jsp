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
        $LOC_NAME = $_POST['loc_name'];
        $LOC_CODE = $_POST['loc_code'];
        $SL_NOTE = $_POST['sl_note'];
        $SL_NO = $_POST['sl_no'];

    /**
     * ITM_LOCATION 테이블에 데이터 삽입 
     */

    /**
     * 자산 위치 코드 중복이 되는지 체크 
     */
    $check_LOC_CODE_SQL ="SELECT * FROM ITM_LOCATION WHERE LOC_CODE = $LOC_CODE AND GRO_IDX = $GRO_IDX";
    $check_LOC_CODE_query = mysqli_query($dbconn, $check_LOC_CODE_SQL);
    $check_LOC_CODE_result =mysqli_num_rows($check_LOC_CODE_query);
    
    if(!$check_LOC_CODE_result == 0){
        echo "<script>alert('위치 코드가 중복입니다 다시 입력해 주세요.');history.go(-1)</script>";
    }else{
        $itm_location_SQL = "INSERT INTO ITM_LOCATION
                            (GRO_IDX, LOC_CODE, LOC_NAME, SL_NOTE, REG_DATE, REG_IDX, DEL_YN)
                            VALUES('{$GRO_IDX}', '{$LOC_CODE}', '{$LOC_NAME}', '{$SL_NOTE}', now(), '{$REG_IDX}', 'N' )";
        $result = mysqli_query($dbconn, $itm_location_SQL);

        $loc_sql = "SELECT * FROM ITM_LOCATION WHERE LOC_CODE = $LOC_CODE ";
        $loc_query = mysqli_query($dbconn, $loc_sql);
        $lco_result = mysqli_fetch_array($loc_query);

         $itm_location_SQL2 = "INSERT INTO ITM_SYS_LOG(GRO_IDX, SL_TYPE, SL_CAT, REG_DATE, REG_IDX, SL_NOTE)
         VALUES ('{$lco_result['GRO_IDX']}', '생성', '구매처', now(), '{$REG_IDX}', '{$SL_NO}')";

        $lco_result = mysqli_query($dbconn, $itm_location_SQL2);

        if(!$itm_location_query){
            echo("쿼리 오류 발생".mysqli_error($dbconn));
        }

        if($loc_query === false) {
            $error = mysqli_error($dbconn);
            echo('<script>alert("'.$error.'");history.go(-1);</script>');
        }else{
            echo "<script>alert('위치가 성공적으로 저장되었습니다!');opener.parent.location.reload();window.close();</script>";
        }
    
        }
        ?>