<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" language="java" %>

<!doctype html>
<html lang="ko">
 <head>
  <jsp:include page="${pageContext.request.contextPath}/WEB-INF/jsp/itman/_inc/title.jsp"/>
	 <jsp:include page="${pageContext.request.contextPath}/WEB-INF/jsp/itman/_inc/header.jsp"/>
 </head>
<body id="mypage">
	<div id="contents">
		<div class="mypage_box">
			<h2>마이페이지</h2>
			<ul class="myinfo">
				<li>
					<p>이름</p>
					<div>${member.memName}</div>
				</li>
				<li>
					<p>이메일</p>
					<div>${member.memMail}</div>
				</li>
				<li>
					<p>휴대폰 번호</p>
					<div>${member.memTel}<a onclick="window.open('/itman/phoneEdit.do', '수정팝업', 'width=500, height=335')" href="#none">수정</a></div>
				</li>
				<li>
					<p>비밀번호</p>
					<div class="full"><a href="/itman/changePass.do">변경</a></div>
				</li>
			</ul>
			
			<h3>계정관리</h3>
			<ul class="boxlist">
				<li><a href="/itman/myGroup.do">그룹관리</a></li>
				<li><a href="/itman/privacy.do">서비스 이용약관</a></li>
				<li><a href="/itman/accDel.do">계정탈퇴</a></li>
			</ul>
		</div>
	</div>
	<jsp:include page="${pageContext.request.contextPath}/WEB-INF/jsp/itman/_inc/footer.jsp" />
</body>
</html>

