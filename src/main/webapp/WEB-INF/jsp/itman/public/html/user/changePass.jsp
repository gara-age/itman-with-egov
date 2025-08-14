<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core_1_1" %>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" language="java" %>

<!doctype html>
<html lang="ko">
 <head>
	 <jsp:include page="${pageContext.request.contextPath}/WEB-INF/jsp/itman/_inc/checkSession.jsp"/>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/jsp/itman/_inc/title.jsp"/>
	 <jsp:include page="${pageContext.request.contextPath}/WEB-INF/jsp/itman/_inc/header.jsp"/>
 </head>
<body id="group">
<c:url value="/itman/authPassword.do" var="authPassUrl"/>
	<div id="contents">
		<div class="mypage_box">
			<h2><a href="/itman/myPage.do">비밀번호 변경</a></h2>
			<ul class="myinfo pass">
			<form action="/itman/updatePass.do" name="form" id="form" method="post">
				<li>
					<p>현재 비밀번호</p>
					<div><input id="inputPw" name="inputPw" type="password"/></div>
				</li>
				<li>
					<p>변경 비밀번호</p>
					<div><input id="pw" name="newPw" type="password"/></div>
				</li>
				<li>
					<p>비밀번호 확인</p>
					<div><input id="comparepw" type="password"/></div>
				</li>
			</form>
			</ul>

			<p class="pagebtn"><a href="#" onclick="checkPw();" class="comp">변경</a></p>
		</div>
	</div>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/jsp/itman/_inc/footer.jsp" />
</body>
<script>

	async function checkPw(){
		const pw = document.getElementById("pw").value.trim();
		const comparePw = document.getElementById("comparepw").value.trim();
		const inputPw = document.getElementById("inputPw").value.trim();


		if (!pw || !comparePw) {
			alert("모든 비밀번호 항목을 입력해주세요.");
			return;
		}
		if (pw !== comparePw) {
			alert("두 비밀번호가 일치하지 않습니다.");
			document.getElementById("pw").value = "";
			document.getElementById("comparepw").value = "";
			return;
		}
		if (inputPw === pw) {
			alert("기존 비밀번호와 다른 비밀번호를 입력해주세요");
			document.getElementById("pw").value = "";
			document.getElementById("comparepw").value = "";
			return;
		}
		if(pw.length < 6 || pw.length > 20){
			alert("비밀번호는 6자 이상 20자 이하로 입력해주세요.");
			document.getElementById("pw").value = "";
			document.getElementById("comparepw").value = "";
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
				alert("현재 비밀번호가 일치하지 않습니다.");
				document.querySelector("input[name='inputPw']").value = "";
				return;
			}

			if (code === 1) {
				alert("비밀번호가 변경되었습니다.");
				document.forms['form'].submit();
			}
		} catch (e) {
			alert("오류가 발생했습니다.");
			console.error(e);
		}
	}
	</script>
</html>

