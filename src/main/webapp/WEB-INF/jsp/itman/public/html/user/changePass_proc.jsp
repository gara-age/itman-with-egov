<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" language="java" %>

<?php
include("../_inc/dbconn.php");
include('./password.php');

session_start();

$userpw = $_POST['userpw'];
$userpw_ch = $_POST['userpw_ch'];

$find_before_SQL = "SELECT * FROM ITM_MEMBER WHERE MEM_IDX = '{$_SESSION['userIDX']}'";
$find_before_query = mysqli_query($dbconn, $find_before_SQL);
$find_before_result = mysqli_fetch_array($find_before_query);
$db_password = $find_before_result['MEM_PW'];
$userpw_hash = password_hash($_POST["userpw"], PASSWORD_DEFAULT);

if($userpw != $userpw_ch){
     
    echo('<script>alert("비밀번호가 일치하지 않습니다!");history.go(-1);</script>');
}


if($userpw_hash == $db_password){
     
    echo('<script>alert("기존 비밀번호와 같은 비밀번호는 사용 할 수 없습니다.");history.go(-1);</script>');
    
}else{
    $sql = "UPDATE ITM_MEMBER SET MEM_PW='{$userpw_hash}' WHERE MEM_IDX = '{$_SESSION['userIDX']}'";

    $result = mysqli_query($dbconn,$sql);

    if($result) {
        echo "<script>alert('비밀번호 변경이 완료되었습니다.'); location.href='login.jsp'</script>";
    }else{
        echo "<script> alert('변경에 실패했습니다. 잠시 후 다시 시도해주세요.'); 
        //history.back();
        </script>";
    }
}





?>