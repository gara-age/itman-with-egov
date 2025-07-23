<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" language="java" %>
<?php
	include "../../_inc/dbconn.php";

    /** 세션 체크 */
    include "../../_inc/loginTest.php";
    login_check();

    $group = $_SESSION['group'];
    $EMP_NUM = $_POST['EMP_NUM'];
    $EMP_NAME = $_POST['EMP_NAME'];
    $EMP_MAIL = $_POST['EMP_MAIL'];
    $EMP_TEL = $_POST['EMP_TEL'];
    $DIV_IDX = $_POST['DIV_IDX'];
    $POS_IDX = $_POST['POS_IDX'];
    $EMP_ST_IDX = $_POST['EMP_ST_IDX'];
    $REG_IDX = $_SESSION['userIDX'];

    $sql = "INSERT INTO ITM_EMPLOYE
    (GRO_IDX, EMP_NUM, EMP_NAME, EMP_MAIL, EMP_TEL, DIV_IDX, POS_IDX, EMP_ST_IDX, DEL_YN, REG_IDX, REG_DATE )
    VALUES(
        $group,
        '$EMP_NUM',
        '$EMP_NAME',
        '$EMP_MAIL',
        '$EMP_TEL',
        $DIV_IDX,
        $POS_IDX,
        $EMP_ST_IDX,
        'N',
        $REG_IDX,
        now()
    )
    ";
	
    $result = mysqli_query($dbconn, $sql);

    if($result == false){
        echo "<script>alert('저장에 실패하였습니다');</script>";
    }else{
        echo "<script>alert('저장에 성공했습니다!');</script>";

    }

    

?>
    <?php
     header("Location: ../emploList.php");
?>