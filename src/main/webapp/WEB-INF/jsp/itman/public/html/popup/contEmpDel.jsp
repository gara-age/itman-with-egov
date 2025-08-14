<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" language="java" %>

<!doctype html>
<html lang="ko" style="background-color: #f0f5f5">
 <head>
  <jsp:include page="${pageContext.request.contextPath}/WEB-INF/jsp/itman/_inc/title.jsp" />
 </head>
<body>

	<div id="popup">
		<form method="post" name="form" action="${pageContext.request.contextPath}/itman/deleteEmploState.do" >
			<input type="hidden" name="empStIdx" value="${empState.empStIdx}">
		<div class="pop_tit">
			<p class="title">삭제하시겠습니까?</p>
		</div>
		<div class="pop_cont">
			<ul class="contEdit">
				<li>
					<p class="tit">비고</p>
					<p class="cont"><input type="text" name="slNote"/></p>
				</li>
			</ul>
			<p class="pop_btn"><a href="javascript:;window.close();" class="del">취소</a><a href="#" onclick="formSubmit()" class="comp">삭제</a></p>
		</div>
		</form>
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


