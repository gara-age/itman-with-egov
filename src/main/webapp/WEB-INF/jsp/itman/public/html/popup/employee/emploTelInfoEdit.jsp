<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!doctype html>
<html lang="ko" style="background-color: #f0f5f5">
 <head>
     <jsp:include page="${pageContext.request.contextPath}/WEB-INF/jsp/itman/_inc/title.jsp" />
 </head>
<body>

	<div id="popup">
		<div class="pop_tit">
			<p class="title">직원 휴대폰 변경</p>
		</div>
		<div class="pop_cont">
            <form method="post" id="form" action="/itman/updateEmploTelInfo.do">
                <input type="hidden" name="empIdx" value="${employee.empIdx}">
			<ul class="contEdit">
				<li>
					<p class="tit">직원 휴대폰</p> <!-- 자산명, 최초 구매일, 가격(원) 등 인풋폼-->
					<p class="cont"><input type="text" name="empTel" value="${employee.empTel}"  placeholder="변경할 휴대폰 번호를 입력하세요."></p>
				</li>
				<!-- 비고란 -->
			</ul>
            </form>
			<p class="pop_btn"><a href="javascript:window.close();" class="del">취소</a><a href="javascript:formSubmit();" class="comp">수정</a></p>
		</div>
	</div>
<script>
    function formSubmit(){
        $("#form").submit();
    }
</script>
</body>
</html>
