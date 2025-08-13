<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" language="java" %>

<!doctype html>
<html lang="ko">
 <head>
	 <jsp:include page="${pageContext.request.contextPath}/WEB-INF/jsp/itman/_inc/title.jsp" /> </head>
<body>
	<div id="contents">
		<div class="user_box join">
			<p class="tit"><a href="/itman/index.do"><img src="../../../../../../images/_img/itman_logo.png" alt="아이티맨" /></a></p>
			<ul class="step">
				<li class="comp"><span>1</span></li>
				<li class="comp"><span>2</span></li>
				<li class="on"><span>3</span>가입 완료</li>

			</ul>
			<div class="comp_page">
				<span>${member.memName}</span>님 가입되었습니다!
			</div>
			<p class="user_btn" style="background-color: #2e2fbf"><a href="/itman/user/login.do">로그인하기</a></p>
		</div>
	</div>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/jsp/itman/_inc/footer.jsp" />
</body>
</html>
