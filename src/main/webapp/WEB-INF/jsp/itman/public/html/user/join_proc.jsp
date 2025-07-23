<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" language="java" %>

<!doctype html>
<html lang="ko">
    <body>
        <form action="join03.php" name="frm" id="frm" method="post">
            <input type="hidden" name="username" value=<?=$_POST['username'];?>>
        </form>
    </body>
    <script language="javascript">
    document.frm.submit();
    </script>
</html>

<?php

include("../_inc/dbconn.php");
include('./password.php');

$hashed = password_hash($_POST["userpw"], PASSWORD_DEFAULT);

$sql = "
INSERT INTO ITM_MEMBER
(MEM_NAME, MEM_MAIL, MEM_PW, MEM_TEL, REG_DATE)
VALUES(
    '{$_POST['username']}',
    '{$_POST['useremail']}',
    '$hashed',
    '{$_POST['userphone']}',
    NOW()
)";

$result = mysqli_query($dbconn,$sql);


if($result) {
    echo "<script>location.href='join03.php'</script>";
}else{
    echo "<script> alert('가입에 실패했습니다. 잠시 후 다시 시도해주세요.'); history.back();</script>";
}

?>