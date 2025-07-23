<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" language="java" %>

<?php
    include('../../_inc/dbconn.php');

    session_start();

    $REG_IDX = $_SESSION['userIDX'];
    $method = $_GET['id'];
    $target = $_GET['target'];
?>

<?php
    if($method == "buy_del") {
        echo("구매처 관리 : 삭제 진행 "); echo($target);

        // $sql = "DELETE FROM ITM_SUPPLIER WHERE SUP_IDX=$target";
        $sql = "UPDATE ITM_SUPPLIER SET DEL_YN = 'Y', DEL_IDX = '{$REG_IDX}', DEL_DATE = NOW() WHERE SUP_IDX=$target";
        mysqli_query($dbconn, $sql);
    }

    if($method == "loc_del") {
        echo("위치 관리 : 삭제 진행 "); echo($target);
        $sql = "UPDATE ITM_LOCATION SET DEL_YN = 'Y', DEL_IDX = '{$REG_IDX}', DEL_DATE = NOW() WHERE LOC_IDX=$target";
        mysqli_query($dbconn, $sql);
    }

    if($method == "pos_del") {
        echo("직위 관리 : 삭제 진행 "); echo($target);
        $sql = "UPDATE ITM_POSITION SET DEL_YN = 'Y', DEL_IDX = '{$REG_IDX}', DEL_DATE = NOW() WHERE POS_IDX=$target";
        mysqli_query($dbconn, $sql);
    }

    if($method == "sta_del") {
        echo("자산 상태 관리 : 삭제 진행 "); echo($target);
        $sql = "UPDATE ITM_STATE SET DEL_YN = 'Y', DEL_IDX = '{$REG_IDX}', DEL_DATE = NOW() WHERE STA_IDX=$target";
        mysqli_query($dbconn, $sql);
    }

    if($method == "empsta_del") {
        echo("직원 상태 관리 : 삭제 진행 "); echo($target);
        $sql = "UPDATE ITM_EMP_STATE SET DEL_YN = 'Y', DEL_IDX = '{$REG_IDX}', DEL_DATE = NOW() WHERE EMP_ST_IDX=$target";
        mysqli_query($dbconn, $sql);
    }

    echo("<script>
        alert('삭제되었습니다');
        opener.parent.location.reload();
        window.close();
    </script>");
?>