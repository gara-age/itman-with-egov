<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" language="java" %>

<!doctype html>
<html lang="ko">
 <head>
  <? 
  include "../_inc/title.php"; 
  session_start();
  $group = $_SESSION['group'];

  ?>
 </head>
<body id="mypage">
	<? include "../_inc/header.php"; ?>
	<div id="contents">
		<div class="user_box join">
			<h2><a href="mypage.jsp">계정 탈퇴</a></h2>
			<p class="find_tit mt40">
                <?php echo $_SESSION['username'];?>님의<br/>
				계정을 삭제<br/>
				하시겠습니까?
			</p>
			<ul class="mem">
            <form action="accDel_proc.jsp" name="frm" id="frm" method="post">
				<li>
					<p>비밀번호</p>
					<div><input type="password" id="userpw" name="userpw"></div>
				</li>
			</ul>
            <br>
			<p class="red_txt">계정 탈퇴 시 복구가 불가능합니다!</p>
			<p class="user_btn"><a href="javascript:fn_submit();">회원탈퇴</a></p>
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

