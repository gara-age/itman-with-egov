<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" language="java" %>

<?php
    session_start();
    $_SESSION['group'] = $_GET['group'];
    $PATH = $_GET['id'];
    
    // id 별 경로
    // 0 대시보드
    // 1 자산 관리
    // 2 직원 관리
    // 3 부서 관리
    // 4 직위 관리
    // 5 구매처 관리
    // 6 위치 관리

    if ($PATH == 0) {
        echo "<script>location.replace('ingroup/dashboard.jsp');</script>";
    } 
    else if ($PATH == 1) {
        echo "<script>location.replace('ingroup/assetsList.jsp');</script>";
    } 
    else if ($PATH == 2) {
        echo "<script>location.replace('ingroup/emploList.jsp');</script>";
    }
    else if ($PATH == 3) {
        echo "<script>location.replace('ingroup/departList.jsp');</script>";
    }
    else if ($PATH == 4) {
        echo "<script>location.replace('ingroup/spotList.jsp');</script>";
    }
    else if ($PATH == 5) {
        echo "<script>location.replace('ingroup/buyList.jsp');</script>";
    }
    else if ($PATH == 6) {
        echo "<script>location.replace('ingroup/locList.jsp');</script>";
    }
?>