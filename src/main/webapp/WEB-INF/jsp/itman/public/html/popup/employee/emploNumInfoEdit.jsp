<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!doctype html>
<html lang="ko">
 <head>
     <jsp:include page="${pageContext.request.contextPath}/WEB-INF/jsp/itman/_inc/title.jsp" />
 </head>
<body>

	<div id="popup">
		<div class="pop_tit">
			<p class="title">직원 사번 변경</p>
		</div>
		<div class="pop_cont">
            <form method="post" id="form" action="/itman/updateEmploNumInfo.do">
                <input type="hidden" name="empIdx" value="${employee.empIdx}">
			<ul class="contEdit">
				<li>
					<p class="tit">직원 사번</p> <!-- 자산명, 최초 구매일, 가격(원) 등 인풋폼-->
					<p class="cont"><input type="text" name="empNum" value="${employee.empNum}"  placeholder="변경할 사번을 입력하세요."></p>
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
