<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" language="java" %>

<!doctype html>
<html lang="ko">
 <head>
  <? 
  	include "../_inc/dbconn.php";
    include "../_inc/title.php"; 
    include '../_inc/loginTest.php';
    login_check();

    $group = $_SESSION['group'];
	$REG_IDX = $_SESSION['userIDX'];

	$group_sql = "SELECT * FROM ITM_GROUP WHERE REG_IDX = $REG_IDX";
	$group_query = mysqli_query($dbconn, $group_sql);
	
	// 기존 값 불러오기
	$idx = $_GET['idx'];
	$sql = "SELECT * FROM ITM_GROUP WHERE GRO_IDX = $idx";
	$query = mysqli_query($dbconn, $sql);
	$valueRow = mysqli_fetch_array($query);

    if (is_null($row['IMAGE'])) {
		$src = 'src="_img/noimg.png" style="width:50px" alt="이미지없음"';
	}else{
		$src = 'src="../_img/assetImg/'.$row['IMAGE'].' "alt="표준PC"';
	}
  ?>
 </head>
<body>

	<div id="popup">
		<div class="pop_tit">
			<p class="title">그룹수정하기</p>
		</div>
		<div class="pop_cont">
            <form method="post" id="itmGroupForm" action="updateGroup_proc.jsp" enctype="multipart/form-data">
			<input type="hidden" name="gro_idx" value="<?= $valueRow['GRO_IDX']; ?>" >
			<ul class="contEdit">
				<li>
					<p class="tit">그룹 이름</p>
					<p class="cont"><input type="text" name="gro_name" placeholder="그룹명을 작성해주세요." value="<?= $valueRow['GRO_NAME']; ?>"></p>
				</li>
				<li>
					<p class="tit">그룹 이미지</p>
					<div class="cont filebox">
					  <label for="ex_filename" onclick="openImg()">파일찾기</label> 
					  <!-- <form id="FILE_FORM" method="post" enctype="multipart/form-data" action=""> -->
					    <input type="file" id="filename" name="image" class="upload-hidden" >
						<input class="upload-name" value="<?= $valueRow['GRO_IMG']; ?>" disabled="disabled">
				      <!-- </form> -->
					</div>
				</li>
				<li>
					<p class="tit">그룹 설명</p>
					<p class="cont"><textarea id="gr_note" name="gr_note" placeholder="그룹 설명을 작성해주세요."><?= $valueRow['GRO_NOTE']; ?></textarea></p>
				</li>
			</ul>
            <p class="pop_btn"><a href="javascript:self.close();" class="del">취소</a><a href="javascript:formSubmit();" class="comp">생성</a></p>
        	</form>
		</div>
	</div>

</body>
<script>
	function openImg() {
		$("#filename").click();
	  }
     function formSubmit(){
        $("#itmGroupForm").submit();
    }
        
</script>
</html>

