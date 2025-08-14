<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" language="java" %>

<!doctype html>
<html lang="ko">
 <head>
	 <jsp:include page="${pageContext.request.contextPath}/WEB-INF/jsp/itman/_inc/checkSession.jsp"/>
	 <jsp:include page="${pageContext.request.contextPath}/WEB-INF/jsp/itman/_inc/title.jsp" />
	 <jsp:include page="${pageContext.request.contextPath}/WEB-INF/jsp/itman/_inc/header.jsp" />
	 <link href="https://webfontworld.github.io/gmarket/GmarketSans.css" rel="stylesheet" />
 </head>
<body>

	<div id="contents">
		<div class="tit_search">
			<h2>자산 관리</h2>
		</div>
<%--		<input type="hidden" id="gorIdx" name="groIdx" value="${groIdx}">--%>
		<!-- 글삭제 -->
		<p class="delContent"><a onclick="window.open('/itman/asset/confirmAssetDel.do?assIdx=${asset.assIdx}', '삭제팝업', 'width=500, height=300')" href="#none"><img src="../../../../../../images/_img/del_view.png"></a></p>

		<div class="viewTop">
			<div class="img">
				<span><img id="img" src="${pageContext.request.contextPath}/upload/assImg/${asset.image}" onerror="this.src='${pageContext.request.contextPath}/images/_img/noimg.png'"/></span>
				<!-- 이미지없을때 <span><img src="_img/noimg.png" style="width:50px" alt="이미지없음"/></span> -->
				<p class="filebox">
				  <label for="filename">파일찾기</label> 
				  <form id="FILE_FORM" method="post" enctype="multipart/form-data" action="/itman/asset/updateAssetPictureInfo.do">
				<input type="hidden" name="assIdx" value="${asset.assIdx}">
				<input type="file" id="filename" name="assImgFile" class="upload-hidden" style="display:none">
				  </form>
				</p>
			</div>
			<ul class="adminView">
				<li>
					<p class="tit">일련번호(ULID)</p>
					<p class="cont">${asset.assUlid}</p>
				</li> 
				<li>
					<p class="tit">자산명</p>
					<p class="cont">${asset.assName}</p>
					<p class="edit">
<%--						<a onclick="window.open('<?='../popup/asset/assetNameInfoEdit.php?ass_idx='.$row['ASS_IDX']?>', '수정팝업', 'width=500, height=300')" href="#" class="edit">수정</a>--%>
						<a onclick="window.open('/itman/asset/assetNameInfoEdit.do?assIdx=${asset.assIdx}', '수정팝업', 'width=500, height=300')" href="#" class="edit">수정</a>
					</p>
				</li> 
				<li>
					<p class="tit">분류</p>
					<p class="cont">${asset.assCatName}</p>
					<p class="edit"><a onclick="window.open('/itman/asset/assetCategoryInfoEdit.do?assIdx=${asset.assIdx}', '수정팝업', 'width=500, height=300')" href="#none" class="edit">수정</a></p>
				</li> 
				<li>
					<p class="tit">최초 등록 일시</p>
					<p class="cont">${asset.regDate}</p>
				</li>
				<li>
					<p class="tit">상태</p>
					<p class="cont">${asset.assStaName}</p>
					<p class="edit"><a onclick="window.open('/itman/asset/assetStateInfoEdit.do?assIdx=${asset.assIdx}', '수정팝업', 'width=500, height=300')" href="#none" class="edit">수정</a></p>
				</li> 
				<li>
					<p class="tit">위치</p>
					<p class="cont">${asset.assLocName}</p>
					<p class="edit"><a onclick="window.open('/itman/asset/assetLocationInfoEdit.do?assIdx=${asset.assIdx}', '수정팝업', 'width=500, height=300')" href="#none" class="edit">수정</a></p>
				</li> 
				<li>
					<p class="tit">사용직원</p>
					<p class="cont">${asset.assEmpName}</p>
					<input type="hidden" id= "emp_idx" name="empIdx" value="" />
					<p class="edit"><a onclick="window.open('/itman/asset/assetEmployeeInfoEdit.do?assIdx=${asset.assIdx}', '수정팝업', 'width = 500, height = 630')" href="#none" class="edit">수정</a></p>
				</li>
				<li>
					<p class="tit">최종 수정 일시</p>
					<p class="cont">${asset.modDate}</p>
				</li> 
			</ul>
		</div>

		<h3>구매 정보</h3>
		<ul class="adminView v02">
			<li>
				<p class="tit">구매처</p>
				<p class="cont">
					<c:choose>
						<c:when test="${asset.assSupName != null and asset.assSupName != ''}">
							${asset.assSupName}
						</c:when>
						<c:otherwise>
							-
						</c:otherwise>
					</c:choose>
				</p>
				<p class="edit"><a onclick="window.open('/itman/asset/assetSupplyInfoEdit.do?assIdx=${asset.assIdx}', '직원등록팝업', 'width=500, height=335')" href="#" class="edit">수정</a></p>
			</li> <br/>
			<li>
				<p class="tit">최초 구매일</p>
				<p class="cont">
					<c:choose>
						<c:when test="${asset.buyDate != null and asset.buyDate != ''}">
							${asset.buyDate}
						</c:when>
						<c:otherwise>
							-
						</c:otherwise>
					</c:choose>
				</p>
				<p class="edit"><a onclick="window.open('/itman/asset/assetBuyDateInfoEdit.do?assIdx=${asset.assIdx}', '직원등록팝업', 'width=500, height=335')" href="#" class="edit">수정</a></p>
			</li> <br/>
			<li>
				<p class="tit">가격(원)</p>
				<p class="cont">
					<c:choose>
						<c:when test="${asset.price != null and asset.price != ''}">
							${asset.price}
						</c:when>
						<c:otherwise>
							-
						</c:otherwise>
					</c:choose>
				</p>
				<p class="edit"><a onclick="window.open('/itman/asset/assetPriceInfoEdit.do?assIdx=${asset.assIdx}', '직원등록팝업', 'width=500, height=335')" href="#" class="edit">수정</a></p>
			</li> <br/>
		</ul>

		<h3>부속품 정보</h3>
		<div class="table_box">
			<table>
				<colgroup><col width="100px"><col width="auto"></colgroup>
				<tbody>
					<tr>
						<th>OS</th>
