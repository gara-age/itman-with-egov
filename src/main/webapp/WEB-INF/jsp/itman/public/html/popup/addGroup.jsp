<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" language="java" %>

<!doctype html>
<html lang="ko">
 <head>
	 <jsp:include page="${pageContext.request.contextPath}/WEB-INF/jsp/itman/_inc/title.jsp" />
	 <link href="https://webfontworld.github.io/gmarket/GmarketSans.css" rel="stylesheet" />
	 <link rel="stylesheet" href="${pageContext.request.contextPath}/css/_css/default.css" />
 </head>
<body>

	<div id="popup">
		<div class="pop_tit">
			<p class="title">그룹생성하기</p>
		</div>
		<div class="pop_cont">
        <form action="pp_process/addGroup_proc.jsp" name="frm" id="frm" method="post" enctype= "multipart/form-data">
			<ul class="contEdit">
				<li>
					<p class="tit">그룹 이름</p>
					<p class="cont"><input type="text" id="gr_name" name="gr_name" placeholder="그룹명을 작성해주세요."></p>
				</li>
				<li>
					<p class="tit">그룹 이미지</p>
					<div class="cont filebox">
					  <label for="ex_filename">파일찾기</label> 
					  <input type="file" id="ex_filename" name="image" class="upload-hidden">
					  <input class="upload-name" value="파일선택" disabled="disabled">
					</div>
				</li>
				<li>
					<p class="tit">그룹 설명</p>
					<p class="cont"><textarea id="gr_note" name="gr_note" placeholder="그룹 설명을 작성해주세요."></textarea></p>
				</li>
			</ul>
            <p class="pop_btn"><a href="javascript:self.close();" class="del">취소</a><a href="javascript:fn_submit();" class="comp">생성</a></p>
        </form>
		</div>
	</div>

</body>
<script language="javascript">
		$doubleSubmitFlag = false;
function fn_submit(){
    //그룹 이름
	if($("#gr_name").val().trim() == ""){
		alert("그룹 이름은 필수입니다.");
		$("#gr_name").focus();
		return false;
	}else if(!$doubleSubmitFlag){
		$doubleSubmitFlag = true;
		frm.submit();
	}

}
</script>
</html>

