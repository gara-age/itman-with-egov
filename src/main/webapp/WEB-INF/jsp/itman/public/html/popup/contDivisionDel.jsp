<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" language="java" %>

<!doctype html>
<html lang="ko">
 <head>
	 <jsp:include page="${pageContext.request.contextPath}/WEB-INF/jsp/itman/_inc/title.jsp"/>
 </head>
<body>

	<div id="popup">
		<div class="pop_tit">
			<p class="title">삭제하시겠습니까?</p>
		</div>
		<form method="post" name="form" action="${pageContext.request.contextPath}/itman/deleteDepart.do">
			<input type="hidden" name="divIdx" value="${division.divIdx}">
		<div class="pop_cont">
			<ul class="contEdit">
				<li>
					<p class="tit">비고</p>
					<p class="cont"><input name="slNote" type="text"/></p>
				</li>
			</ul>
			<p class="pop_btn"><a href="javascript:;window.close();" class="del">취소</a><a href="#" onclick="deleteDivision()" class="comp">삭제</a></p>
	</div>
		</form>
	</div>
<script>
	function deleteDivision(){
		document.forms['form'].submit();

		setTimeout(() => {
			window.opener.location.reload();
			window.close();
		}, 300);
	}
</script>
</body>
</html>


