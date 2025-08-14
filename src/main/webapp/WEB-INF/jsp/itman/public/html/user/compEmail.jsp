<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="email" value="${memMail}"/>
<c:set var="atIndex" value="${fn:indexOf(email, '@')}" />
<c:set var="prefix" value="${fn:substring(email, 0, 3)}" />
<c:set var="maskedLength" value="${atIndex - 3}" />
<c:set var="stars" value="" />
<c:forEach var="i" begin="1" end="${maskedLength}">
	<c:set var="stars" value="${stars}*" />
</c:forEach>
<c:set var="domain" value="${fn:substring(email, atIndex, fn:length(email))}" />
<c:set var="maskedMail" value="${prefix}${stars}${domain}"/>

<!doctype html>
<html lang="ko">
 <head>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/jsp/itman/_inc/title.jsp"/>
 </head>
<body>
	<div id="contents">
		<div class="user_box join">
			<p class="tit"><a href="/itman/index.do"><img src="../../../../../../images/_img/itman_logo.png" alt="아이티맨" /></a></p>
			<p class="find_tit">
				고객님의<br/>
				정보와 일치하는<br/>
				이메일입니다.
			</p>


			<p class="find_comp">${maskedMail}</p>

			<p class="user_btn"><a href="/itman/user/login.do">로그인 하기</a></p>
			<p class="mam_btn"><a href="/itman/user/findPass.do">비밀번호 찾기</a></p>
		</div>
	</div>
	<jsp:include page="${pageContext.request.contextPath}/WEB-INF/jsp/itman/_inc/footer.jsp"/>
</body>
</html>
