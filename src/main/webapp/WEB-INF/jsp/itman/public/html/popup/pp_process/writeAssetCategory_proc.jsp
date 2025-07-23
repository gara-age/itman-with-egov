<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" language="java" %>
<?php
    	include "../../_inc/dbconn.php";

        /**
         * 세션 체크
         */
        include "../../_inc/loginTest.php";
        login_check();

        $GROUP = $_SESSION['group'];
        $REG_IDX = $_SESSION['userIDX'];
        $ASS_CAT_CODE = $_POST['ass_cat_code'];
        $ASS_CAT_NAME = $_POST['ass_cat_name'];
        $SL_NO = $_POST['sl_no'];

    /**
     * ITM_ASSET_CATEGORY 테이블에 데이터 삽입 
     */

    //자산 분류 코드 중복이 되는지 체크 
    $check_ass_cat_code_SQL ="SELECT * FROM ITM_ASSET_CATEGORY WHERE ASS_CAT_CODE = $ASS_CAT_CODE AND GRO_IDX = $group";
    $check_ass_cat_code_query = mysqli_query($dbconn, $check_ass_cat_code_SQL);
    $check_ass_cat_code_arr = mysqli_fetch_array($check_ass_cat_code_query);
    if(!$check_ass_cat_code_arr[0] == ""){
        echo "<script>alert('자산 분류 코드가 중복입니다 다시 입력해 주세요.');</script>";
    }else{
        
        $asset_category_SQL = "INSERT INTO ITM_ASSET_CATEGORY
                            (GRO_IDX, ASS_CAT_CODE, ASS_CAT_NAME, REG_DATE, REG_IDX, DEL_YN)
                            VALUES('{$GROUP}', '{$ASS_CAT_CODE}', '{$ASS_CAT_NAME}', now(), '{$REG_IDX}', 'N')";
        $asset_category_query = mysqli_query($dbconn, $asset_category_SQL);

        //ITM_SYS_LOG 작성 


        echo "<script>alert('자산 분류가 성공적으로 저장되었습니다!');opener.parent.location.reload();window.close();</script>";
    }