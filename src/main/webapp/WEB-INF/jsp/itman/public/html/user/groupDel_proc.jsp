<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" language="java" %>

<?php
    ini_set('display_errors', '0');

    include('../_inc/dbconn.php');

    session_start();

    $group = $_SESSION['group'];
    $REG_IDX = $_SESSION['userIDX'];
    $method = $_POST['id'];
    $target = $_POST['target'];
    $password = $_POST['password'];
?>

<?php
    $compare_sql = "SELECT * FROM ITM_MEMBER WHERE MEM_IDX = $REG_IDX";
    $compare_query = mysqli_query($dbconn, $compare_sql);
    $compare_result = mysqli_fetch_array($compare_query);
    $db_password = $compare_result['MEM_PW'];

    if(!password_verify($password, $db_password)){
     
        echo('<script>alert("비밀번호가 일치하지 않습니다!");history.go(-1);</script>');
        
    }else{
        if($method == "gro_del") {
            echo("그룹 : 삭제 진행 "); echo($target);
            $sql = "UPDATE ITM_GROUP SET DEL_YN = 'Y', DEL_IDX = '{$REG_IDX}', DEL_DATE = NOW() WHERE GRO_IDX=$target";
            mysqli_query($dbconn, $sql);
        }
        echo("<script>
            alert('삭제되었습니다');
            opener.parent.location.reload();
            window.close();
        </script>");
    }



?>