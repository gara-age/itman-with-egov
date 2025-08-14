<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" language="java" %>

<!doctype html>
<html lang="ko" style="background-color: #f0f5f5">
 <head>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/jsp/itman/_inc/title.jsp"/>
 </head>
<body>
<c:url value="/itman/findEmail_proc.do" var="authUserUrl"/>
	<div id="contents">
		<div class="user_box join">
			<p class="tit"><a href="/itman/index.do"><img src="../../../../../../images/_img/itman_logo.png" alt="아이티맨" /></a></p>
			<p class="find_tit">
				이메일을<br/>잊으셨나요?
				<span>회원가입시 입력하셨던 정보를 하단에 입력해주세요.</span>
			</p>

            <form action="/itman/compEmail.do" name="form" id="form" method="post">
			<ul class="mem">
				<li>
					<p>사용자 이름</p>
                    <div><input type="text" id="username" name="memName"></div>
				</li>
				<li>
					<p>휴대폰 번호</p>
					<div class="tel">
						<p class="full">
							<input type="hidden" id="memTel" name="memTel">
                            <select id="userphone1" name="userphone1">
								<option>010</option>
								<option>011</option>
								<option>012</option>
                                </select><span>-</span><input type="tel" id="userphone2" name="userphone2"><span>-</span><input type="tel" id="userphone3" name="userphone3">
						</p>
					</div>
				</li>
			</ul>
			<p class="user_btn"><a href="#" onclick="checkUser();">이메일 찾기</a></p>
            </form>
		</div>
	</div>
<jsp:include page="#{pageContext.request.contextPath}/WEB-INF/jsp/itman/_inc/footer.jsp"/>
</body>
<script language="javascript">
	async function checkUser(){
		const username = document.getElementById("username").value.trim();
		if(username === ""){
			alert("이름을 입력해주세요.");
			$("#username").focus();
			return false;
		}
		const expNameText = /[가-힣]+$/;
		if(!expNameText.test(username)){
			alert('이름을 한글로 입력해주세요.');
			$("#username").focus();
			return false;
		}
		const userphone2 = document.getElementById("userphone2").value.trim();
		const userphone3 = document.getElementById("userphone3").value.trim();

		// userphone2값이 비어있으면 실행.
		if(userphone2 === ""){
			alert('휴대폰 번호를 입력해주세요.');
			$("#userphone2").focus();
			return false;
		}
		// userphone3값이 비어있으면 실행.
		if(userphone3 === ""){
			alert('휴대폰 번호를 입력해주세요.');
			$("#userphone3").focus();
			return false;
		}
		// userphone2값이 4이상이면 실행.
		if(userphone2.length > 4){
			alert("휴대폰 형식을 확인해주세요.");
			$("#userphone2").focus();
			return false;
		}
		// userphone3값이 4이상이면 실행.
		if(userphone3.length > 4){
			alert("휴대폰 형식을 확인해주세요.");
			$("#userphone3").focus();
			return false;
		}

		const p1 = document.getElementById("userphone1").value.trim();
		const p2 = document.getElementById("userphone2").value.trim();
		const p3 = document.getElementById("userphone3").value.trim();

		const fullNumber = p1 + p2 + p3;
		document.getElementById("memTel").value = fullNumber;

		try {
			const resp = await fetch("${authUserUrl}", {
				method: "POST",
				headers: {
					"Content-Type": "application/x-www-form-urlencoded"
				},
				body: new URLSearchParams({
					memName: document.querySelector("input[name='memName']").value.trim(),
					memTel: document.querySelector("input[name='memTel']").value.trim()
				}),
			});

			const text = await resp.text();
			const code = parseInt(text.trim(), 10);

			if (code === 0) {
				alert("입력한 회원의 정보가 존재하지않습니다.");
				return;
			}

			if (code === 1) {
				document.forms['form'].submit();
			}
		} catch (e) {
			alert("오류가 발생했습니다.");
			console.error(e);
		}
	}
</script>
</html>
