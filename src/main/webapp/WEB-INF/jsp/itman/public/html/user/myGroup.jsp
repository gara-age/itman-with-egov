<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" language="java" %>

<!doctype html>
<html lang="ko">
 <head>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/jsp/itman/_inc/title.jsp"/>
	 <jsp:include page="${pageContext.request.contextPath}/WEB-INF/jsp/itman/_inc/header.jsp"/>
 </head>
<body id="mypage">
	<div id="contents">
		<div class="mypage_box">
			<h2><a href="/itman/myPage.do">그룹관리</a></h2>
			<ul class="groupEdit">
				<li><a onclick="window.open('/itman/addGroup.do', '그룹생성팝업', 'width=500, height=345')" href="#none" class="addBox">그룹생성하기</a></li>
				<c:if test="${!empty resultList}">
					<c:forEach var="group" items="${resultList}">
						<li>
							<p class="name">${group.groName}</p>
							<p class="btn">
								<a onclick="window.open('/itman/editGroup.do?groIdx=${group.groIdx}', 'EditPopUp', 'width=500, height=500, status=no,toolbar=no,scrollbars=no')" class="edit">수정</a>
								<a onclick="window.open('/itman/confirmGroupDel.do?groIdx=${group.groIdx}', 'EditPopUp', 'width=500, height=500, status=no,toolbar=no,scrollbars=no')" class="del">삭제</a>
							</p>
						</li>
					</c:forEach>
				</c:if>
			</ul>
		</div>
	</div>
	<? include "../_inc/footer.php"; ?>

    <!-- <form method=post action="certPass.php" name="frm">
        <input type="hidden" name="username" value=<?=$username;?>>
        <input type="hidden" name="useremail" value=<?=$useremail;?>>
        <input type="hidden" name="userpw" value=<?=$userpw;?>>
        <input type="hidden" name="userphone" value=<?=$userphone;?>>
        <input type="hidden" name="rand_num" value=<?=$rand_num;?>>
        <input type="hidden" name="mode" value=<?=$mode;?>>
    </form> -->
</body>
<script language="javascript">

//document.frm.submit();
</script>
</html>


