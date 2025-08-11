<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" language="java" %>


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
		<form action="/itman/assetInsert.do" method="post" id="frm" enctype="multipart/form-data" name="assetForm" onsubmit="return validateForm()">
			<input type="hidden" id="gorIdx" name="groIdx" value="${groIdx}">
			<input type="hidden" id="inGroupCnt" name="inGroupCnt" value="${inGroupCnt}">
		<ul class="adminView Write">
			<li>
				<p class="tit">일련번호(ULID)</p>
				<input type="text" id="assUlid" name="assUlid" value="${assUlid}" placeholder="분류를 선택하면 자동으로 생성" readonly>
			</li>
			<li>
				<p class="tit">자산이미지</p>
				<div class="cont filebox">
					<label for="ex_filename">파일찾기</label> 
					<input type="file" name="assImgFile" id="ex_filename" class="upload-hidden">
					<input class="upload-name" id="show-ex-filename"  value="파일선택" disabled="disabled">
					<input type="hidden" name="file_name" id="file_name" />
				</div>
			</li>
			<li>
				<p class="tit">자산명 <span>*</span></p>
				<p class="cont"><input type="text" id="ass_name" name="assName" placeholder="자산명을 입력해주세요" onkeyup='saveValue(this);'></p>
			</li>
			<li>
				<p class="tit">분류 <span>*</span></p>
				<p class="cont">
					<select id="ass_cat" name = "assCatIdx">
						<option value="">분류선택</option>
                        <c:forEach var="c" items="${categories}">
							<option value="${c.assCatIdx}" name="assCatIdx" data-code="${c.assCatCode}">${c.assCatName}</option>
						</c:forEach>
					</select>
				</p>
				<p class="edit"><a onclick="window.open('/itman/asset/contWriteAssetCategory.do', '자산분류등록팝업', 'width=500, height=335')" href="#none">분류 추가</a></p>
			</li>
			<li>
				<p class="tit">상태 <span>*</span></p>
				<p class="cont">
					<select id="state" name="staIdx">
						<option value="">상태선택</option>
						<c:forEach var="s" items="${states}">
							<option value="${s.staIdx}" name="staIdx">${s.staName}</option>
						</c:forEach>
					</select>
				</p>
				<p class="edit"><a onclick="window.open('/itman/asset/contWriteAssetState.do', '자산상태등록팝업', 'width=500, height=335')" href="#none">상태 추가</a></p>
			</li>
			<li>
				<p class="tit">위치 <span>*</span></p>
				<p class="cont">
					<input style="display:none" id = "loc_idx" name="locIdx" value="" />
					<a onclick="window.open('/itman/popup/locationPop.do', '위치등록팝업', 'width=500, height=335')" href="#none" class="popbtn">위치 선택</a><span class="name" id="loc_name"></span></p>

				<p class="edit"><a onclick="window.open('/itman/asset/contWriteAssetLocation.do', '직원등록팝업', 'width=500, height=335')" href="#none">위치 추가</a></p>
			</li>
			<li>
				<p class="tit">사용직원 <span>*</span></p>
				<input type="hidden" id= "emp_idx" name="empIdx" value="" />
				<p class="cont"><a onclick="window.open('/itman/popup/searchPop.do', '직원등록팝업', 'width=500, height=335')" href="#none" class="popbtn">직원 선택</a><span class="name" id="emp_name" value=""></span></p>
			</li>
		</ul>
		
		<h3>구매 정보</h3>
		<ul class="adminView Write">
		<li>
				<p class="tit">구매처 </p>
				<p class="cont">
				<input type="hidden" id = "sup_idx" name="sup_idx" value="" />
				<a onclick="window.open('/popup/supplierPop.do', '구매처팝업', 'width=500, height=335')" href="#none" class="popbtn">구매처 선택</a><span class="name" id="sup_name" value=""></span></p>
			
				<p class="edit"><a onclick="window.open('/itman/asset/contWriteSupplier.do', '구매처팝업', 'width=500, height=335')" href="#none">구매처 추가</a></p>
			</li>
			<li>
				<p class="tit">최초 구매일</p>
				<p class="cont"><input name="buy_date" type="text" placeholder="최초 구매일을 입력해주세요" readonly class="datepicker"></p>
			</li>
			<li>
				<p class="tit">가격(원)</p>
				<p class="cont"><input id="price" name="price" type="text" placeholder="가격(원)을 입력해주세요" on></p>
			</li>
		</ul>
		</form>
		<p class="pagebtn">
        <a href="assetsList.do" class="del">취소</a>
         
	<c:choose>
			<c:when test="${!empty supplier.supIdx}">
			<a href="#" type="submit" onclick="if(validateForm()) document.forms['assetForm'].submit(); return false" class="comp">수정</a>
		</c:when>
			<c:otherwise>
				<a href="#" type="submit" onclick="if(validateForm()) document.forms['assetForm'].submit(); return false" class="comp">추가</a>
			</c:otherwise>
			</c:choose>
		</p>

	</div>

	<jsp:include page="${pageContext.request.contextPath}/WEB-INF/jsp/itman/_inc/footer.jsp" />
