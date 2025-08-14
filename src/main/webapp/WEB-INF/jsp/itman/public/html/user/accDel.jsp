<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" language="java" %>

<!doctype html>
<html lang="ko">
 <head>
	 <jsp:include page="${pageContext.request.contextPath}/WEB-INF/jsp/itman/_inc/checkSession.jsp"/>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/jsp/itman/_inc/title.jsp" />
	 <jsp:include page="${pageContext.request.contextPath}/WEB-INF/jsp/itman/_inc/header.jsp" />
 </head>
<body id="mypage">
<c:url value="/itman/authPassword.do" var="authPassUrl"/>
	<div id="contents">
		<div class="user_box join">
			<h2><a href="/itman/myPage.do">계정 탈퇴</a></h2>
			<p class="find_tit mt40">
                ${sessionScope.loginUser.memName}님의<br/>
				계정을 삭제<br/>
				하시겠습니까?
			</p>
			<ul class="mem">
            <form action="/itman/accDel_proc.do" name="form" id="form" method="post">
				<li>
					<p>비밀번호</p>
					<div><input type="password" id="inputPw" name="inputPw"></div>
				</li>
			</form>
			</ul>
            <br>
			<p class="red_txt">계정 탈퇴 시 복구가 불가능합니다!</p>
			<p class="user_btn"><a href="#" onclick="checkPw();">회원탈퇴</a></p>
</form>
		</div>
	</div>
	<jsp:include page="${pageContext.request.contextPath}/WEB-INF/jsp/itman/_inc/footer.jsp"/>
</body>
<script language="javascript">
	async function checkPw(){
		const inputPw = document.getElementById("inputPw").value.trim();


		if (!inputPw) {
			alert("비밀번호를 입력해주세요.");
			return;
		}
		if(inputPw.length < 6 || inputPw.length > 20){
			alert("비밀번호는 6자 이상 20자 이하로 입력해주세요.");
			document.getElementById("inputPw").value = "";
			return ;
		}


		try {
			const resp = await fetch("${authPassUrl}", {
				method: "POST",
				headers: {
					"Content-Type": "application/x-www-form-urlencoded"
				},
				body: new URLSearchParams({
					inputPw: document.querySelector("input[name='inputPw']").value.trim()
				}),
			});

			const text = await resp.text();
			const code = parseInt(text.trim(), 10);

			if (code === 0) {
				alert("비밀번호가 일치하지 않습니다.");
				document.querySelector("input[name='inputPw']").value = "";
				return;
			}

			if (code === 1) {
				alert("탈퇴처리 되었습니다.");
				document.forms['form'].submit();
			}
		} catch (e) {
			alert("오류가 발생했습니다.");
			console.error(e);
		}
}
</script>
</html>

