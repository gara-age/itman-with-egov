<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" language="java" %>

<!doctype html>
<html lang="ko">
 <head>
  <? include "../_inc/title.php"; ?>
 </head>
<body>
	<div id="contents">
		<div class="user_box">
			<p class="tit"><a href="../index.php"><img src="../../../../../../images/_img/itman_logo.png" alt="아이티맨" /></a></p>

            <form action="login_proc.jsp" name="frm" id="frm" method="post">
			<ul class="mem">
				<li>
					<p>이메일</p>
					<div><input type="text" id="useremail" name="useremail"></div>
				</li>
				<li>
					<p>비밀번호</p>
					<div><input type="password" id="userpw" name="userpw"></div>
				</li>
			</ul>
			<p class="user_btn"><a href="javascript:fn_submit();">로그인</a></p>
</form>
			<p class="mam_btn"><a href="join01.php">회원가입</a><a href="findEmail.php">이메일 찾기</a><a href="findPass.php">비밀번호 찾기</a></p>
		</div>
	</div>
	<? include "../_inc/footer.php"; ?>
</body>
<script language="javascript">
function fn_submit(){
    frm.submit();
}
</script>
</html>
