<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" language="java" %>

<!doctype html>
<html lang="ko">
 <head>
  <jsp:include page="${pageContext.request.contextPath}/WEB-INF/jsp/itman/_inc/title.jsp" />
 </head>
<body>
<%
	String memTel = request.getAttribute("memTel") != null ? (String) request.getAttribute("memTel") : "";
	String phone1 = "";
	String phone2 = "";
	String phone3 = "";
	if (memTel != null && memTel.length() >= 10) {
		phone1 = memTel.substring(0, 3);
		phone2 = memTel.substring(3, 7);
		phone3 = memTel.substring(7);
	}
%>
	<div id="popup">
		<div class="pop_tit">
			<p class="title">정보 변경</p>
		</div>
		<div class="pop_cont">
			<ul class="contEdit">

		    <div class="user_box join">
            <ul class="mem">
            <form action="/itman/updatePhone.do" name="form" id="form" method="post">
                <li>
					<p>휴대폰</p>
					<div class="tel">
						<p class="full">
							<input type="hidden" id="memTel" name="memTel">
							<select id="userphone1" name="userphone1">
								<option value="010" <%= phone1.equals("010") ? "selected" : "" %>>010</option>
								<option value="011" <%= phone1.equals("011") ? "selected" : "" %>>011</option>
								<option value="012" <%= phone1.equals("012") ? "selected" : "" %>>012</option>
							</select><span>-</span><input type="tel" id="userphone2" name="userphone2" value="<%= phone2 %>"><span>-</span><input type="tel" id="userphone3" name="userphone3" value="<%= phone3 %>">
						<!-- </p><a href="#">중복<br/>확인</a> -->
					</div>
				</li>
                </form>
			</ul>
			</div>
			</ul>
			<p class="pop_btn"><a href="javascript:self.close();" class="del">취소</a><a href="javascript:submit();" class="comp">수정</a></p>
		</div></div>
	</div>

</body>
<script>
    function submit(){

    // userphone2값이 비어있으면 실행.
    if($("#userphone2").val().trim() == ""){
        alert('휴대폰 번호를 입력해주세요.');
        $("#userphone2").focus();
        return false;
    }
	// userphone3값이 비어있으면 실행.
	if($("#userphone3").val().trim() == ""){
		alert('휴대폰 번호를 입력해주세요.');
		$("#userphone3").focus();
	return false;
    }
	// userphone2값이 4이상이면 실행.
	if($("#userphone2").val().trim().length > 4){
		alert("휴대폰 형식을 확인해주세요.");
		$("#userphone2").focus();
		return false;
	}
	// userphone3값이 4이상이면 실행.
	if($("#userphone3").val().trim().length > 4){
		alert("휴대폰 형식을 확인해주세요.");
		$("#userphone3").focus();
		return false;
	}
		const p1 = document.getElementById("userphone1").value.trim();
		const p2 = document.getElementById("userphone2").value.trim();
		const p3 = document.getElementById("userphone3").value.trim();

		const fullNumber = p1 + "-" + p2 + "-" + p3;
		document.getElementById("memTel").value = fullNumber;

        form.submit();
    }
</script>
</html>
