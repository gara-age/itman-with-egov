<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<?php
  ini_set( 'display_errors', '0' );
  session_start();

    $isLogin = FALSE;
    function login_check(){
        if(!$_SESSION["username"] ) {
            echo "<script> alert('로그인 후 이용해주세요.'); location.href='/html/user/login.php'; </script>";
            exit;
        } else $isLogin = TRUE;
    }
?>

