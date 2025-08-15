<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!doctype html>
<html lang="ko">
 <head>
	 <jsp:include page="${pageContext.request.contextPath}/WEB-INF/jsp/itman/_inc/checkSession.jsp"/>
	 <jsp:include page="/WEB-INF/jsp/itman/_inc/title.jsp" />
	 <jsp:include page="/WEB-INF/jsp/itman/_inc/header.jsp" />
	 <link href="https://webfontworld.github.io/gmarket/GmarketSans.css" rel="stylesheet" />
	 <link rel="stylesheet" href="${pageContext.request.contextPath}/css/_css/default.css" />
 </head>
<body>

	<div id="contents">
		<div class="tit_search">
			<h2>직원 관리</h2>
		</div>
		
		<!-- 글삭제 -->
		<p class="delContent">
			<a href="#" onclick="window.open('/itman/emploDelConfirm.do?empIdx='+ ${employee.empIdx},  '삭제팝업', 'width=500, height=335')"><img alt="삭제버튼" src="../../../../../../images/_img/del_view.png"/></a>
		</p>
<%--		<p class="editContent">--%>
<%--			<a href="#" onclick="location.href='/itman/employeeEdit.do?empIdx=${employee.empIdx}'"><img alt="수정버튼" src="../../../../../../images/_img/edit_view.png"/></a>--%>
<%--		</p>--%>




		<ul class="adminView">

			<li>
				<p class="tit v02">사번</p>
				<p class="cont">${employee.empNum}</p>
				<p class="edit"><a onclick="window.open('/itman/emploNumInfoEdit.do?empIdx=' + ${employee.empIdx}, '수정팝업', 'width=500, height=335')" href="#" class="edit">수정</a></p>
			</li>
			<li>
				<p class="tit v02">이름</p>
				<p class="cont">${employee.empName}</p>
				<p class="edit"><a onclick="window.open('/itman/emploNameInfoEdit.do?empIdx=' + ${employee.empIdx}, '수정팝업', 'width=500, height=335')" href="#" class="edit">수정</a></p>
			</li>
			<li>
				<p class="tit v02">이메일</p>
				<c:choose>
					<c:when test="${employee.empMail.trim().length() > 0  || employee.empMail != null}">
						<p class="cont">${employee.empMail}</p>
					</c:when>
					<c:otherwise>
						<p class="cont">-</p>

					</c:otherwise>
				</c:choose>
				<p class="edit"><a onclick="window.open('/itman/emploMailInfoEdit.do?empIdx=' + ${employee.empIdx}, '수정팝업', 'width=500, height=335')" href="#none" class="edit">수정</a></p>
			</li>
			<li>
				<p class="tit v02">휴대폰</p>
				<c:choose>
					<c:when test="${employee.empTel.trim().length() > 0 || employee.empTel != null}">
						<p class="cont">${employee.empTel}</p>
					</c:when>
					<c:otherwise>
						<p class="cont">-</p>
					</c:otherwise>
				</c:choose>
<%--				<p class="cont">${employee.empTel}</p>--%>
				<p class="edit"><a onclick="window.open('/itman/emploTellInfoEdit.do?empIdx=' + ${employee.empIdx}, '수정팝업', 'width=500, height=335')" href="#none" class="edit">수정</a></p>
			</li>
			<li>
				<p class="tit v02">부서</p>
				<p class="cont">${employee.empDiv}</p>
				<p class="edit"><a onclick="window.open('/itman/emploDivisionInfoEdit.do?empIdx=' + ${employee.empIdx}, '수정팝업', 'width=500, height=335')" href="#none" class="edit">수정</a></p>
			</li>
			<li>
				<p class="tit v02">직위</p>
				<p class="cont">${employee.posName}</p>
				<p class="edit"><a onclick="window.open('/itman/emploPosInfoEdit.do?empIdx=' + ${employee.empIdx}, '수정팝업', 'width=500, height=335')" href="#none" class="edit">수정</a></p>
			</li>
			<li>
				<p class="tit v02">상태</p>
				<p class="cont">${employee.empState}</p>
				<p class="edit"><a onclick="window.open('/itman/emploStateInfoEdit.do?empIdx=' + ${employee.empIdx}, '수정팝업', 'width=500, height=335')" href="#none" class="edit">수정</a></p>
			</li>
		</ul>


		<h3>소유 자산</h3>
		<div class="Basic">
			<!-- 검색결과가 없을때-->


			<ul class="adminList click img">
				<li class="tit">
					<p class="img">자산 이미지</p>
					<p class="num">일련번호</p>
					<p class="tit">자산명</p>
					<p class="cate">분류</p>
					<p class="date02">최초구매일</p>
					<p class="view"></p>
				</li>
				<c:if test="${!empty assetList}">
					<c:forEach var="ass" items="${assetList}">
						<li onclick="location.href='assetsView.do?assIdx=${ass.assIdx}'">
							<p class="img"><span><img src="${pageContext.request.contextPath}/upload/assImg/${ass.image}" onerror="this.src='${pageContext.request.contextPath}/images/_img/noimg.png'" alt="자산이미지 썸네일"/></span></p>
							<p class="num">${ass.assUlid}</p>
							<p class="tit">${ass.assName}</p>
							<p class="cate">${ass.assCatName}</p>
							<p class="date02">${ass.buyDate}</p>
							<p class="view"></p>
						</li>
					</c:forEach>
				</c:if>

			</ul>
			<c:if test="${empty assetList}">
				<ul class="adminList">
					<li class="nocont">
						검색 결과가 없습니다.
					</li>
				</ul>
			</c:if>
		</div>
	</div>
	<jsp:include page="/WEB-INF/jsp/itman/_inc/footer.jsp" />
</body>
 <script type="text/javascript">
	 function confirmDelete(empIdx) {
		 if (confirm("정말 삭제하시겠습니까?")) {
			 // 삭제 진행
			 location.href = "/itman/delete.do?empIdx=" + empIdx + "&delYn=Y";
		 }
	 }
 </script>

</html>
