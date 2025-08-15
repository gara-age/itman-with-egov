<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" language="java" %>

<!doctype html>
<html lang="ko" style="background-color: #f0f5f5">
 <head>
	 <jsp:include page="${pageContext.request.contextPath}/WEB-INF/jsp/itman/_inc/checkSession.jsp"/>
	 <jsp:include page="${pageContext.request.contextPath}/WEB-INF/jsp/itman/_inc/title.jsp"/>
 </head>
<body>
<c:url value="/itman/checkDuplicateAssCat.do" var="checkDuplicateUrl"/>
	<div id="popup">
		<div class="pop_tit">
			<p class="title">정보를 입력해주세요</p>
		</div>
		<div class="pop_cont">
			<ul class="contEdit">
				<form id="form" name="form" method="post" action="${pageContext.request.contextPath}/itman/insertEmploDivision.do" >
				<li>
					<p class="tit">부서명 <span>*</span></p>
					<p class="cont"><input id="div_name" name="divName" type="text" placeholder="추가할 부서명을 입력해 주세요."></p>
				</li>
				<li>
					<p class="tit">코드번호 <span>*</span></p>
					<p class="cont"><input id="div_code" name="divCode" type="text" placeholder="추가할 부서 코드번호를 입력해 주세요."></p>
				</li>
				<li>
					<p class="tit">사용유무</p>
					<p class="cont"><input type="radio" id="yes" name="divYn" value="Y"><label for="yes">사용</label> <input type="radio" id="no" name="divYn" value="N"><label for="no">사용안함</label></p>
				</li>
				<!-- 비고란 -->
				</form>
			</ul>
			<p class="pop_btn"><a href="javascript:;window.close();" class="del">취소</a><a href="#" onclick="formSubmit();" class="comp">추가</a></p>
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
