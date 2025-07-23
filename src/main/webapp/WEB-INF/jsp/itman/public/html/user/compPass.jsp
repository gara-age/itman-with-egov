<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" language="java" %>

<!doctype html>
<html lang="ko">
<head>
<? include "../_inc/title.php"; ?>
</head>

<body>
	<div id="contents">
		<div class="user_box join">
			<p class="tit"><a href="../index.php"><img src="../../../../../../images/_img/itman_logo.png" alt="아이티맨" /></a></p>
			<p class="find_tit">
				재설정할<br/>
				비밀번호를<br/>
				입력해주세요.
			</p>
			<form action="changePass_proc.php" name="frm" id="frm" method="post">
			<ul class="mem">
				<li>
					<p>비밀번호</p>
					<div><input type="password" id="userpw" name="userpw"></div>
				</li>
				<li>
					<p>비밀번호 확인</p>
					<div>
						<input type="password" id="userpw_ch" name="userpw_ch">
					</div>
				</li>
			</ul>

            <input type="hidden" name="username" value=<?=$_POST["username"];?>>
            <input type="hidden" name="useremail" value=<?=$_POST["useremail"];?>>
            <input type="hidden" name="userphone" value=<?=$_POST["userphone"];?>>

			<p class="user_btn"><a href="javascript:fn_submit();">비밀번호 변경</a></p>
			</form>
		</div>
	</div>
	<? include "../_inc/footer.php"; ?>
</body>
<script language="javascript">

function fn_submit(){
	// userpw값이 비어있으면 실행.
	if($("#userpw").val().trim() == ""){
	alert("비밀번호를 입력해주세요.");
	$("#userpw").focus();
	return false;
	}
    // userpw_ch값이 비어있으면 실행.
	if($("#userpw_ch").val().trim() == ""){
		alert("비밀번호를 입력해주세요.");
		$("#userpw_ch").focus();
		return false;
	}
    // userpw값이 6자 이상 20자 이하를 벗어나면 실행.
	if($("#userpw").val().trim().length < 6 || $("#userpw").val().trim().length > 20){
		alert("비밀번호는 6자 이상 20자 이하로 입력해주세요.");
		$("#userpw").focus();
		return false;
	}
	// userpw값과 userpw_ch값이 다르면 실행.
    if($("#userpw").val().trim() != $("#userpw_ch").val().trim()) {
        alert('비밀번호가 다릅니다. 다시 입력해주세요.');
        $("#userpw").focus();
        return false;
    }
    frm.submit();
}
</script>
</html>
