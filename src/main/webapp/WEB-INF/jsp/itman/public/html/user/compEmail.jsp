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
				고객님의<br/>
				정보와 일치하는<br/>
				이메일입니다.
			</p>
			<?php
				$email = $_POST['useremail'];
				$div= explode('@', $email);
				$div[0] = preg_replace('/(?<=.{3})./u','*',$div[0]);
				$email = implode('@', $div);
			?>
			<p class="find_comp"><?php echo $email;?></p>

			<p class="user_btn"><a href="login.jsp">로그인 하기</a></p>
			<p class="mam_btn"><a href="findPass.jsp">비밀번호 찾기</a></p>
		</div>
	</div>
	<? include "../_inc/footer.php"; ?>
</body>
</html>
