<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" language="java" %>

<!doctype html>
<html lang="ko">
 <head>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/jsp/itman/_inc/title.jsp" />
 </head>

<%-- <?php--%>
<%--$username 	= $_POST["username"];--%>
<%--$useremail 	= $_POST["useremail"];--%>
<%--$userpw 	= $_POST["userpw"];--%>
<%--$userphone 	= $_POST["userphone"];--%>
<%--$rand_num = $_POST["rand_num"];--%>
<%--$mode = $_POST["mode"];--%>

<%--if($mode == "회원가입"){--%>
<%--    $nextPage = "join_proc.php";--%>
<%--}elseif($mode == "비밀번호찾기"){--%>
<%--    $nextPage = "compPass.php";--%>
<%--}--%>

<%--include("../_inc/dbconn.php");--%>

<%--$sql = "SELECT * FROM ITM_EMAIL_CODE WHERE EMAIL = '".$useremail."' AND MEM_NAME = '".$username."'--%>
<%--ORDER BY REG_DATE DESC--%>
<%--LIMIT 1";--%>

<%--$result = mysqli_query($dbconn,$sql);--%>
<%--$row = (mysqli_fetch_array($result));--%>
<%--?>--%>
<body>
	<div id="contents">
		<div class="user_box join">
			<p class="tit"><a href="/itman/index.do"><img src="../../../../../../images/_img/itman_logo.png" alt="아이티맨" /></a></p>
			<p class="find_tit">
				이메일로<br/>
				전송된 인증 번호를<br/>
				입력해주세요.
			</p>
            <form action="/itman/checkMailCode.do" name="form" id="form" method="post">
			<ul class="mem">
				<li>
					<div><input type="text" id="inputCode" name="inputCode" placeholder="인증번호를 여기에 입력해 주세요."></div>
				</li>
			</ul>
			<input type="hidden" id="authCode" name="authCode" value="${authCode}">

			<p class="user_btn" style="background-color: #2e2fbf"><a href="#" onclick="fn_submit();">다음</a></p>
            </form>
		</div>
	</div>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/jsp/itman/_inc/footer.jsp" />
</body>

<script language="javascript">
	let authStartTime;
	window.onload = function () {
		authStartTime = new Date();
	}
function fn_submit(){
	const now = new Date();
	const elapsed = now - authStartTime;
	const THREE_MINUTES = 3 * 60 * 1000; //180,000ms


    if(elapsed > THREE_MINUTES){
		alert("인증시간이 초과했습니다. 다시 인증을 시도해주세요");
		history.back();
		return false;
	}

    if($("#inputCode").val().trim() == ""){
		alert("인증번호를 입력해주세요.");
		$("#ver_code").focus();
		return false;
	}

    if($("#inputCode").val().trim() != $("#authCode").val().trim()) {
        alert('인증번호를 다시 확인해주세요.');
        $("#inputCode").focus();
        return false;
    }

    form.submit();
}

</script>
</html>
