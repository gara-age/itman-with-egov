<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" language="java" %>
<%--<?php--%>
<%--    include("../_inc/dbconn.php");--%>
<%--    --%>
<%--	session_start();--%>
<%--    $group = $_SESSION['group'];--%>

<%--	$src = "";--%>
<%--    $sql = "SELECT * FROM ITM_ASSET WHERE ASS_IDX={$_GET['ASS_IDX']}";--%>
<%--    $result = mysqli_query($dbconn, $sql);--%>
<%--    $row = mysqli_fetch_array($result);--%>

<%--    $ITM_ASSET_CATEGORY = "SELECT * FROM ITM_ASSET_CATEGORY WHERE ASS_CAT_IDX={$row['ASS_CAT_IDX']}";--%>
<%--    $ITM_ASSET_CATEGORY_result = mysqli_query($dbconn, $ITM_ASSET_CATEGORY);--%>
<%--    $ITM_ASSET_CATEGORY_row = mysqli_fetch_array($ITM_ASSET_CATEGORY_result);--%>

<%--    $STA_IDX = "SELECT * FROM ITM_STATE WHERE STA_IDX={$row['STA_IDX']}";--%>
<%--    $STA_IDX_result = mysqli_query($dbconn, $STA_IDX);--%>
<%--    $STA_IDX_row = mysqli_fetch_array($STA_IDX_result);--%>

<%--    $ITM_EMPLOYEE = "SELECT * FROM ITM_EMPLOYE WHERE EMP_IDX={$row['EMP_IDX']}";--%>
<%--    $ITM_EMPLOYEE_result = mysqli_query($dbconn, $ITM_EMPLOYEE);--%>
<%--    $ITM_EMPLOYEE_row = mysqli_fetch_array($ITM_EMPLOYEE_result);--%>

<%--    $LOC_IDX = "SELECT * FROM ITM_LOCATION WHERE LOC_IDX={$row['LOC_IDX']}";--%>
<%--    $LOC_IDX_result = mysqli_query($dbconn, $LOC_IDX);--%>
<%--    $LOC_IDX_row = mysqli_fetch_array($LOC_IDX_result);--%>

<%--    $SUP_IDX = "SELECT * FROM ITM_SUPPLIER WHERE SUP_IDX={$row['SUP_IDX']}";--%>
<%--    $SUP_IDX_result = mysqli_query($dbconn, $SUP_IDX);--%>
<%--    $SUP_IDX_row = mysqli_fetch_array($SUP_IDX_result);--%>

<%--    $ITM_ASS_LOG = "SELECT *, --%>
<%--					(--%>
<%--						SELECT MEM_NAME FROM ITM_MEMBER im --%>
<%--						WHERE il.REG_IDX = im.MEM_IDX --%>
<%--					) AS MEM_NAME --%>
<%--	 				FROM ITM_ASS_LOG il--%>
<%--					WHERE il.ASS_IDX= '{$_GET['ASS_IDX']}' --%>
<%--					ORDER BY il.AL_IDX DESC";--%>
<%--    $ITM_ASS_LOG_result = mysqli_query($dbconn, $ITM_ASS_LOG);--%>

<%--	$ITM_HARDWARE = "SELECT * FROM ITM_HARDWARE WHERE ASS_IDX = {$_GET['ASS_IDX']}";--%>
<%--	$ITM_HARDWARE_RESULT = mysqli_query($dbconn, $ITM_HARDWARE);--%>
<%--	$ITM_HARDWARE_ROW = mysqli_fetch_array($ITM_HARDWARE_RESULT);--%>

<%--	$ITM_HARDWARE_OS_ARR = explode('', $ITM_HARDWARE_ROW['OS']);--%>

<%--	$ITM_HARDWARE_CPU_ARR = explode('', $ITM_HARDWARE_ROW['CPU']);--%>


<%--	$ITM_HARDWARE_MEMORY_ARR = explode('', $ITM_HARDWARE_ROW['MEMORY']);--%>
<%--	$ITM_HARDWARE_MEMORY = "";--%>


<%--	$ITM_SOFTWARE = "SELECT * FROM ITM_SOFTWARE WHERE ASS_IDX = {$_GET['ASS_IDX']}";--%>
<%--	$ITM_SOFTWARE_RESULT = mysqli_query($dbconn, $ITM_SOFTWARE);--%>

<%--	if ($row['IMAGE'] == "") {--%>
<%--		$src = 'src="../_img/noimg.png" style="width:50px"';--%>
<%--	}else{--%>
<%--		$src = 'src="../upload/assetImg/'.$row['IMAGE'].' "alt="자산사진"';--%>
<%--	}--%>
<%--?>--%>

<%--<? $page_num_depth_01 = 1; ?>--%>

<!doctype html>
<html lang="ko">
 <head>
	 <jsp:include page="${pageContext.request.contextPath}/WEB-INF/jsp/itman/_inc/title.jsp" />
	 <jsp:include page="${pageContext.request.contextPath}/WEB-INF/jsp/itman/_inc/header.jsp" />
	 <link href="https://webfontworld.github.io/gmarket/GmarketSans.css" rel="stylesheet" />
	 <link rel="stylesheet" href="${pageContext.request.contextPath}/css/_css/default.css" />
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
				<span><img id="img" src="" onerror="this.src='${pageContext.request.contextPath}/images/_img/noimg.png'"/></span>
				<!-- 이미지없을때 <span><img src="_img/noimg.png" style="width:50px" alt="이미지없음"/></span> -->
				<p class="filebox">
				  <label for="filename">파일찾기</label> 
				  <form id="FILE_FORM" method="post" enctype="multipart/form-data" action="">
					<input type="file" id="filename" class="upload-hidden" style="display:none">
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
		$("#filename").change(function(e){
			var form = $('#FILE_FORM')[0];
			var formData = new FormData(form);
			formData.append("fileObj", $("#filename")[0].files[0]);
			formData.append("ass_idx", "<?=$_GET['ASS_IDX']?>");
			$.ajax({
				url: './ig_process/assetChangeImage_proc.php',
				enctype		: 'multipart/form-data',
				processData	: false,
				contentType	: false,
				data: formData,
				type: 'POST',
				success: function(result){
					if(result === '-1'){
						alert("jpg, jpeg, gif, png 확장자만 가능합니다.");
					}else if(result === '0'){
						alert("사진 변경중 에러가 발생 하였습니다.");
					}else{
						console.log(result);
						alert("사진 변경에 성공하였습니다.");
						
						$imgSrc = "../upload/assetImg/"+result;
						var regex = / /gi;
						$imgSrc = $imgSrc.replace(regex, "");
						$("#img").attr("src", $imgSrc );
					}
				}
				});
		})
	</script>
</body>
</html>