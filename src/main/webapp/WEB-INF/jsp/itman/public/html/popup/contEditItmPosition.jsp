<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" language="java" %>

<!doctype html>
<html lang="ko" style="background-color: #f0f5f5">
 <head>
	 <jsp:include page="${pageContext.request.contextPath}/WEB-INF/jsp/itman/_inc/checkSession.jsp"/>
  <jsp:include page="${pageContext.request.contextPath}/WEB-INF/jsp/itman/_inc/title.jsp" />
 </head>
<body>
<c:url value="/itman/checkDuplicateEmpPos.do" var="checkDuplicateUrl"/>
	<div id="popup">
		<div class="pop_tit">
			<p class="title">직위 수정 팝업</p>
		</div>
		<div class="pop_cont">
			<form method="post" id="form" action="/itman/updatePosition.do">
			<ul class="contEdit">
				<li>
					<input type="hidden" id="pos_idx" name="posIdx" value="${position.posIdx}">
					<p class="tit">직위명<span>*</span></p>
					<p class="cont"><input type="text" id="pos_name" name="posName" placeholder="직위명을 입력해주세요." value="${position.posName}"></p>
				</li>
                <li>
					<p class="tit">직위 코드<span>*</span></p>
					<p class="cont"><input type="text" id="pos_code" name="posCode" placeholder="직위 코드를 입력해 주세요." value="${position.posCode}"></p>
				</li>
				<!-- 비고란 -->
				<li>
					<p class="tit">비고</p>
					<p class="cont"><input type="text" name="slNote" value="${position.slNote}"/></p>
				</li>
			</ul>
			<p class="pop_btn">
			<a href="javascript:window.close();" class="del">취소</a>
			<a href="#" onclick="checkDuplicate();" class="comp">수정</a></p>
			</form>
		</div>
	</div>
<script>
	async function checkDuplicate(){
		$pos_name_empty = $("#pos_name").val().trim();
		$pos_code_empty = $("#pos_code").val().trim();

		if(!$pos_name_empty || !$pos_code_empty){
			alert("필수 값을 입력해주세요!");
		}else{
			try {
				const resp = await fetch("${checkDuplicateUrl}", {
					method: "POST",
					headers: {
						"Content-Type": "application/x-www-form-urlencoded"
					},
					body: new URLSearchParams({
						posCode: document.querySelector("input[name='posCode']").value.trim()

					}),
				});

				const text = await resp.text();
				const code = parseInt(text.trim(), 10);

				if (code === 0) {
					alert("이미 존재하는 직위 코드입니다.");
					$("#pos_code").focus();
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
