<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!doctype html>
<html lang="ko" style="background-color: #f0f5f5">
 <head>
	 <jsp:include page="${pageContext.request.contextPath}/WEB-INF/jsp/itman/_inc/checkSession.jsp"/>
	 <jsp:include page="${pageContext.request.contextPath}/WEB-INF/jsp/itman/_inc/title.jsp" />
 </head>
<body>

	<div id="popup">
		<form method="post" action="/itman/updateEmploPosInfo.do" id="form">
			<input type="hidden" name="empIdx" value="${employee.empIdx}" />
		<div class="pop_tit">
			<p class="title">직위 변경</p>
		</div>
		<div class="pop_cont">
			<ul class="contEdit">
				<li>
				<p class="tit">직위 분류</p><!-- 분류, 상태, 위치, 구매처 등 셀렉 폼-->
					<p class="cont">
						<select id="POS_IDX" name="posIdx">
							<option value="" >직위를 선택해주세요.</option>

							<c:forEach var="p" items="${positionList}">

								<c:choose>
									<c:when test="${p.posIdx == employee.posIdx}">
										<c:if test="${!empty p.posIdx}">
											<option value="${p.posIdx}" selected="selected">${p.posName}</option>
										</c:if>

									</c:when>
									<c:otherwise>
										<option value="${p.posIdx}">${p.posName}</option>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</select>
					</p>
				</li>
			</ul>
			<p class="pop_btn"><a href="javascript:window.close();" class="del">취소</a><a href="#" onclick="formSubmit();" class="comp">수정</a></p>
		</div>
		</form>
	</div>
	<script>
    function formSubmit(){
        $("#form").submit();
    }
</script>
</body>
</html>
