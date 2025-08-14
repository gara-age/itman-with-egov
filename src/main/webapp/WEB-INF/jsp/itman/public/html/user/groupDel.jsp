<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" language="java" %>

<!doctype html>
<html lang="ko">
 <head>
	 <jsp:include page="${pageContext.request.contextPath}/WEB-INF/jsp/itman/_inc/checkSession.jsp"/>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/jsp/itman/_inc/title.jsp"/>

 </head>
<body>
<c:url value="/itman/authPassword.do" var="authPassUrl"/>
	<div id="popup">
		<div class="pop_tit">
			<p class="title">삭제하시겠습니까?</p>
		</div>
		<div class="pop_cont">
			<ul class="contEdit">
				<li>
					<form action="/itman/deleteGroup.do" name="form" id="form" method="post">
						<input type="hidden" name="groIdx" value="${group.groIdx}">
						<p class="tit">비밀번호</p>
						<p class="cont"><input id="inputPw" name="inputPw" type="password"/></p>
					</form>
				</li>
			</ul>
			<p class="pop_btn"><a href="javascript:window.close();" class="del">취소</a><a href="#" onclick="checkPw()" class="comp">삭제</a></p>
		</div>
	</div>

</body>
<script>
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
				alert("삭제되었습니다.");
				document.forms['form'].submit();
			}
		} catch (e) {
			alert("오류가 발생했습니다.");
			console.error(e);
		}
	}
	</script>
</html>
