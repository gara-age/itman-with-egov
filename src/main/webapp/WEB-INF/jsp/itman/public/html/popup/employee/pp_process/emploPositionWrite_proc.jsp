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

$POS_CODE = $_POST['pos_code'];
$POS_NAME = $_POST['pos_name'];

$sql = "INSERT INTO ITM_POSITION 
        (GRO_IDX , POS_NAME, POS_CODE, REG_DATE, REG_IDX, DEL_YN )
        VALUES('{$group}', '{$POS_NAME}', '{$POS_CODE}', now(), '{$REG_IDX}', 'N')";
    
$query = mysqli_query($dbconn, $sql);

echo "<script>alert('직위가 성공적으로 생성되었습니다!');opener.parent.location.reload();window.close();</script>";



?>