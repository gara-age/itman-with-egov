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
 </head>
<body>
	<div id="contents">
		<div class="tit_search">
			<h2>부서 관리</h2>
		</div>
		
		<!-- 글삭제 -->
		<p class="delContent">
			<a href="#" onclick="confirmDelete(${division.divIdx})"><img alt="삭제버튼" src="../../../../../../images/_img/del_view.png"/></a>
		</p>
		<p class="editContent">
			<a href="#" onclick="location.href='/itman/departEdit.do?divIdx=${division.divIdx}'"><img alt="수정버튼" src="../../../../../../images/_img/edit_view.png"/></a>
		</p>



		<ul class="adminView">
			<li>
				<p class="tit v02">부서코드</p>
				<p class="cont">${division.divCode}</p>
			</li>
			<li>
				<p class="tit v02">부서명</p>
				<p class="cont">${division.divName}</p>
			</li>
			<li>
				<p class="tit v02">부서위치</p>
				<p class="cont">${division.divLoc}</p>
			</li>
			<li>
				<p class="tit v02">연락처</p>
				<p class="cont">${division.divTel}</p>
			</li>
			<li>
				<p class="tit v02">사용여부</p>
				<p class="cont">${division.divYn}</p>
			</li>
		</ul>

		<h3>소속 직원</h3>
		<div class="Basic">
			<!-- 검색결과가 없을때
				<ul class="adminList">
					<li class="nocont">
					 검색 결과가 없습니다.
					</li>
				</ul>
			-->

			<ul class="adminList click img">
				<li class="tit">
					<p class="img">자산 이미지</p>
					<p class="num">일련번호</p>
					<p class="tit">자산명</p>
					<p class="cate">분류</p>
					<p class="date02">최초구매일</p>
					<p class="view"></p>
				</li>
			</ul>
		</div>
	</div>
	<jsp:include page="/WEB-INF/jsp/itman/_inc/footer.jsp" />
</body>
 <script type="text/javascript">
	 function confirmDelete(divIdx) {
		 if (confirm("정말 삭제하시겠습니까?")) {
			 // 삭제 진행
			 location.href = "/itman/departDelete.do?divIdx=" + divIdx + "&delYn=Y";
		 }
	 }
 </script>

</html>