<%--						<td><?=$ITM_HARDWARE_OS_ARR[0]?></td>--%>
						<td>${hardware.os}</td>

					</tr>
					<?php ?>
					<tr>
						<th>CPU</th>
<%--						<td><?=$ITM_HARDWARE_CPU_ARR[0]?></td>--%>
						<td>${hardware.cpu}</td>
					</tr>
					<tr>
						<th>MEMORY</th>
						<td>
<%--							<?php foreach($ITM_HARDWARE_MEMORY_ARR as $memory){--%>
<%--								echo($memory."<br>");--%>
<%--								};?>--%>
						${hardware.memory}
						</td>
					</tr>
				</tbody>
			</table>
		</div>

		<h3>소프트웨어 정보</h3>
		<div class="table_box">
			<table>
				<colgroup><col width="*"></colgroup>
				<thead>
					<tr>
						<th>Name</th>
						<th>Vendor</th>
						<th>Version</th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${!empty software}" >
						<c:forEach var="s" items="${software}">
							<tr>
								<td>${s.swName}</td>
								<td>${s.swCom}</td>
								<td>${s.swVer}</td>
							</tr>
						</c:forEach>
					</c:if>
				</tbody>
			</table>
		</div>

		<h3>히스토리</h3>
		<div class="Basic">
			<ul class="adminList history">
				<li class="tit">
					<p class="admin">처리자</p>
					<p class="date">일시</p>
					<p class="tit">분류</p>
					<p class="stat02">활동 구분</p>
					<p class="change v02">내용</p>
					<p class="etc v02">비고</p>
				</li>
				<c:if test="${!empty assLogList}">
					<c:forEach var="log" items="${assLogList}">
						<li>
							<p class="admin">${log.memName}</p>
							<p class="date">${log.regDate}</p>
							<p class="tit">${log.alCat}</p>
							<p class="stat02">${log.alCat}</p>
							<p class="change v02">${log.alCont}</p>
							<p class="etc v02">${log.alNote}</p>
						</li>
					</c:forEach>
				</c:if>
			</ul>
		</div>
	</div>
	<jsp:include page="${pageContext.request.contextPath}/WEB-INF/jsp/itman/_inc/footer.jsp" />
	<script>
		document.getElementById("filename").addEventListener("change", function() {
			const fileInput = this;
			const filePath = fileInput.value; // 선택된 파일 경로
			const allowedExtensions = /(\.jpg|\.jpeg|\.png)$/i;

			if (!allowedExtensions.exec(filePath)) {
				alert("JPG, JPEG, PNG 파일만 업로드 가능합니다.");
				fileInput.value = ""; // 선택 초기화
				return false;
			}

			// 확장자 통과 → 폼 제출
			document.getElementById("FILE_FORM").submit();
			alert("사진 변경에 성공하였습니다.");
		});
	</script>
</body>
</html>