<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" language="java" %>

<!doctype html>
<html lang="ko" style="background-color: #f0f5f5">
 <head>
	 <jsp:include page="/WEB-INF/jsp/itman/_inc/title.jsp" />
 </head>
<body>

	<div id="popup">
		<div class="pop_tit">
			<p class="title">정보를 입력해주세요</p>
		</div>
		<div class="pop_cont">
			<ul class="contEdit">
				<form id="form" method="post" action="${pageContext.request.contextPath}/itman/insertEmploPosition.do" >
				<li>
					<p class="tit">상태이름 <span>*</span></p>
					<p class="cont"><input  id="pos_name" name="posName" type="text" placeholder="직원 상태명을 입력해 주세요."></p>
				</li>
				<li>
					<p class="tit">코드번호 <span>*</span></p>
					<p class="cont"><input id="pos_code" name="posCode" type="text" placeholder="직원상태 코드번호를 입력해 주세요."></p>
				</li>
				</form>
			</ul>
			<p class="pop_btn"><a href="javascript:;window.close();" class="del">취소</a><a href="#" onclick="formSubmit();" class="comp">수정</a></p>
		</div>
	</div>

	<script>
		function formSubmit(){
			$pos_name_empty = $("#pos_name").val().trim();
			$pos_code_empty = $("#pos_code").val().trim();

			if(!$pos_name_empty || !$pos_code_empty){
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
