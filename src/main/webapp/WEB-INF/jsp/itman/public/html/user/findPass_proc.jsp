<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" language="java" %>

<?php
$username 	= $_POST["username"];
$useremail 	= $_POST["useremail"];
$userphone 	= $_POST["userphone1"].$_POST["userphone2"].$_POST["userphone3"];

include("../_inc/dbconn.php");

$sql = "SELECT * FROM ITM_MEMBER WHERE MEM_NAME = '$username' AND MEM_MAIL = '$useremail' AND MEM_TEL = '$userphone' AND DEL_YN = 'N'";

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
        <form action="send_email_proc.jsp" name="frm" id="frm" method="post">
            <input type="hidden" name="mode" value="비밀번호찾기">
            <input type="hidden" name="username" value=<?=$username;?>>
            <input type="hidden" name="useremail" value=<?=$useremail;?>>
            <input type="hidden" name="userphone" value=<?=$userphone;?>>
        </form>
    </body>
    <script language="javascript">
    document.frm.submit();
    </script>
</html>