<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" language="java" %>

<!doctype html>
<html lang="ko" style="background-color: #f0f5f5">
 <head>
 <style>
    @layer default, comn;
 </style>
  <jsp:include page="${pageContext.request.contextPath}/WEB-INF/jsp/itman/_inc/title.jsp" />
 </head>
<body>
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
					<p class="cont"><input type="text" id="pos_code" name="posCode" placeholder="직위 연락처를 입력해 주세요." value="${position.posCode}"></p>
				</li>
				<!-- 비고란 -->
				<li>
					<p class="tit">비고</p>
					<p class="cont"><input type="text" name="slNote" value="${position.slNote}"/></p>
				</li>
			</ul>
			<p class="pop_btn">
			<a href="javascript:window.close();" class="del">취소</a>
			<a href="#" onclick="formSubmit();" class="comp">수정</a></p>
			</form>
		</div>
	</div>
<script>
    function formSubmit(){
		$pos_name = $("#pos_name").val().trim();
		$pos_code = $("#pos_code").val().trim();
		if(!$pos_name || !$pos_code){
			alert("필수 값을 입력해주세요!");
		}else{
			document.forms["form"].submit();
			setTimeout(() => {
			    window.opener.location.reload();
			    window.close();
			}, 300);
		}
    }

</script>
</body>
</html>
