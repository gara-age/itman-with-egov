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
				비밀번호를<br/>잊으셨나요?
				<span>회원가입시 입력하셨던 정보를 하단에 입력해주세요.</span>
			</p>

            <form action="findPass_proc.jsp" name="frm" id="frm" method="post">
			<ul class="mem">
				<li>
					<p>사용자 이름</p>
					<div><input type="text" id="username" name="username"></div>
				</li>
				<li>
					<p>이메일</p>
					<div><input type="text" id="id" name="useremail"></div>
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
			<p class="user_btn"><a href="javascript:fn_submit();">비밀번호 찾기</a></p>
            </form>
		</div>
	</div>
	<? include "../_inc/footer.php"; ?>
</body>
<script language="javascript">
function fn_submit(){
	//이름
	if($("#username").val().trim() == ""){
		alert("이름을 입력해주세요.");
		$("#username").focus();
		return false;
	}
	// 이메일
	if($("#id").val().trim() == ""){
		alert("이메일을 입력해주세요.");
		$("#id").focus();
		return false;
	}
	// userphone2값이 비어있으면 실행.
	if($("#userphone2").val().trim() == ""){
		alert('휴대폰 번호를 입력해주세요.');
		$("#userphone2").focus();
		return false;
    }
	// userphone3값이 비어있으면 실행.
	if($("#userphone3").val().trim() == ""){
		alert('휴대폰 번호를 입력해주세요.');
		$("#userphone3").focus();
		return false;
    }
	// userphone2값이 4이상이면 실행.
	if($("#userphone2").val().trim().length > 4){
		alert("휴대폰 형식을 확인해주세요.");
		$("#userphone2").focus();
		return false;
	}
	// userphone3값이 4이상이면 실행.
	if($("#userphone3").val().trim().length > 4){
		alert("휴대폰 형식을 확인해주세요.");
		$("#userphone3").focus();
		return false;
	}
    frm.submit();
}
</script>
</html>
