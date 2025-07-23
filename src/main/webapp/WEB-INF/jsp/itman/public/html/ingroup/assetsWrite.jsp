<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" language="java" %>
<?php
    include "../_inc/dbconn.php";

	session_start();
    $group = $_SESSION['group'];

	$ass_cat_code = "";

    $ITM_ASSET_CATEGORY = "SELECT * FROM ITM_ASSET_CATEGORY WHERE GRO_IDX=$group";

    $ITM_ASSET_CATEGORY_result = mysqli_query($dbconn, $ITM_ASSET_CATEGORY);

    $STA_IDX = "SELECT * FROM ITM_STATE";
    $STA_IDX_result = mysqli_query($dbconn, $STA_IDX);
    $STA_IDX_row = mysqli_fetch_array($STA_IDX_result);

    $ITM_EMPLOYEE = "SELECT * FROM ITM_EMPLOYE WHERE GRO_IDX=$group";
    $ITM_EMPLOYEE_result = mysqli_query($dbconn, $ITM_EMPLOYEE);
    $ITM_EMPLOYEE_row = mysqli_fetch_array($ITM_EMPLOYEE_result);

    $LOC_IDX = "SELECT * FROM ITM_LOCATION WHERE GRO_IDX=$group";
    $LOC_IDX_result = mysqli_query($dbconn, $LOC_IDX);

    $SUP_IDX = "SELECT * FROM ITM_SUPPLIER WHERE GRO_IDX=$group";
    $SUP_IDX_result = mysqli_query($dbconn, $SUP_IDX);

	$STATE_SQL = "SELECT * FROM ITM_STATE WHERE GRO_IDX = $group";
	$STATE_RESULT = mysqli_query($dbconn, $STATE_SQL);

	


?>

<? $page_num_depth_01 = 1; ?>

<!doctype html>
<html lang="ko">
 <head>
  <? include "../_inc/title.php"; ?>
 </head>
<body>
	<? include "../_inc/header.php"; ?>
	<div id="contents">
		<div class="tit_search">
			<h2>자산 관리</h2>
		</div>
		<form action="ig_process/assetsWrite_proc.jsp" method="post" id="frm" enctype="multipart/form-data">
		<ul class="adminView Write">
			<li>
				<p class="tit">일련번호(ULID)</p>
				<input type="text" id="ULID" name="ULID" value="" placeholder="분류와 직원을 선택하면 자동으로 생성" readonly>
			</li>
			<li>
				<p class="tit">자산이미지</p>
				<div class="cont filebox">
					<label for="ex_filename">파일찾기</label> 
					<input type="file" name="file" id="ex_filename" class="upload-hidden">
					<input class="upload-name" id="show-ex-filename"  value="파일선택" disabled="disabled">
					<input type="hidden" name="file_name" id="file_name" />
				</div>
			</li>
			<li>
				<p class="tit">자산명 <span>*</span></p>
				<p class="cont"><input type="text" id="ass_name" name="ass_name" placeholder="자산명을 입력해주세요" onkeyup='saveValue(this);'></p>
			</li>
			<li>
				<p class="tit">분류 <span>*</span></p>
				<p class="cont">
					<select id="ass_cat" name = "ass_cat_idx">
						<option value="">분류선택</option>
                        <?php while($cate_row = (mysqli_fetch_array($ITM_ASSET_CATEGORY_result))) { ?>
						    <option name="<?=$cate_row['ASS_CAT_CODE']?>" value="<?=$cate_row['ASS_CAT_IDX']?>"><?= $cate_row['ASS_CAT_NAME']; ?></option>
                        <?php }; ?>
					</select>
				</p>
				<p class="edit"><a onclick="window.open('../popup/contWriteAssetCategory.php', '자산분류등록팝업', 'width=500, height=335')" href="#none">분류 추가</a></p>
			</li>
			<li>
				<p class="tit">상태 <span>*</span></p>
				<p class="cont">
					<select id="state" name="state">
						<?php 
							while($row = (mysqli_fetch_array($STATE_RESULT))) { ?>
								<option value="<?= $row['STA_IDX']; ?>"><?= $row['STA_NAME']; ?></option>
						<?php } ?>
					</select>
				</p>
				<p class="edit"><a onclick="window.open('../popup/contWriteItmState.php', '자산상태등록팝업', 'width=500, height=335')" href="#none">상태 추가</a></p>
			</li>
			<li>
				<p class="tit">위치 <span>*</span></p>
				<p class="cont">
				<input style="display:none" id = "loc_idx" name="loc_idx" value="" />
				<a onclick="window.open('../popup/LocationPop.php', '위치등록팝업', 'width=500, height=335')" href="#none" class="popbtn">위치 선택</a><span class="name" id="loc_name"></span></p>

				<p class="edit"><a onclick="window.open('../popup/contWriteItmLocation.php', '직원등록팝업', 'width=500, height=335')" href="#none">위치 추가</a></p>
			</li>
			<li>
				<p class="tit">사용직원 <span>*</span></p>
				<input type="hidden" id= "emp_idx" name="emp_idx" value="" />
				<p class="cont"><a onclick="window.open('../popup/searchPop.php', '직원등록팝업', 'width=500, height=335')" href="#none" class="popbtn">직원 선택</a><span class="name" id="emp_name" value=""></span></p>
			</li>
		</ul>
		
		<h3>구매 정보</h3>
		<ul class="adminView Write">
		<li>
				<p class="tit">구매처 </p>
				<p class="cont">
				<input style="display:none" id = "sup_idx" name="sup_idx" value="" />
				<a onclick="window.open('../popup/supplierPop.php', '구매처팝업', 'width=500, height=335')" href="#none" class="popbtn">구매처 선택</a><span class="name" id="sup_name"></span></p>
			
				<p class="edit"><a onclick="window.open('../popup/contWriteItmSupplier.php', '구매처팝업', 'width=500, height=335')" href="#none">구매처 추가</a></p>
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

		<p class="pagebtn">
        <a href="assetsList.php" class="del">취소</a>
         
        <a href="javascript:formSubmit();" class="comp">등록</a></p>

	</form>
	</div>

	<? include "../_inc/footer.php"; ?>
