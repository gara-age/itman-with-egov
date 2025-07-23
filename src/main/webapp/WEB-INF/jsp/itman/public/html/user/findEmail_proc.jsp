<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" language="java" %>

<?php
$username 	= $_POST["username"];
$userphone 	= $_POST["userphone1"].$_POST["userphone2"].$_POST["userphone3"];

include("../_inc/dbconn.php");

$sql = "SELECT MEM_MAIL FROM ITM_MEMBER WHERE MEM_NAME = '$username' AND MEM_TEL = '$userphone' AND DEL_YN = 'N'";

$result = mysqli_query($dbconn,$sql);

if(mysqli_num_rows($result) === 1){
    $row = mysqli_fetch_array($result);
    $useremail = $row['MEM_MAIL'];
}else{
    echo "<script> alert('입력한 정보의 회원이 존재하지 않습니다.'); history.back();</script>";
}
?>

<!doctype html>
<html lang="ko">
    <body>
        <form action="compEmail.php" name="frm" id="frm" method="post">
            <input type="hidden" name="useremail" value=<?=$useremail;?>>
        </form>
    </body>
    <script language="javascript">
    document.frm.submit();
    </script>
</html>