<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" language="java" %>

<!doctype html>
<html lang="ko">
 <head>
	 <jsp:include page="${pageContext.request.contextPath}/WEB-INF/jsp/itman/_inc/checkSession.jsp"/>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/jsp/itman/_inc/title.jsp" />
 </head>
<body>
	<div id="popup">
		<div class="pop_tit">
			<p class="title">그룹수정하기</p>
		</div>
		<div class="pop_cont">
            <form method="post" id="form" action="/itman/updateGroup.do" enctype="multipart/form-data">
			<input type="hidden" name="groIdx" value="${group.groIdx}" >
				<input type="hidden" name="groOwnerIdx" value="${userIdx}" />
				<input type="hidden" name="regIdx" value="${userIdx}" />
			<ul class="contEdit">
				<li>
					<p class="tit">그룹 이름</p>
					<p class="cont"><input type="text" id="gro_name" name="groName" placeholder="그룹명을 작성해주세요." value="${group.groName}"></p>
				</li>
				<li>
					<p class="tit">그룹 이미지</p>
					<div class="cont filebox">
					  <label for="ex_filename">파일찾기</label>
					  <!-- <form id="FILE_FORM" method="post" enctype="multipart/form-data" action=""> -->
						<input type="file" id="ex_filename" name="groImgFile" class="upload-hidden">
						<input class="upload-name" value="${group.groImg}" disabled="disabled">
				      <!-- </form> -->
					</div>
				</li>
				<li>
					<p class="tit">그룹 설명</p>
					<p class="cont"><textarea id="gr_note" name="groNote" placeholder="그룹 설명을 작성해주세요.">${group.groNote}</textarea></p>
				</li>
			</ul>
            <p class="pop_btn"><a href="javascript:self.close();" class="del">취소</a><a href="#" onclick="formSubmit();" class="comp">생성</a></p>
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
		 }    }
        
</script>
</html>

