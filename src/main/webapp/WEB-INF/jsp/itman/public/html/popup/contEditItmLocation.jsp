<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" language="java" %>

<!doctype html>
<html lang="ko" style="background-color: #f0f5f5">
 <head>
	 <jsp:include page="${pageContext.request.contextPath}/WEB-INF/jsp/itman/_inc/checkSession.jsp"/>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/jsp/itman/_inc/title.jsp"/>
 </head>
<body>
	<div id="popup">
		<div class="pop_tit">
			<p class="title">자산 위치 수정 팝업</p>
		</div>
		<div class="pop_cont">
			<form method="post" id="form" action="${pageContext.request.contextPath}/itman/updateLocation.do">
			<input type="hidden" name="locIdx" value="${location.locIdx}" >
			<ul class="contEdit">
				<li>
					<p class="tit">자산 위치명<span>*</span></p>
					<p class="cont"><input type="text" id="loc_name" name="locName" placeholder="자산 위치 명을 입력해주세요." value="${location.locName}"></p>
				</li>
				<li>
					<p class="tit">자산 위치 코드번호<span>*</span></p>
					<p class="cont"><input type="text" id="loc_code" name="locCode" placeholder="자산 위치 코드 번호를 입력해 주세요. ex)000" value="${location.locCode}"></p>
				</li>
				
				<!-- 비고란 -->
				<li>
					<p class="tit">비고</p>
					<p class="cont"><input type="text" name="slNote" value="${location.slNote}"/></p>
				</li>
			</ul>
			<p class="pop_btn"><a href="javascript:window.close();" class="del">취소</a><a href="#" onclick="formSubmit();" class="comp">수정</a></p>
			</form>
		</div>
	</div>
<script>
	
     function formSubmit(){
			$loc_name_empty = $("#loc_name").val().trim();
			$loc_code_empty = $("#loc_code").val().trim();

			if(!$loc_name_empty || !$loc_code_empty){
				alert("필수 값을 입력해주세요!");
			}else{
				document.forms['form'].submit();
				setTimeout(() => {
					window.opener.location.reload();
					window.close();
				}, 300);
			}
		}

</script>
</body>
</html>
