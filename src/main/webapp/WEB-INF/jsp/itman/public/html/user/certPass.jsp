<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" language="java" %>

<!doctype html>
<html lang="ko">
 <head>
  <? include "../_inc/title.php"; ?>
 </head>

 <?php
$username 	= $_POST["username"];
$useremail 	= $_POST["useremail"];
$userpw 	= $_POST["userpw"];
$userphone 	= $_POST["userphone"];
$rand_num = $_POST["rand_num"];
$mode = $_POST["mode"];

if($mode == "회원가입"){
    $nextPage = "join_proc.php";
}elseif($mode == "비밀번호찾기"){
    $nextPage = "compPass.php";
}

include("../_inc/dbconn.php");

$sql = "SELECT * FROM ITM_EMAIL_CODE WHERE EMAIL = '".$useremail."' AND MEM_NAME = '".$username."'
ORDER BY REG_DATE DESC
LIMIT 1";

$result = mysqli_query($dbconn,$sql);
$row = (mysqli_fetch_array($result));
?>
<body>
	<div id="contents">
		<div class="user_box join">
			<p class="tit"><a href="../index.php"><img src="../../../../../../images/_img/itman_logo.png" alt="아이티맨" /></a></p>
			<p class="find_tit">
				이메일로<br/>
				전송된 인증 번호를<br/>
				입력해주세요.
			</p>
            <form action="<?= $nextPage?>" name="frm" id="frm" method="post">
			<ul class="mem">
				<li>
					<div><input type="text" id="ver_code" name="ver_code" placeholder="인증번호를 여기에 입력해 주세요."></div>
				</li>
			</ul>

			<!-- <input type="hidden" id="rand_num" name="rand_num" value=<?=$rand_num;?>> -->
			<input type="hidden" id="rand_num" name="rand_num" value=<?=$rand_num;?>>
            <!-- <?php echo $mode;?><?php echo $rand_num;?> -->
            <input type="hidden" id="reg_time" name="reg_time" value=<?=$row['REG_DATE'];?>>
            <input type="hidden" name="username" value=<?=$username;?>>
            <input type="hidden" name="useremail" value=<?=$useremail;?>>
            <input type="hidden" name="userpw" value=<?=$userpw;?>>
            <input type="hidden" name="userphone" value=<?=$userphone;?>>

			<p class="user_btn"><a href="javascript:fn_submit();">다음</a></p>
            </form>
		</div>
	</div>
	<? include "../_inc/footer.php"; ?>
</body>

<script language="javascript">

function fn_submit(){

    var now = new Date();
    if(now < $("#ver_code").val().trim()){
		alert("인증시간이 초과했습니다. 다시 입력해주세요");
		history.back();
		return false;
	}

    if($("#ver_code").val().trim() == ""){
		alert("인증번호를 입력해주세요.");
		$("#ver_code").focus();
		return false;
	}

    if($("#ver_code").val().trim() != $("#rand_num").val().trim()) {
        alert('인증번호를 다시 확인해주세요.');
        $("#ver_code").focus();
        return false;
    }

    frm.submit();
}

</script>
</html>