</body>
	<script>
		function validateForm() {
			console.log(document.forms, document.getElementById("frm"));
			const form = document.forms["assetForm"];

			const assCatIdx = form.assCatIdx.value.trim();
			const assName = form.assName.value.trim();
			const staIdx = form.staIdx.value.trim();
			const locIdx = form.locIdx.value.trim();

			if(assCatIdx === ""){
				alert("분류를 선택하세요.");
				form.assCatIdx.focus();
				return false;
			}
			if(staIdx === ""){
				alert("상태를 선택하세요.");
				form.staIdx.focus();
				return false;
			}
			if(assName === ""){
				alert("자산명을 입력하세요.");
				form.assName.focus();
				return false;
			}
			if(locIdx === ""){
				alert("위치를 선택하세요.");
				form.locIdx.focus();
				return false;
			}
			return true;

		}
		
        /* input에 입력된 값 로컬스토리지에 저장하기 */
        function saveValue(e){
            var id = e.id;
            var val = e.value;
            sessionStorage.setItem(id, val);
        }
        
		/* 로컬스토리지에 저장된 값으로 input 채우기 */ 
		function getSavedValue(v){
            if(!sessionStorage.getItem(v)){
                // 사용자가 입력하지 않았다면 defualt 값을 반환 
                return v.value;
            }
            return sessionStorage.getItem(v);
        }



		$(document).ready(function(){

			document.getElementById('price').addEventListener('input', function (e) {
				let value = e.target.value;

				// 숫자만 남기기
				value = value.replace(/[^0-9]/g, '');

				// 천 단위 콤마 추가
				value = value.replace(/\B(?=(\d{3})+(?!\d))/g, ',');

				e.target.value = value;
			});		
			
			$.datepicker.setDefaults({
				dateFormat: 'yy-mm-dd',
				prevText: '이전 달',
				nextText: '다음 달',
				monthNames: ['1월','2월','3월','4월','5월','6월',
							 '7월','8월','9월','10월','11월','12월'],
				monthNamesShort: ['1월','2월','3월','4월','5월','6월',
								  '7월','8월','9월','10월','11월','12월'],
				dayNames: ['일','월','화','수','목','금','토'],
				dayNamesShort: ['일','월','화','수','목','금','토'],
				dayNamesMin: ['일','월','화','수','목','금','토'],
				showMonthAfterYear: true,
				yearSuffix: '년'
			});
			
			$(".datepicker").datepicker();

			if(sessionStorage.getItem("show-ex-filename") != ""){
				$("#show-ex-filename").val(sessionStorage.getItem("show-ex-filename"));
			}

			if(sessionStorage.getItem("price") != ""){
				$("#price").val(sessionStorage.getItem("price"));
			}

			var ass_name = getSavedValue("ass_name");
			$("#ass_name").val(ass_name);

			$("#ex_filename").on('change', function (e) {
				e.preventDefault();
				
				var val = $("#upload-image").val();
				if (val=="") {
					alert("이미지 파일을 선택하여 주십시오.");
					return false;
				}

				var fd = new FormData($("#frm")[0]);
				console.log(fd.get('file'));
				fd.append("file",$("input[name=file]")[0].files[0]);

				$.ajax({
					type : "post",
					url : "./ig_process/formImgTemporarySave.php",
					data: fd,
					processData: false,
					contentType: false,
				})
				.done(function(data){
					sessionStorage.setItem("show-ex-filename", data);
					$("#file_name").val(data);
				})
			  })

			const groIdx     = "${groIdx}";
			const inGroupCnt = "${inGroupCnt + 1}";

			const select = document.getElementById('ass_cat');
			const ulidInput = document.getElementById('assUlid');

			select.addEventListener('change', () => {
				const opt = select.options[select.selectedIndex];
				const assCatCode = opt.getAttribute('data-code');

				// 현재 날짜·시간 YYYYMMDDhhmmss 로 포맷팅
				const now = new Date();
				const timestamp = now.getFullYear().toString()
						+ String(now.getMonth()+1).padStart(2,'0')
						+ String(now.getDate()).padStart(2,'0')
				// 조합!
				const serial = assCatCode + '-' + timestamp + '-' + inGroupCnt;

				// input에 딱 박기
				ulidInput.value = serial;
			});

	})

		

	</script>
</html>
