<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!doctype html>
<html lang="ko" style="background-color: #f0f5f5">
 <head>
	 <jsp:include page="${pageContext.request.contextPath}/WEB-INF/jsp/itman/_inc/checkSession.jsp"/>
	<jsp:include page="${pageContext.request.contextPath}/WEB-INF/jsp/itman/_inc/title.jsp" />
 </head>
<body>
<c:if test="${empty division.divIdx}">
<c:set var="actionUrl" value="/itman/insertDepart.do" />
</c:if>
<c:if test="${!empty division.divIdx}">
	<c:set var="actionUrl" value="/itman/updateDepart.do?divIdx=${division.divIdx}" />
</c:if>
<c:url value="/itman/checkDuplicateEmpDiv.do" var="checkDuplicateUrl"/>

	<div id="popup">
		<div class="pop_tit">
			<p class="title">
				<c:choose>
					<c:when test="${!empty division.divIdx}">부서 수정 팝업</c:when>
					<c:otherwise>부서 추가 팝업</c:otherwise>
				</c:choose>
			</p>
		</div>
		<div class="pop_cont">
			<form method="post" id="form" action="${actionUrl}">
			<ul class="contEdit">
				<li>
					<p class="tit">부서명<span>*</span></p>
					<p class="cont"><input type="text" id="div_name" name="divName" placeholder="부서명을 입력해주세요." value="${division.divName}"></p>
				</li>
				<li>
					<p class="tit">부서코드번호<span>*</span></p>
					<p class="cont"><input type="text" id="div_code" name="divCode" value="${division.divCode}" placeholder="부서 코드 번호를 입력해 주세요."></p>
				</li>
				<li>
					<p class="tit">사용유무<span>*</span></p>
					<p class="cont"><input type="radio" id="yes" name="DivYn" value="Y" ${division.divYn == 'Y' ? 'checked' : ''} ${empty division.divIdx ? 'checked' : ''} ><label for="yes">사용</label> <input type="radio" id="no" name="DivYn" value="N" ${division.divYn == 'N' ? 'checked' : ''}><label for="no">사용안함</label></p>
				</li>
			</ul>
			<p class="pop_btn"><a href="javascript:window.close();" class="del">취소</a><a href="#" onclick="checkDuplicate();" class="comp">등록</a></p>
			</form>
		</div>
	</div>
<script>
   async function checkDuplicate(){
		$div_name = $("#div_name").val().trim();
		$div_code = $("#div_code").val().trim();

		if(!$div_name || !$div_code){
			alert("필수 값을 입력해주세요!");
		}else{
			try {
				const resp = await fetch("${checkDuplicateUrl}", {
					method: "POST",
					headers: {
						"Content-Type": "application/x-www-form-urlencoded"
					},
					body: new URLSearchParams({
						divCode: document.querySelector("input[name='divCode']").value.trim()

					}),
				});

				const text = await resp.text();
				const code = parseInt(text.trim(), 10);

				if (code === 0) {
					alert("이미 존재하는 부서 코드입니다.");
					$("#div_code").focus();
					return;
				}

				if (code === 1) {
					document.forms['form'].submit();

					setTimeout(() => {
						window.opener.location.reload();
						window.close();
					} ,300)
				}
			} catch (e) {
				alert("오류가 발생했습니다.");
				console.error(e);
			}

		}
    }
</script>
</body>
</html>

