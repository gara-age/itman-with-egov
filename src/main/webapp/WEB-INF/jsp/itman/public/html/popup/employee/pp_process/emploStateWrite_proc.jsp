<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" language="java" %>
<?php

include "../../../_inc/dbconn.php";
		
/**
 * 세션 체크
 */
include "../../../_inc/loginTest.php";
login_check();

$group = $_SESSION['group'];
$REG_IDX = $_SESSION['userIDX'];

$EMP_ST_CODE = $_POST['emp_st_code'];
$EMP_ST_NAME = $_POST['emp_st_name'];

$sql = "INSERT INTO ITM_EMP_STATE 
        (GRO_IDX , EMP_ST_NAME, EMP_ST_CODE, REG_DATE, REG_IDX, DEL_YN )
        VALUES('{$group}', '{$EMP_ST_NAME}', '{$EMP_ST_CODE}', now(), '{$REG_IDX}', 'N')";
    
$query = mysqli_query($dbconn, $sql);

echo "<script>alert('상태가 성공적으로 생성되었습니다!');opener.parent.location.reload();window.close();</script>";



?>