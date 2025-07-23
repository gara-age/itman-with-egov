<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" language="java" %>

<?php
include "../mail/PHPMailer.php";
include "../mail/SMTP.php";

//메일 수신주소
$mode       = $_POST["mode"];
$username 	= $_POST["username"];
$useremail 	= $_POST["useremail"];
$userpw 	= $_POST["userpw"];
$rand_num = sprintf('%06d',rand(000000,999999));

if(isset($_POST["userphone"])){
    $userphone 	= $_POST["userphone"];
}else{
    $userphone 	= $_POST["userphone1"].$_POST["userphone2"].$_POST["userphone3"];
}

include "../_inc/dbconn.php";

if($mode == "회원가입"){

    $subject="ITman 회원가입 인증번호입니다.";
    
    $sql = "SELECT MEM_MAIL FROM ITM_MEMBER WHERE DEL_YN ='N'";
    $result = mysqli_query($dbconn, $sql);
    while($row =(mysqli_fetch_array($result))) {
        if($row['MEM_MAIL'] == $_POST['useremail']){
            echo "<script> alert('중복된 이메일입니다.'); history.back();</script>";
            break;
        }
    }
}elseif($mode == "비밀번호찾기"){

    $subject="ITman 비밀번호 변경 인증번호입니다.";
}

$mailCode_sql = "
INSERT INTO ITM_EMAIL_CODE
(EMAIL, MEM_NAME, EC_NUM, EC_MODE, REG_DATE)
VALUES(
    '{$useremail}',
    '{$username}',
    '{$rand_num}',
    '{$mode}',
    NOW()
)";

$mailCode_result = mysqli_query($dbconn,$mailCode_sql);

//내용
$content=
"인증번호 입력란에 하단의 인증번호를 입력해주세요.
인증번호: ".$rand_num;

//한글 안깨지게 만들어줌
$subject = "=?UTF-8?B?".base64_encode($subject)."?=";







$mail = new PHPMailer();
$mail->isSMTP();
$mail->SMTPDebug = SMTP::DEBUG_OFF;

// Gmail SMTP 서버 설정
$mail->Host = 'smtp.gmail.com';
$mail->Port = 587; // STARTTLS 사용 시 587, SMTPS(SSL) 사용 시 465
$mail->SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS;
$mail->SMTPAuth = true;

// Gmail 계정 정보
$mail->Username = 'withsystem2012@gmail.com';  // Gmail 주소 입력
$mail->Password = 'vwfpyevpdttlhmwy';    // 앱 비밀번호 입력

// 이메일 인코딩 설정
$mail->CharSet = "UTF-8";  // EUC-KR 대신 UTF-8 사용 권장

// 발신자 정보
$mail->setFrom('withsystem2012@gmail.com', 'ITMAN');

// 수신자 설정
$mail->addAddress($useremail);

// 이메일 제목 & 내용
$mail->Subject = $subject;
$mail->Body = $content;

// 이메일 전송
if (!$mail->send()) {
    echo 'Mailer Error: ' . $mail->ErrorInfo;
} else {
    echo 'Message sent!';
}

?>
<!doctype html>
<html lang="ko">
<body>
<form method=post action="certPass.php" name="frm">
<input type="hidden" name="username" value=<?=$username;?>>
<input type="hidden" name="useremail" value=<?=$useremail;?>>
<input type="hidden" name="userpw" value=<?=$userpw;?>>
<input type="hidden" name="userphone" value=<?=$userphone;?>>
<input type="hidden" name="rand_num" value=<?=$rand_num;?>>
<input type="hidden" name="mode" value=<?=$mode;?>>
</form>
</body>
<script language="javascript">
document.frm.submit();
</script>
</html>