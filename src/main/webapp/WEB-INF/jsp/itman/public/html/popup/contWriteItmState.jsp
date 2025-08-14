<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" language="java" %>

<!doctype html>
<html lang="ko" style="background-color: #f0f5f5">
 <head>
	 <jsp:include page="${pageContext.request.contextPath}/WEB-INF/jsp/itman/_inc/title.jsp" />
 </head>
<body>

	<div id="popup">
		<div class="pop_tit">
			<p class="title">자산 상태 추가 팝업</p>
		</div>
		<div class="pop_cont">
			<form method="post" id="form" action="${pageContext.request.contextPath}/itman/asset/insertAssetState.do">
			<ul class="contEdit">
				<li>
					<p class="tit">자산 상태명<span>*</span></p>
					<p class="cont"><input type="text" id="sta_name" name="staName" placeholder="자산 상태명을 입력해주세요." value=""></p>
				</li>
				<li>
					<p class="tit">상태코드번호<span>*</span></p>
					<p class="cont"><input type="text" id="sta_code" name="staCode" placeholder="자산 상태 코드 번호를 입력해 주세요. ex)000"></p>
				</li>
			
				<!-- 비고란 -->
				<li>
					<p class="tit">비고</p>
					<p class="cont"><input type="text" name="staNote"/></p>
				</li>
				
			</ul>
			<p class="pop_btn"><a href="javascript:window.close();" class="del">취소</a><a href="#" onclick="formSubmit();" class="comp">등록</a></p>
			</form>
		</div>
	</div>
<script>

    function formSubmit(){
			$sta_name_empty = $("#sta_name").val().trim();
			$sta_code_empty = $("#sta_code").val().trim();

			if(!$sta_name_empty || !$sta_code_empty){
				alert("필수 값을 입력해주세요!");
			}else{
				// $("#stateCateForm").submit();
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