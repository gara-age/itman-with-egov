<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" language="java" %>

<!doctype html>
<html lang="ko">
 <head>
  <?php include "../_inc/title.php"; ?>
 </head>
<body>
	<div id="contents">
		<div class="user_box join">
			<p class="tit"><a href="../index.php"><img src="../../../../../../images/_img/itman_logo.png" alt="아이티맨" /></a></p>
			<p class="find_tit">
				이메일을<br/>잊으셨나요?
				<span>회원가입시 입력하셨던 정보를 하단에 입력해주세요.</span>
			</p>

            <form action="findEmail_proc.jsp" name="frm" id="frm" method="post">
			<ul class="mem">
				<li>
					<p>사용자 이름</p>
                    <div><input type="text" id="username" name="username"></div>
				</li>
				<li>
					<p>휴대폰 번호</p>
					<div class="tel">
						<p class="full">
                            <select id="userphone1" name="userphone1">
								<option>010</option>
								<option>011</option>
								<option>012</option>
                                </select><span>-</span><input type="tel" id="userphone2" name="userphone2"><span>-</span><input type="tel" id="userphone3" name="userphone3">
						</p>
					</div>
				</li>
			</ul>
			<p class="user_btn"><a href="javascript:fn_submit();">이메일 찾기</a></p>
            </form>
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
