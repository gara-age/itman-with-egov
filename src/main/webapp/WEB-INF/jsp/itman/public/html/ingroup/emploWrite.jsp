<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!doctype html>
<html lang="ko">
 <head>
	 <jsp:include page="/WEB-INF/jsp/itman/_inc/title.jsp" />
	 <jsp:include page="/WEB-INF/jsp/itman/_inc/header.jsp" />
	 <link href="https://webfontworld.github.io/gmarket/GmarketSans.css" rel="stylesheet" />
	 <link rel="stylesheet" href="${pageContext.request.contextPath}/css/_css/default.css" />
	 <link rel="stylesheet" href="${pageContext.request.contextPath}/css/_css/bbs.css" />
	 <link rel="stylesheet" href="${pageContext.request.contextPath}/css/_css/comn.css" />
	 <link rel="stylesheet" href="${pageContext.request.contextPath}/css/_css/pc.css" />
	 <link rel="stylesheet" href="${pageContext.request.contextPath}/css/_css/respon.css" />
 </head>
<body>
	<div id="contents">
		<div class="tit_search">
			<h2>직원 관리</h2>
		</div>

		<c:set var="actionUrl" value="/itman/insert.do" />
		<c:if test="${!empty employee.empIdx}">
			<c:set var="actionUrl" value="/itman/update.do" />
		</c:if>
		<form method="post" id='write' name="employeeForm" action="${actionUrl}" onsubmit="return validateForm()">
			<c:if test="${!empty employee.empIdx}">
				<input type="hidden" name="empIdx" value="${employee.empIdx}" />
			</c:if>
			<ul class="adminView Write">
			<li>
				<p class="tit">사번 <span>*</span></p>
				<p class="cont">
					<c:choose>
					<c:when test="${!empty employee.empIdx}">
						<input id="EMP_NUM" type="text" name="empNum" value="${employee.empNum }" />
					</c:when>
					<c:otherwise>
						<input id="EMP_NUM" type="text" name="empNum" placeholder="사번을 입력해주세요"  value="${employee.empNum }" />
					</c:otherwise>
				</c:choose>
				</p>
			</li>
			<li>
				<p class="tit">이름 <span>*</span></p>
				<p class="cont">
					<c:choose>
						<c:when test="${!empty employee.empIdx}">
							<input id="EMP_NAME" type="text" name="empName" value="${employee.empName }" />
						</c:when>
						<c:otherwise>
							<input id="EMP_NAME" type="text" name="empName" placeholder="이름을 입력해주세요" value="${employee.empName }" />
						</c:otherwise>
					</c:choose>
				</p>
			</li>
			<li>
				<p class="tit">이메일 <span></span></p>
				<p class="cont">
					<c:choose>
						<c:when test="${!empty employee.empIdx}">
							<input id="EMP_MAIL" type="text" name="empMail" value="${employee.empMail }" />
						</c:when>
						<c:otherwise>
							<input id="EMP_MAIL" type="text" name="empMail" placeholder="이메일을 입력해주세요." value="${employee.empMail }" />
						</c:otherwise>
					</c:choose>
				</p>
			</li>
			<li>
				<p class="tit">휴대폰 <span></span></p>
				<p class="cont">
				<c:choose>
					<c:when test="${!empty employee.empIdx}">
						<input id="EMP_TEL" type="text" name="empTel" value="${employee.empTel }" />
					</c:when>
					<c:otherwise>
						<input id="EMP_TEL" type="text" name="empTel" placeholder="휴대폰번호를 입력해주세요." value="${employee.empTel }" />
					</c:otherwise>
				</c:choose>
				</p>
			</li>
			<li>
				<p class="tit">부서 <span>*</span></p>
				<p class="cont">
					<select id="DIV_IDX" name="divIdx">
							<option value="" >부서를 선택해주세요</option>
							<c:forEach var="d" items="${divisionList}">
								<c:choose>
									<c:when test="${d.divIdx == employee.divIdx}">
										<c:if test="${!empty d.divIdx}">
											<option value="${d.divIdx}" selected="selected">${d.divName}</option>
										</c:if>

									</c:when>
									<c:otherwise>
										<option value="${d.divIdx}">${d.divName}</option>
									</c:otherwise>
								</c:choose>
							</c:forEach>
					</select>
				</p>
                <p class="edit"><a onclick="window.open('/itman/emploDivisionWrite.do', '부서등록팝업', 'width=500, height=335')" href="#none">부서 추가</a></p>
			</li>
			<li>
				<p class="tit">직위 <span>*</span></p>
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
				<p class="edit"><a onclick="window.open('/itman/emploPositionWrite.do', '자산분류등록팝업', 'width=500, height=335')" href="#none">직위 추가</a></p>
			</li>
			<li>
				<p class="tit">상태 <span>*</span></p>
				<p class="cont">
					<select id="EMP_ST_IDX" name="empStIdx">
						<option value="">상태를 선택해주세요.</option>
						<c:forEach var="s" items="${empStateList}">

							<c:choose>
								<c:when test="${s.empStIdx == employee.empStIdx}">
									<c:if test="${!empty s.empStIdx}">
										<option value="${s.empStIdx}" selected="selected">${s.empStName}</option>
									</c:if>

								</c:when>
								<c:otherwise>
									<option value="${s.empStIdx}">${s.empStName}</option>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</select>
				</p>
				<p class="edit"><a onclick="window.open('/itman/emploStateWrite.do', '자산분류등록팝업', 'width=500, height=335')" href="#none">상태 추가</a></p>
			</li>
		</ul>
		</form>

		<p class="pagebtn"><a href="/itman/employeeList.do" class="del">취소</a>
		<c:choose>
			<c:when test="${!empty employee.empIdx}">
				<a href="#" type="submit" class="comp" onclick="if(validateForm()) document.forms['employeeForm'].submit(); return false"
				>수정</a>
			</c:when>
			<c:otherwise>
				<a href="#" type="submit" class="comp" onclick="if(validateForm()) document.forms['employeeForm'].submit(); return false"
				>추가</a>
			</c:otherwise>
		</c:choose>
		</p>
	</div>
	<jsp:include page="/WEB-INF/jsp/itman/_inc/footer.jsp" />

	<script>
		function validateForm() {
			const form = document.forms["employeeForm"];

			const empNum = form.empNum.value.trim();
			const empName = form.empName.value.trim();
			const empDivIdx = form.divIdx.value.trim();
			const empPosIdx = form.posIdx.value.trim();
			const empStIdx = form.empStIdx.value.trim();


			if (empNum === "") {
				alert("사번을 입력하세요.");
				form.empNum.focus();
				return false;
			}

			if (empName === "") {
				alert("이름을 입력하세요.");
				form.empName.focus();
				return false;
			}

			if (empDivIdx === "") {
				alert("부서를 선택하세요.");
				form.divIdx.focus();
				return false;
			}

			if (empPosIdx === "") {
				alert("직위를 선택하세요.");
				form.posIdx.focus();
				return false;
			}

			if (empStIdx === "") {
				alert("상태를 선택하세요.");
				form.empStIdx.focus();
				return false;
			}

			return true;
		}
	</script>
</body>
</html>
