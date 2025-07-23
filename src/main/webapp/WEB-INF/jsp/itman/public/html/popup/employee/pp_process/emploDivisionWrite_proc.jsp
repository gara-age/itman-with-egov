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

$DIV_YN = $_POST['gener'];
$DIV_CODE = $_POST['div_code'];
$DIV_NAME = $_POST['div_name'];

$sql = "INSERT INTO ITM_DIVISION 
        (GRO_IDX , DIV_NAME, DIV_CODE, DIV_YN, REG_DATE, REG_IDX, DEL_YN )
        VALUES('{$group}', '{$DIV_NAME}', '{$DIV_CODE}', '{$DIV_YN}', now(), '{$REG_IDX}', 'N')";
    
$query = mysqli_query($dbconn, $sql);

echo "<script>alert('상태가 성공적으로 생성되었습니다!');opener.parent.location.reload();window.close();</script>";



?>