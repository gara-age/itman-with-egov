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
        $DIV_IDX = $_POST['div_idx'];
        $DIV_NAME = $_POST['div_name'];
        $DIV_CODE = $_POST['div_code'];
        $DIV_LOC = $_POST['div_loc'];
        $DIV_TEL = $_POST['div_tel'];
        $DIV_YN = $_POST['radio'];
        $SL_NO = $_POST['sl_no'];

        echo($REG_IDX);
        echo(" | ");
        echo($DIV_IDX);
        echo(" | ");
        echo($DIV_NAME);
        echo(" | ");
        echo($DIV_CODE);
        echo(" | ");
        echo($DIV_LOC);
        echo(" | ");
        echo($DIV_TEL);
        echo(" | ");
        echo($GRO_IDX);
        echo(" | ");
		
		 //직원 분류 코드 중복이 되는지 체크 
		$check_DIV_CODE_SQL ="SELECT count(*) FROM ITM_DIVISION WHERE DIV_CODE = $DIV_CODE AND GRO_IDX = $GRO_IDX AND DIV_IDX != $DIV_IDX";
		$check_DIV_CODE_query = mysqli_query($dbconn, $check_DIV_CODE_SQL);
		$check_DIV_CODE_arr = mysqli_fetch_array($check_DIV_CODE_query);
		
		if(!$check_DIV_CODE_arr[0] == ""){
			echo "<script>alert('부서 코드가 중복입니다 다시 입력해 주세요.');history.go(-1);</script>";
			exit;
		}

        $itm_div_SQL = "UPDATE ITM_DIVISION
                            SET  MOD_IDX = '{$REG_IDX}', DIV_NAME = '{$DIV_NAME}', DIV_YN = '{$DIV_YN}', DIV_CODE = '{$DIV_CODE}', DIV_LOC = '{$DIV_LOC}', DIV_TEL = '{$DIV_TEL}', MOD_DATE= now(), GRO_IDX = '{$GRO_IDX}'
                            WHERE DIV_IDX = $DIV_IDX";
        $itm_div_query = mysqli_query($dbconn, $itm_div_SQL);

        if (!$itm_div_query) {
            echo(mysqli_error($dbconn));
        }

        //ITM_SYS_LOG 작성 필요

        echo "<script>alert('부서가 성공적으로 수정되었습니다!');opener.parent.location.reload(); window.close();</script>";

?>