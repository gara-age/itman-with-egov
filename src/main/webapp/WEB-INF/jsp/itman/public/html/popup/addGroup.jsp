<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" language="java" %>

<!doctype html>
<html lang="ko">
<head>
	 <jsp:include page="${pageContext.request.contextPath}/WEB-INF/jsp/itman/_inc/title.jsp" />
	 <link href="https://webfontworld.github.io/gmarket/GmarketSans.css" rel="stylesheet" />
</head>
<body>

	<div id="popup">
		<div class="pop_tit">
			<p class="title">그룹생성하기</p>
		</div>
		<div class="pop_cont">
        <form action="${pageContext.request.contextPath}/itman/insertGroup.do" name="form" id="form" method="post" enctype= "multipart/form-data">
			<input type="hidden" name="groOwnerIdx" value="${userIdx}" />
			<input type="hidden" name="regIdx" value="${userIdx}" />
			<ul class="contEdit">
				<li>
					<p class="tit">그룹 이름 <span>*</span></p>
					<p class="cont"><input type="text" id="gro_name" name="groName" placeholder="그룹명을 작성해주세요."></p>
				</li>
				<li>
					<p class="tit">그룹 이미지</p>
					<div class="cont filebox">
					  <label for="ex_filename">파일찾기</label> 
					  <input type="file" id="ex_filename" name="groImgFile" class="upload-hidden">
					  <input class="upload-name" value="파일선택" disabled="disabled">
					</div>
				</li>
				<li>
					<p class="tit">그룹 설명</p>
					<p class="cont"><textarea id="gr_note" name="groNote" placeholder="그룹 설명을 작성해주세요."></textarea></p>
				</li>
			</ul>
            <p class="pop_btn"><a href="javascript:self.close();" class="del">취소</a><a href="#" onclick="formSubmit()" class="comp">생성</a></p>
        </form>
		</div>
	</div>

</body>
<script>
function formSubmit(){

	$gro_name = $("#gro_name").val().trim();

	//그룹 이름
	if(!$gro_name){
		alert("그룹 이름은 필수입니다.");
		$("#gro_name").focus();
		return false;
	}else {
		document.forms['form'].submit();
		setTimeout(() => {
			window.opener.location.reload();
			window.close();
		}, 300);
	}

}
</script>
</html>

