<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" language="java" %>

<?php
    include('../_inc/dbconn.php');
    include('./password.php');

    session_start();

    if(isset($_POST['useremail']) && isset($_POST['userpw'])){

            $useremail = mysqli_real_escape_string($dbconn, $_POST['useremail']);
            $userpw = mysqli_real_escape_string($dbconn, $_POST['userpw']);
        
            $sql = "SELECT * FROM ITM_MEMBER WHERE MEM_MAIL = '$useremail' AND DEL_YN = 'N'";
            $result = mysqli_query($dbconn,$sql);
    
    
            if(mysqli_num_rows($result) === 1){
                $row = mysqli_fetch_assoc($result);
                
                if(password_verify($userpw,$row['MEM_PW'])){
                    $_SESSION['useremail'] = $row['MEM_MAIL'];
                    $_SESSION['username'] = $row['MEM_NAME'];
                    $_SESSION['userIDX'] = $row['MEM_IDX'];
                    echo header("location:../index.php");
                } else {
                    echo "<script> alert('패스워드가 일치하지 않습니다.'); history.back();</script>";
                }
        
            } else {
                echo "<script> alert('아이디가 일치하지 않습니다.'); history.back();</script>";
            }
    } else {
        echo "<script> alert('로그인 실패했습니다. 잠시 후 다시 시도해주세요.'); history.back();</script>";
    }
    ?>

