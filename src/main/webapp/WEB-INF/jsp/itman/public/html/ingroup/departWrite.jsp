<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!doctype html>
<html lang="ko">
 <head>
	 <jsp:include page="${pageContext.request.contextPath}/WEB-INF/jsp/itman/_inc/checkSession.jsp"/>
	 <jsp:include page="/WEB-INF/jsp/itman/_inc/title.jsp" />
	 <jsp:include page="/WEB-INF/jsp/itman/_inc/header.jsp" />
	 <link href="https://webfontworld.github.io/gmarket/GmarketSans.css" rel="stylesheet" />
	 <link rel="stylesheet" href="${pageContext.request.contextPath}/css/_css/default.css" />
	 <link rel="stylesheet" href="${pageContext.request.contextPath}/css/_css/bbs.css" />
	 <link rel="stylesheet" href="${pageContext.request.contextPath}/css/_css/comn.css" />
	 <link rel="stylesheet" href="${pageContext.request.contextPath}/css/_css/pc.css" />
	 <link rel="stylesheet" href="${pageContext.request.contextPath}/css/_css/respon.css" />
 </head>
<body>
	<div id="contents">
		<div class="tit_search">
			<h2>부서 관리</h2>
		</div>

		<c:set var="actionUrl" value="/itman/departInsert.do" />
		<c:if test="${!empty division.divIdx}">
			<c:set var="actionUrl" value="/itman/departUpdate.do" />
		</c:if>
		<form method="post" id='write' name="divisionForm" action="${actionUrl}" onsubmit="return validateForm()">
			<c:if test="${!empty division.divIdx}">
				<input type="hidden" name="divIdx" value="${division.divIdx}" />
			</c:if>
			<ul class="adminView Write">
			<li>
				<p class="tit">부서코드 <span>*</span></p>
				<p class="cont">
					<c:choose>
					<c:when test="${!empty division.divIdx}">
						<input id="DIV_CODE" type="text" name="divCode" value="${division.divCode}" />
					</c:when>
					<c:otherwise>
						<input id="DIV_CODE" type="text" name="divCode" placeholder="부서코드를 입력해주세요"  value="${division.divCode}" />
					</c:otherwise>
				</c:choose>
				</p>
			</li>
			<li>
				<p class="tit">부서명 <span>*</span></p>
				<p class="cont">
					<c:choose>
						<c:when test="${!empty division.divIdx}">
							<input id="DIV_NAME" type="text" name="divName" value="${division.divName}" />
						</c:when>
						<c:otherwise>
							<input id="DIV_NAME" type="text" name="divName" placeholder="부서명 입력해주세요" value="${division.divName}" />
						</c:otherwise>
					</c:choose>
				</p>
			</li>
			<li>
				<p class="tit">부서위치 <span></span></p>
				<p class="cont">
					<c:choose>
						<c:when test="${!empty division.divIdx}">
							<input id="DIV_LOC" type="text" name="divLoc" value="${division.divLoc}" />
						</c:when>
						<c:otherwise>
							<input id="DIV_LOC" type="text" name="divLoc" placeholder="위치를 입력해주세요." value="${division.divLoc}" />
						</c:otherwise>
					</c:choose>
				</p>
			</li>
			<li>
				<p class="tit">연락처<span></span></p>
				<p class="cont">
				<c:choose>
					<c:when test="${!empty division.divIdx}">
						<input id="DIV_TEL" type="text" name="empTel" value="${division.divTel }" />
					</c:when>
					<c:otherwise>
						<input id="DIV_TEL" type="text" name="divTel" placeholder="연락처를 입력해주세요." value="${division.divTel }" />
					</c:otherwise>
				</c:choose>
				</p>
			</li>
				<li>
					<p class="tit">사용유무<span>*</span></p>
					<p class="cont">
						<input type="radio" id="DIV_Y" name="divYn" value="Y" ${division.divYn == 'Y' ? 'checked' : ''} ><label for="DIV_Y">사용</label>
						<input type="radio" id="DIV_N" name="divYn" value="N" ${division.divYn == 'N' ? 'checked' : ''}><label for="DIV_N">사용안함</label>
					</p>
				</li>
		</ul>
		</form>

		<p class="pagebtn"><a href="/itman/departList.do" class="del">취소</a>
		<c:choose>
			<c:when test="${!empty division.divIdx}">
				<a href="#" type="submit" class="comp" onclick="if(validateForm()) document.forms['divisionForm'].submit(); return false"
				>수정</a>
			</c:when>
			<c:otherwise>
				<a href="#" type="submit" class="comp" onclick="if(validateForm()) document.forms['divisionForm'].submit(); return false"
				>추가</a>
			</c:otherwise>
		</c:choose>
		</p>
	</div>
	<jsp:include page="/WEB-INF/jsp/itman/_inc/footer.jsp" />

	<script type="text/javascript">

		function validateForm() {
			const form = document.forms["divisionForm"];

			const divCode = form.divCode.value.trim();
			const divName = form.divName.value.trim();
			const divYn = form.divYn.value.trim();

			if (divCode === "") {
				alert("부서코드를 입력하세요.");
				form.divCode.focus();
				return false;
			}

			if (divName === "") {
				alert("부서명을 입력하세요.");
				form.divName.focus();
				return false;
			}

			if (divYn === "") {
				alert("사용유무를 선택하세요.");
				form.divYn.focus();
				return false;
			}

			return true;
		}
	</script>
</body>
</html>
