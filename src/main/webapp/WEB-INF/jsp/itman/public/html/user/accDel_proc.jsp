<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" language="java" %>

<?php
    include '../_inc/dbconn.php';
    include '../_inc/loginTest.php';
    include './password.php';

    session_start();
    login_check();

    if(isset($_POST['userpw'])){

            $sql = "SELECT * FROM ITM_MEMBER WHERE MEM_IDX = {$_SESSION['userIDX']}";
            $result = mysqli_query($dbconn, $sql);

            if(mysqli_num_rows($result) === 1){
                $row = mysqli_fetch_assoc($result);
                
                if(password_verify($_POST['userpw'],$row['MEM_PW'])){
                    $accDel_sql = "
                    UPDATE 
                        ITM_MEMBER 
                    SET 
                        DEL_YN = 'Y'
                    WHERE 
                        MEM_IDX = {$_SESSION['userIDX']} 
                    ";
                    $accDel_result = mysqli_query($dbconn,$accDel_sql);
                    if($accDel_result){
                        echo "<script> alert('계정 탈퇴되었습니다.'); location.href='logout_proc.php' </script>";
                    }else{
                        echo "<script> alert('계정 탈퇴에 실패했습니다. 잠시 후 다시 시도해주세요.'); history.back();</script>";
                    }

                } else {
                    echo "<script> alert('패스워드가 일치하지 않습니다.'); history.back();</script>";
                }
        
            } else {
                echo "<script> alert('계정 탈퇴에 실패했습니다. 잠시 후 다시 시도해주세요.세션없음'); 
                //history.back();
                </script>";
            }
    } else {
        echo "<script> alert('계정 탈퇴에 실패했습니다. 잠시 후 다시 시도해주세요.'); history.back();</script>";
    }
    ?>

