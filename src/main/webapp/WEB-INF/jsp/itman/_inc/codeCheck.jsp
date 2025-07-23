<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<?php
    // 리스트 작성이나 수정시 해당 그룹 내에 중복되는 코드가 있는지 확인하는 로직

    session_start();

    $type = $_SESSION['userIDX'];
    $group1 = $_SESSION['group'];
    echo("<script>alert('$REG_IDX');</script>");

    $checkSql = "SELECT * FROM ITM_POSITION WHERE POS_IDX = $idx";
	$checkQuery = mysqli_query($dbconn, $checkSql);
	$checkRow = (mysqli_fetch_array($checkQuery));


?>