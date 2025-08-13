<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" language="java" %>

<!doctype html>
<html lang="ko">
<!-- 회원가입 프로세스
    join01 - join02 - send_email_proc - certPass - join_proc - join03 
-->
<head>
  <jsp:include page="${pageContext.request.contextPath}/WEB-INF/jsp/itman/_inc/title.jsp" />
</head>

<body>
<c:url value="/itman/checkMail.do" var="checkEmailUrl" />
	<div id="contents">
		<div class="user_box join">
			<p class="tit"><a href="/itman/index.do"><img src="../../../../../../images/_img/itman_logo.png" alt="아이티맨" /></a></p>
			<ul class="step">
				<li class="comp"><span>1</span></li>
				<li class="on"><span>2</span>가입 정보 입력 및 인증</li>
				<li><span>3</span></li>
			</ul>
            <form action="/itman/sendMailCode.do" name="form" id="form" method="post">
			<ul class="mem">
				<li>
					<p>사용자 이름</p>
					<div><input type="text" id="username" name="memName" placeholder="홍길동"></div>
				</li>
                <li>
					<p>이메일</p>
					<div><!-- <div class="in_btn"> -->
                    <input type="text"  class="fadeInfirst"  name="memMail" id="id" placeholder="exmple@exmple.com" required>
                    <span id="idcheck"></span>
					</div>
				</li>
				<li>
					<p>비밀번호</p>
					<div><input type="password" id="userpw" name="memPw"></div>
				</li>
				<li>
					<p>비밀번호 확인</p>
					<div>
						<input type="password" id="userpw_ch" name="memPw_ch">
					</div>
				</li>
				<li>
					<p>휴대폰</p>
					<div class="tel">
						<p class="full">
							<input type="hidden" id="memTel" name="memTel">
							<select id="userphone1" name="userphone1">
								<option>010</option>
								<option>011</option>
								<option>012</option>
							</select><span>-</span><input type="tel" id="userphone2" name="userphone2"><span>-</span><input type="tel" id="userphone3" name="userphone3">
						<!-- </p><a href="#">중복<br/>확인</a> -->
					</div>
				</li>
			</ul>
            <input type="hidden" name="mode" value="회원가입">
			<p class="user_btn" style="background-color: #2e2fbf"><a href="#" onclick="fn_submit();" >다음</a></p>
			</form>
		</div>

	</div>
	<jsp:include page="${pageContext.request.contextPath}/WEB-INF/jsp/itman/_inc/footer.jsp" />
</body>


<script language="javascript">
	let timer = null;
	document.getElementById('id').addEventListener("input", function () {
		clearTimeout(timer);
		const email = this.value.trim();
		timer = setTimeout( () => checkEmail(email), 300);
	})

	async function checkEmail(email){
		const box = document.getElementById('idcheck');
		box.innerHTML = "";
		if(!email) return; //빈값이면 검사 제외
		try {
			const resp = await fetch("${checkEmailUrl}", {
				method: "POST",
				headers: {
					"Content-Type": "application/x-www-form-urlencoded"
				},
				body: new URLSearchParams({email})
			});
			const text = await resp.text();
			const code = parseInt(text.trim(), 10);
			console.log(text);

			const msg = document.createElement('span');
			if (code === 0) {
				msg.className = "true";
				msg.textContent = "사용가능한 이메일입니다";
			} else if (code === 1) {
				msg.className = "false";
				msg.textContent = "이미 존재하는 이메일입니다.";
			} else if (code === 2) {
				msg.className = "false";
				msg.textContent = "이메일 형식에 맞게 입력해주세요.";
			} else {
				msg.className = "false";
				msg.textContent = "알 수 없는 응답입니다.";
			}
			box.appendChild(msg);
		} catch (e) {
			const err = document.createElement('span');
			err.className = "false";
			err.textContent = "검사 중 오류가 발생했습니다.";
			box.appendChild(err);
		}

	}

function fn_submit(){

	//이름
	if($("#username").val().trim() == ""){
		alert("이름을 입력해주세요.");
		$("#username").focus();
		return false;
	}
    const expNameText = /[가-힣]+$/;
	if(!expNameText.test($("#username").val())){
		alert('이름을 한글로 입력해주세요.');
		$("#username").focus();
		return false;
	}

	// 이메일
	if($("#id").val().trim() == ""){
		alert("이메일을 입력해주세요.");
		$("#id").focus();
		return false;
	}
	// 이메일 형식 정규식
    const expEmailText = /^[A-Za-z0-9\.\-]+@[A-Za-z0-9\.\-]+\.[A-Za-z0-9\.\-]+$/;
    // 이메일이 정규식에 부합한지 체크
	if(!expEmailText.test($("#id").val())){
		alert('이메일 형식에 맞게 입력해주세요.');
		return false;
	}

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

	const p1 = document.getElementById("userphone1").value.trim();
	const p2 = document.getElementById("userphone2").value.trim();
	const p3 = document.getElementById("userphone3").value.trim();

	const fullNumber = p1 + "-" + p2 + "-" + p3;
	document.getElementById("memTel").value = fullNumber;

    form.submit();
}
</script>
</html>
