<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" language="java" %>

<!doctype html>
<html lang="ko">
 <head>
  <? include "../_inc/title.php"; ?>
 </head>
 <?php
    $username = $_POST["username"];
 ?>
<body>
	<div id="contents">
		<div class="user_box join">
			<p class="tit"><a href="../index.php"><img src="../../../../../../images/_img/itman_logo.png" alt="아이티맨" /></a></p>
			<ul class="step">
				<li class="comp"><span>1</span></li>
				<li class="comp"><span>2</span></li>
				<li class="on"><span>3</span>가입 완료</li>

			</ul>
			<div class="comp_page">
				<span><?php echo $username;?></span>님 가입되었습니다!			
			</div>
			<p class="user_btn"><a href="login.jsp">로그인하기</a></p>
		</div>
	</div>
	<? include "../_inc/footer.php"; ?>
</body>
</html>
