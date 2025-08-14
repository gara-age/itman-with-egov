<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" language="java" %>

<!doctype html>
<html lang="ko">
 <head>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/jsp/itman/_inc/title.jsp" />
	</head>
<body>
	<div id="contents">
		<div class="user_box">
			<p class="tit"><a href="/itman/index.do"><img src="../../../../../../images/_img/itman_logo.png" alt="아이티맨" /></a></p>

            <form action="/itman/user/authUser.do" name="form" id="form" method="post">
			<ul class="mem">
				<li>
					<p>이메일</p>
					<div><input type="text" id="useremail" name="inputMail"></div>
				</li>
				<li>
					<p>비밀번호</p>
					<div><input type="password" id="userpw" name="inputPw"></div>
				</li>
			</ul>
			<p class="user_btn" ><a href="#" onclick="formSubmit();">로그인</a></p>
</form>
			<p class="mam_btn"><a href="/itman/user/join.do">회원가입</a><a href="/itman/user/findEmail.do">이메일 찾기</a><a href="/itman/user/findPass.do">비밀번호 찾기</a></p>
		</div>
	</div>
	<c:if test="${!empty msg}">
		<script>
			alert("${msg}");
		</script>
	</c:if>
	<jsp:include page="${pageContext.request.contextPath}/WEB-INF/jsp/itman/_inc/footer.jsp" />

	<script language="javascript">
		function formSubmit(){
			$useremail = $("#useremail").val().trim();
			$userpw = $("#userpw").val().trim();

			if(!$useremail || !$userpw){
				alert("필수 값을 입력해주세요!");
				return false;
			}
			document.forms['form'].submit();
		}
	</script>
</body>

</html>
