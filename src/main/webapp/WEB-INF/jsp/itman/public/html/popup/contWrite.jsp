<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" language="java" %>

<!doctype html>
<html lang="ko" style="background-color: #f0f5f5">
 <head>
	 <jsp:include page="${pageContext.request.contextPath}/WEB-INF/jsp/itman/_inc/checkSession.jsp"/>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/jsp/itman/_inc/title.jsp" />
 </head>
<body>
<c:url value="/itman/checkDuplicateAssSta.do" var="checkDuplicateUrl"/>

	<div id="popup">
		<div class="pop_tit">
			<p class="title">자산 상태 수정 팝업</p>
		</div>
		<div class="pop_cont">
			<form method="post" id="form" action="${pageContext.request.contextPath}/itman/updateState.do">
			<input type="hidden" name="staIdx" value="${state.staIdx}" >
			<ul class="contEdit">
				<li>
					<p class="tit">자산 상태명<span>*</span></p>
					<p class="cont"><input type="text" id="sta_name" name="staName" placeholder="자산 상태명을 입력해주세요." value="${state.staName}"></p>
				</li>
				<li>
					<p class="tit">상태코드번호<span>*</span></p>
					<p class="cont"><input type="text" id="sta_code" name="staCode" placeholder="자산 상태 코드 번호를 입력해 주세요. ex)000" value="${state.staCode}"></p>
				</li>
			
				<!-- 비고란 -->
				<li>
					<p class="tit">비고</p>
					<p class="cont"><input type="text" name="staNote" value="${state.staNote}"/></p>
				</li>
			</ul>
			<p class="pop_btn"><a href="javascript:;window.close();" class="del">취소</a><a href="#" onclick="checkDuplicate();" class="comp">수정</a></p>
			</form>
		</div>
	</div>
<script>

	async function checkDuplicate(){
		$sta_name_empty = $("#sta_name").val().trim();
		$sta_code_empty = $("#sta_code").val().trim();

		if(!$sta_name_empty || !$sta_code_empty){
			alert("필수 값을 입력해주세요!");
		}else{
			try {
				const resp = await fetch("${checkDuplicateUrl}", {
					method: "POST",
					headers: {
						"Content-Type": "application/x-www-form-urlencoded"
					},
					body: new URLSearchParams({
						staCode: document.querySelector("input[name='staCode']").value.trim()

					}),
				});

				const text = await resp.text();
				const code = parseInt(text.trim(), 10);

				if (code === 0) {
					alert("이미 존재하는 상태 코드입니다.");
					$("#sta_code").focus();
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