<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" language="java" %>

<!doctype html>
<html lang="ko">
 <head>
	 <jsp:include page="${pageContext.request.contextPath}/WEB-INF/jsp/itman/_inc/title.jsp" />
 </head>
<body>

	<div id="popup">
		<div class="pop_tit">
			<p class="title">자산 분류 추가 팝업</p>
		</div>
		<div class="pop_cont">
            <form method="post" id="form" action="${pageContext.request.contextPath}/itman/asset/insertAssetCategory.do">
			<ul class="contEdit">
				<li>
					<p class="tit">분류이름 <span>*</span></p>
					<p class="cont"><input type="text" id="ass_cat_name" name="assCatName" value=""></p>
				</li>
				<li>
					<p class="tit">코드번호 <span>*</span></p>
					<p class="cont"><input type="text" id="ass_cat_code" name="assCatCode" value="" placeholder="자산 일련번호에 사용될 코드 번호 입니다."></p>
				</li>
				<!-- 비고란 -->
				<li>
					<p class="tit">비고</p>
					<p class="cont"><input name="slNote" type="text" /></p>
				</li>
			</ul>
			<p class="pop_btn"><a href="javascript:window.close();" class="del">취소</a><a href="#" onclick="formSubmit();" class="comp">작성</a></p>
		</form>
		</div>
	</div>
<script>

    function formSubmit(){
			$ass_cat_name_empty = $("#ass_cat_name").val().trim();
			$ass_cat_code_empty = $("#ass_cat_code").val().trim();

			if(!$ass_cat_name_empty || !$ass_cat_code_empty){
				alert("필수 값을 입력해주세요!");
			}else{
				document.forms['form'].submit();

				setTimeout(() => {
					window.opener.location.reload();
					window.close();
				} ,300)
			}


		}

</script>
</body>
</html>
