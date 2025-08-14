<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" language="java" %>

<!doctype html>
<html lang="ko" style="background-color: #f0f5f5">
<head>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/jsp/itman/_inc/title.jsp"/>
</head>

<body>
	<div id="contents">
		<div class="user_box join">
			<p class="tit"><a href="/itman/index.do"><img src="../../../../../../images/_img/itman_logo.png" alt="아이티맨" /></a></p>
			<p class="find_tit">
				재설정할<br/>
				비밀번호를<br/>
				입력해주세요.
			</p>
			<form action="/itman/changePass_proc.do" name="form" id="form" method="post">
			<ul class="mem">
				<li>
					<p>비밀번호</p>
					<div><input type="password" id="userpw" name="newPw"></div>
				</li>
				<li>
					<p>비밀번호 확인</p>
					<div>
						<input type="password" id="userpw_ch" name="memPwCh">
					</div>
				</li>
			</ul>

			<p class="user_btn"><a href="#" onclick="formSubmit();">비밀번호 변경</a></p>
			</form>
		</div>
	</div>
	<jsp:include page="${pageContext.request.contextPath}/WEB-INF/jsp/itman/_inc/footer.jsp"/>
</body>
<script language="javascript">

function formSubmit(){
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
    form.submit();
}
</script>
</html>