</body>
	<script>
		function formSubmit(){
			$ass_name_empty = $("#ass_name").val().trim()
			$loc_name_empty = $("#loc_name").html().trim();
			if(!$ass_name_empty){
				alert("자산명을 입력해 주세요!");
			}else if(!$ass_name_empty){
				alert("위치를 선택해 주세요!");
			}
			else{
				$ULID = $("#ULID").val().replace(/ /g, '');
				sessionStorage.clear();
				$("#ULID").val($ULID);
				$("#file_name").val($("#show-ex-filename").val());
				$("#frm").submit();
			}	
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


			$('#ass_cat').on('change', function () {
				console.log("2");
				console.log(<?=$group?>);
				console.log($("#ass_cat").val());
				console.log($("#emp_idx").val());
				if(<?=$group?> !="" && $("#ass_cat").val() !="" && $("#emp_idx").val() != ""){
					$.ajax({
					  url: "./ig_process/assetAutoULID_proc.php",
					  type: 'POST',
					  data: {
						gro_idx: <?=$group?>,
						ass_cat_idx: $(this).val(),
						emp_idx:  $("#emp_idx").val()
					  },
					  dataType: 'json',
					  success: function(res) {
						if (res.status === 'success') {
						  console.log("생성된 ULID:", res.ulid);
						  $("#ULID").val(res.ulid);
						} else {
						  alert('ULID 생성 실패: ' + res.message);
						}
					  },
					  error: function(xhr, status, error) {
						console.error('AJAX 오류:', status, error);
					  }
					});		
				}
        	})
			
			$('#emp_idx').on('change', function () {
				if(<?=$group?> !="" && $("#ass_cat").val() !="" && $("#emp_idx").val() != ""){
					$.ajax({
					  url: "./ig_process/assetAutoULID_proc.php",
					  type: 'POST',
					  data: {
						gro_idx: <?=$group?>,
						ass_cat_idx: $("#ass_cat").val(),
						emp_idx:  $("#emp_idx").val()
					  },
					  dataType: 'json',
					  success: function(res) {
						if (res.status === 'success') {
						  console.log("생성된 ULID:", res.ulid);
						  $("#ULID").val(res.ulid);
						} else {
						  alert('ULID 생성 실패: ' + res.message);
						}
					  },
					  error: function(xhr, status, error) {
						console.error('AJAX 오류:', status, error);
					  }
					});		
				}
        	})

		 	/*const changeLocation = document.querySelector("#loc_name");

			changeLocation.addEventListener("DOMSubtreeModified", (e) =>{
				$ulid_cat = $.trim($ulid_cat);
				$.ajax({
					url: "./ig_process/assetsChangeBy.jsp",
					data : {which : 'loca' ,
							ulid_cat : $ulid_cat,
							loc_idx : $("#loc_idx").val()},
					method : "GET",
				})
				.done(function(data){
					var datas = data.split('*');
					$ulid_loc = $.trim(datas[0]);
					$num = Number(datas[1]);
					$num += 1;
					$num = (String($num).padStart(4, "0"));
					$("#ULID").val($ulid_cat+"-"+$ulid_loc+"-"+$num);
				});
			});*/

	})

		

	</script>
</html>
