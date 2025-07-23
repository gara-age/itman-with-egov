<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" language="java" %>

<?php
    include('../../_inc/dbconn.php');

    session_start();

    $REG_IDX = $_SESSION['userIDX'];
    $method = $_GET['method'];
    $target = $_GET['target'];
    $SL_NOTE = $_GET['SL_NOTE'];

    // echo "그룹 암호 : ";
    // echo $REG_IDX;
    // echo "method : ";
    // echo $method;
    // echo "target : ";
    // echo $target;
    // echo "메모 : ";
    // echo $SL_NOTE;
    // die();
?>

<?php
    if($method == "buy_del") {
        echo("구매처 관리 : 삭제 진행 "); echo($target);
        $sql = "UPDATE ITM_SUPPLIER SET DEL_YN = 'Y', DEL_IDX = '{$REG_IDX}', DEL_DATE = NOW() WHERE SUP_IDX=$target";
        $target = "구매처 삭제";
        mysqli_query($dbconn, $sql);
    }

    if($method == "loc_del") {
        echo("위치 관리 : 삭제 진행 "); echo($target);
        $sql = "UPDATE ITM_LOCATION SET DEL_YN = 'Y', DEL_IDX = '{$REG_IDX}', DEL_DATE = NOW() WHERE LOC_IDX=$target";
        $target = "위치 삭제";
        mysqli_query($dbconn, $sql);
    }

    if($method == "pos_del") {
        echo("직위 관리 : 삭제 진행 "); echo($target);
        $sql = "UPDATE ITM_POSITION SET DEL_YN = 'Y', DEL_IDX = '{$REG_IDX}', DEL_DATE = NOW() WHERE POS_IDX=$target";
        $target = "직위 삭제";
        mysqli_query($dbconn, $sql);
    }

    if($method == "asset_cate_del") {
        echo("자산 분류 관리 : 삭제 진행 "); echo($target);
        $sql = "UPDATE ITM_ASSET_CATEGORY SET DEL_YN = 'Y', DEL_IDX = '{$REG_IDX}', DEL_DATE = NOW() WHERE ASS_CAT_IDX=$target";
        $target = "자산 분류 삭제";
        mysqli_query($dbconn, $sql);
    }

    // 시스템 히스토리에 추가
    $itm_assCate_SQL2 = "INSERT INTO ITM_SYS_LOG(GRO_IDX, SL_TYPE, SL_CAT, REG_DATE, REG_IDX, SL_NOTE)
        VALUES ('{$assCate_result['GRO_IDX']}', '수정', '{$target}', now(), '{$REG_IDX}', '{$SL_NOTE}')";

        $assCate_result = mysqli_query($dbconn, $itm_assCate_SQL2);

    echo("<script>
        alert('삭제되었습니다');
        opener.parent.location.reload();
        window.close();
    </script>");
?>