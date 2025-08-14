<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" language="java" %>

<!doctype html>
<html lang="ko" style="background-color: #f0f5f5">
 <head>
	 <jsp:include page="${pageContext.request.contextPath}/WEB-INF/jsp/itman/_inc/title.jsp"/>
 </head>
<body>

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
		function formSubmit(){
			$div_name_empty = $("#div_name").val().trim();
			$div_code_empty = $("#div_code").val().trim();

			if(!$div_name_empty || !$div_code_empty){
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
