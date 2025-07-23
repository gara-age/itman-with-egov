<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" language="java" %>
<?php

include "../../_inc/dbconn.php";

/** 세션 체크 */
include "../../_inc/loginTest.php";
login_check();
$GRO_IDX = $_SESSION['group'];

switch ($_GET['which']) {
    case 'cate':
        $ASS_CAT_IDX = $_GET['ass_cat_idx'];

        $sql = "SELECT * FROM ITM_ASSET_CATEGORY WHERE ASS_CAT_IDX = '{$ASS_CAT_IDX}' AND GRO_IDX = '{$GRO_IDX}'";
        $query = mysqli_query($dbconn, $sql);
        $result = mysqli_fetch_array($query);

        $CAT_CODE = $result['ASS_CAT_CODE'];
        $code = $CAT_CODE."-".$_GET['ulid_loc'];

        $find_sql = "SELECT * FROM ITM_ASSET WHERE ASS_ULID LIKE '%{$code}%' AND GRO_IDX = '{$GRO_IDX}' ORDER BY ASS_ULID DESC LIMIT 0 ,1";
        $find_query = mysqli_query($dbconn, $find_sql);
        $find_result = mysqli_fetch_array($find_query);

        if($find_result[0] == ""){
            $find_code = "0000";
        }else{
            $find_code = $find_result['ASS_ULID'];
            $find_code_arr = explode("-", $find_code);
            $find_code = $find_code_arr[2];
        }
        
        echo($result['ASS_CAT_CODE']."*".$find_code);
        break;
    case 'loca':
        $LOC_IDX = $_GET['loc_idx'];

        $sql = "SELECT * FROM ITM_LOCATION WHERE LOC_IDX = '{$LOC_IDX}' AND GRO_IDX = '{$GRO_IDX}'";
        $query = mysqli_query($dbconn, $sql);
        $result =mysqli_fetch_array($query);

        $LOC_CODE = $result['LOC_CODE'];
        $code = $_GET['ulid_cat']."-".$LOC_CODE;

        $find_sql = "SELECT * FROM ITM_ASSET WHERE ASS_ULID LIKE '%{$code}%' AND GRO_IDX = '{$GRO_IDX}' ORDER BY ASS_ULID DESC LIMIT 0 ,1";
        $find_query = mysqli_query($dbconn, $find_sql);
        $find_result = mysqli_fetch_array($find_query);

        if($find_result[0] == ""){
            $find_code = "0000";
        }else{
            $find_code = $find_result['ASS_ULID'];
            $find_code_arr = explode("-", $find_code);
            $find_code = $find_code_arr[2];
        }
        
        echo($result['LOC_CODE']."*".$find_code);
        break;
}

?>