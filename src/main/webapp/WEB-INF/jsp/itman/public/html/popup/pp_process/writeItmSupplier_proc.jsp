<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" language="java" %>
<?php
    	include "../../_inc/dbconn.php";

        include "../../_inc/loginTest.php";
        login_check();

        $GRO_IDX = $_SESSION['group'];
        $REG_IDX = $_SESSION['userIDX'];
        $SUP_NAME = $_POST['sup_name'];
        $SUP_BNUM = $_POST['sup_bnum'];
        $SUP_MAIL = $_POST['sup_mail'];
        $SUP_TEL = $_POST['sup_tel'];
        $SL_NO = $_POST['sl_no'];

        echo $GRO_IDX."   ";
        echo $REG_IDX."   ";
        echo $SUP_NAME."   ";
        echo $SUP_BNUM."   ";
        echo $SUP_MAIL."   ";
        echo $SUP_TEL."   ";
        echo $SL_NO."   ";

    /**
     * ITM_SUPATION 테이블에 데이터 삽입 
     */

    // 구매처 코드 중복이 되는지 체크 
    $check_SUP_CODE_SQL ="SELECT * FROM ITM_SUPPLIER WHERE SUP_CODE = $SUP_CODE AND GRO_IDX = $GRO_IDX";
    $check_SUP_CODE_query = mysqli_query($dbconn, $check_SUP_CODE_SQL);
    $check_SUP_CODE_result =mysqli_num_rows($check_SUP_CODE_query);
    
    if(!$check_SUP_CODE_result == 0 ){
        echo "<script>alert('구매처 코드가 중복입니다 다시 입력해 주세요.');history.go(-1);</script>";
    }else{
        $itm_supplier_SQL = "INSERT INTO ITM_SUPPLIER
                            (GRO_IDX, SUP_NAME, SUP_BNUM, SUP_MAIL, SUP_TEL, REG_DATE, REG_IDX, DEL_YN)
                            VALUES('{$GRO_IDX}', '{$SUP_NAME}', '{$SUP_BNUM}', '{$SUP_MAIL}', '{$SUP_TEL}', NOW(), '{$REG_IDX}', 'N')";

        $result = mysqli_query($dbconn, $itm_supplier_SQL);

        $sup_sql = "SELECT * FROM ITM_SUPPLIER WHERE SUP_CODE = $SUP_CODE ";
        $sup_query = mysqli_query($dbconn, $sup_sql);
        $sup_result = mysqli_fetch_array($sup_query);

        $itm_supplier_SQL2 = "INSERT INTO ITM_SYS_LOG(GRO_IDX, SL_TYPE, SL_CAT, REG_DATE, REG_IDX, SL_NOTE)
        VALUES ('{$sup_result['GRO_IDX']}', '생성', '구매처', NOW(), '{$REG_IDX}', '{$SL_NO}')";

        $sup_result = mysqli_query($dbconn, $itm_supplier_SQL2);

        if($result === false) {
            $error = mysqli_error($dbconn);
            echo('<script>alert("'.$error.'");history.go(-1);</script>');
        }else{
            echo "<script>alert('구매처가 성공적으로 저장되었습니다!');opener.parent.location.reload();window.close();</script>";
        }
    
        }
        ?>
