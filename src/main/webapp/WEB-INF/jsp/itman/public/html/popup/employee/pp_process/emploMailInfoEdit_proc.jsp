<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" language="java" %>
<?php
    	include "../../../_inc/dbconn.php";

        /** 세션 체크 */
        include "../../../_inc/loginTest.php";
        login_check();

        $MOD_IDX = $_SESSION['userIDX'];
        $EMP_IDX = $_POST['emp_idx'];
        $EMP_MAIL = $_POST['emp_mail'];

        /** 로직 */
        $itm_SQL = "UPDATE ITM_EMPLOYE
                            SET  EMP_MAIL = '{$EMP_MAIL}'
                            WHERE EMP_IDX = '{$EMP_IDX}'";
        $itm_query = mysqli_query($dbconn, $itm_SQL);

        if (!$itm_query) {
            echo"<script>alert(".mysqli_error($dbconn).");</script>";
        }

        //ITM_SYS_LOG 작성 필요

        echo "<script>alert('직원 이메일이 성공적으로 변경되었습니다!');opener.parent.location.reload();window.close();</script>";
?>