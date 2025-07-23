<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" language="java" %>

<?php
include '../../_inc/dbconn.php';
include '../../_inc/loginTest.php';
session_start();
login_check();

$userphone 	= $_POST["userphone1"].$_POST["userphone2"].$_POST["userphone3"];

$sql = "
UPDATE 
    ITM_MEMBER 
SET 
    MEM_TEL='".$userphone."', 
    MOD_DATE= NOW()
WHERE 
    MEM_IDX = {$_SESSION['userIDX']}
";

$result = mysqli_query($dbconn,$sql);

if($result) {
    echo "<script>alert('수정이 완료되었습니다.'); self.close(); opener.parent.location.reload();</script>";
}else{
    echo "<script> alert('수정에 실패했습니다. 잠시 후 다시 시도해주세요.'); </script>";
}

?>