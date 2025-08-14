<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" language="java" %>

<!doctype html>
<html lang="ko" style="background-color: #f0f5f5">
 <head>
	 <jsp:include page="${pageContext.request.contextPath}/WEB-INF/jsp/itman/_inc/title.jsp"/>
 </head>
<body>
<c:if test="${!empty empState.empStIdx}">
	<c:set var="actionUrl" value="${pageContext.request.contextPath}/itman/updateEmploState.do"/>
</c:if>
<c:if test="${empty empState.empStIdx}">
	<c:set var="actionUrl" value="${pageContext.request.contextPath}/itman/insertEmploState.do"/>
</c:if>

	<div id="popup">
		<div class="pop_tit">
			<p class="title">정보를 입력해주세요</p>
		</div>
		<div class="pop_cont">
			<form id="form" method="post" action="${actionUrl}" >
			<input type="hidden" name="empStIdx" value="${empState.empStIdx}"/>
			<ul class="contEdit">
				<li>
					<p class="tit">상태이름 <span>*</span></p>
					<p class="cont"><input name="empStName" type="text" value="${empState.empStName}" placeholder="직원 상태명을 입력해 주세요."></p>
				</li>
				<li>
					<p class="tit">코드번호 <span>*</span></p>
					<p class="cont"><input name="empStCode" type="text" value="${empState.empStCode}" placeholder="직원상태 코드번호를 입력해 주세요."></p>
				</li>
				<!-- 비고란 -->
			</ul>
			<p class="pop_btn"><a href="javascript:;window.close();" class="del">취소</a><a href="#" onclick="formSubmit()" class="comp">
				<c:if test="${!empty empState.empStIdx}">
					수정
				</c:if>
				<c:if test="${empty empState.empStIdx}">
					추가
				</c:if>
			</a></p>
			</form>
		</div>
	</div>

	<script>
		function formSubmit(){
			document.forms['form'].submit();

			setTimeout(() => {
				window.opener.location.reload();
				window.close();
			}, 300);
		}
		</script>
</body>
</html>
