<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" language="java" %>

<!doctype html>
<html lang="ko" style="background-color: #f0f5f5">
 <head>
	 <jsp:include page="${pageContext.request.contextPath}/WEB-INF/jsp/itman/_inc/checkSession.jsp"/>
	 <jsp:include page="${pageContext.request.contextPath}/WEB-INF/jsp/itman/_inc/title.jsp"/>
 </head>
<body>
<c:if test="${!empty empState.empStIdx}">
	<c:set var="actionUrl" value="${pageContext.request.contextPath}/itman/updateEmploState.do"/>
</c:if>
<c:if test="${empty empState.empStIdx}">
	<c:set var="actionUrl" value="${pageContext.request.contextPath}/itman/insertEmploState.do"/>
</c:if>
<c:url value="/itman/checkDuplicateEmpSta.do" var="checkDuplicateUrl"/>


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
					<p class="cont"><input id="empStName" name="empStName" type="text" value="${empState.empStName}" placeholder="직원 상태명을 입력해 주세요."></p>
				</li>
				<li>
					<p class="tit">코드번호 <span>*</span></p>
					<p class="cont"><input id="empStCode" name="empStCode" type="text" value="${empState.empStCode}" placeholder="직원상태 코드번호를 입력해 주세요."></p>
				</li>
				<!-- 비고란 -->
			</ul>
			<p class="pop_btn"><a href="javascript:;window.close();" class="del">취소</a><a href="#" onclick="checkDuplicate()" class="comp">
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
		async function checkDuplicate(){
			const empStName = document.getElementById("empStName").value.trim();
			const empStCode = document.getElementById("empStCode").value.trim();

			if(empStName === ""){
				alert("직원 상태명을 입력해주세요.");
				$("#empStName").focus();
				return false;
			}
			if(empStCode === ""){
				alert("직원 상태명을 입력해주세요.");
				$("#empStCode").focus();
				return false;
			}
			try {
				const resp = await fetch("${checkDuplicateUrl}", {
					method: "POST",
					headers: {
						"Content-Type": "application/x-www-form-urlencoded"
					},
					body: new URLSearchParams({
						empStCode: document.querySelector("input[name='empStCode']").value.trim()

					}),
				});

				const text = await resp.text();
				const code = parseInt(text.trim(), 10);

				if (code === 0) {
					alert("이미 존재하는 직원 상태 코드입니다.");
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
		</script>
</body>
</html>
