<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" language="java" %>
<?php $page_num_depth_01 = 1; ?>

<?php
    include("../_inc/dbconn.php");

	// group 불러오기
	session_start();
    $group = $_SESSION['group'];

	$schWord = "";
	if($_GET['sch_word']){
		$schWord = $_GET['sch_word'];
	}

	/**
     * pagination
     * 한페이지당 10개씩 출력
     */
    $page_per_result = 10;
    $page = 1;

	if($_GET['pageCount']){
		$page_per_result = $_GET['pageCount'];
	}

    if($_GET['page']){
        $page = $_GET['page'];
    }
	$sql = "SELECT * FROM ITM_ASSET ia 
			LEFT JOIN ITM_ASSET_CATEGORY iac ON ia.GRO_IDX = iac.GRO_IDX AND ia.ASS_CAT_IDX = iac.ASS_CAT_IDX 
			LEFT JOIN ITM_STATE ist ON ia.GRO_IDX = ist.GRO_IDX AND ia.STA_IDX = ist.STA_IDX 
			LEFT JOIN ITM_EMPLOYE ie ON ia.GRO_IDX = ie.GRO_IDX AND ia.EMP_IDX = ie.EMP_IDX 
			LEFT JOIN ITM_LOCATION il ON ia.GRO_IDX = il.GRO_IDX AND ia.LOC_IDX = il.LOC_IDX 
			LEFT JOIN ITM_SUPPLIER isu ON ia.GRO_IDX = isu.GRO_IDX AND ia.SUP_IDX = isu.SUP_IDX 
			WHERE ia.GRO_IDX=$group AND ia.STA_IDX != 5 AND ia.DEL_YN = 'N'";
	
	switch ($_GET['rangeOption']) {
		case 'all':
			$sql .= "AND (ia.ASS_ULID LIKE '%{$schWord}%' OR ia.ASS_NAME LIKE '%{$schWord}%' OR iac.ASS_CAT_NAME LIKE '%{$schWord}%') ";
			break;
		case 'ASS_ULID':
			$sql .= "AND (ia.ASS_ULID LIKE '%{$schWord}%') ";
			break;
		case 'ASS_NAME':
			$sql .= "AND (ia.ASS_NAME LIKE '%{$schWord}%') ";
			break;
		case 'ASS_CAT_NAME':
			$sql .= "AND (iac.ASS_CAT_NAME LIKE '%{$schWord}%') ";
			break;
	}
	$query_count = mysqli_query($dbconn, $sql);
	$count = mysqli_num_rows($query_count);

	$total_page = ceil($count/$page_per_result);
	if($total_page == 0){
		$total_page = 1;
	}

    $page_start= ($page-1)*$page_per_result;

    $sql .= " ORDER BY ASS_IDX DESC LIMIT $page_start, $page_per_result";

    $query = mysqli_query($dbconn, $sql);

?>


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
			<form id="frmSubmit" method="get" action="assetsList.php" >
				<p class="list_search">
					<select name="rangeOption">
						<option value="all" <? if($_GET['rangeOption'] == 'all'){ ?> selected <? } ?>>전체</option>
						<option value="ASS_ULID" <? if($_GET['rangeOption'] == 'ASS_ULID'){ ?> selected <? } ?>>일련번호</option>
						<option value="ASS_NAME" <? if($_GET['rangeOption'] == 'ASS_NAME'){ ?> selected <? } ?>>자산명</option>
						<option value="ASS_CAT_NAME" <? if($_GET['rangeOption'] == 'ASS_CAT_NAME'){ ?> selected <? } ?>>분류</option>
					</select>
					<input type="hidden" value=<?= $post_num ?> name="post_num">
					<input type="text" name="sch_word"  value="<? echo $_GET['sch_word']; ?>" placeholder="검색어를 입력해주세요.">
					<!-- <a href="javascript:frm.submit()" class="dark_btn"></a>  -->
					<!-- 임시 생성 -->
					<input type="submit" class="dark_btn" value="검색" style="height:42px; width:56px; background-color: black; color:white;"></input>
				</p>
		</div>
		<div class="num_list">
			<p class="total">총 <span><?= $count; ?></span>건의 결과가 있습니다.</p>
			<p class="view">
				<select id="pageCount" name="pageCount" >
					<option value="" <? if($_GET['pageCount'] == ''){ ?> selected <? } ?>>페이지 설정</option>
					<option value="10" <? if($_GET['pageCount'] == '10'){ ?> selected <? } ?>>10개씩보기</option>
					<option value="20" <? if($_GET['pageCount'] == '20'){ ?> selected <? } ?>>20개씩보기</option>
					<option value="40" <? if($_GET['pageCount'] == '40'){ ?> selected <? } ?>>40개씩보기</option>
				</select>
			</p>
		</div>
		</form>
		
		<!-- 글쓰기 버튼-->
		<p class="addContent"><a href="assetsWrite.jsp"><span></span><span></span><span></span></a></p>

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
					<p class="num">No</p>
					<p class="img">자산 이미지</p>
					<p class="num">일련번호</p>
					<p class="tit">자산명</p>
					<p class="cate">분류</p>
					<p class="stat">상태</p>
					<p class="name">사용 직원</p>
					<p class="loc">위치</p>
					<p class="p_info">구매처</p>
					<p class="p_date">최초구매일</p>
					<p class="p_pay">가격(원)</p>
				</li>

                <?php 
					$row_index = 0;
                    while($row = (mysqli_fetch_array($query))) {
                ?>
				<li onclick="location.href='assetsView.jsp?ASS_IDX=<?= $row['ASS_IDX']; ?>'">
					<p class="num"><?=($count - ($page - 1) * $page_per_result - $row_index)?></p>
					<p class="img"><span><img src="../upload/assetImg/<?= $row['IMAGE']?>" onerror = "this.src='../_img/noimg.png'" alt="자산이미지 썸네일"/></span></p>
					<p class="num"><?= $row['ASS_ULID']; ?></p>
					<p class="tit"><?= $row['ASS_NAME']; ?></p>
					<p class="cate"><?= $row['ASS_CAT_NAME']; ?></p>
					<p class="stat"><?= $row['STA_NAME']; ?></p>
					<div class="nameLoc">
						<p class="name"><?= $row['EMP_NAME']; ?></p>
						<p class="loc"><?= $row['LOC_NAME']; ?></p>
					</div>
					<div class="purInfo">
						<p class="p_info"><?if($row['SUP_NAME']==''){?>
						-<?}else{?><?=$row['SUP_NAME']?><?}?></p>
						<p class="p_date"><?if($row['BUY_DATE']=='0000-00-00'){?>
						-<?}else{?><?=$row['BUY_DATE']?><?}?> </p>
						<p class="p_pay"><?if($row['PRICE']==''){?>
						-<?}else{?><?=$row['PRICE']?><?}?></p>
					</div>
				</li>

                <?php $row_index++;} if($count == 0) { ?> 
                    <div style="text-align:center; margin-top:20px;">
                        일치하는 자료가 없습니다.
                    </div>    
                <?php }?>
				
			</ul>
		</div>

		<p class="paging">
                <a href="<?php echo $_SERVER["PHP_SELF"].'?page='.'1'.'&rangeOption='.$_GET['rangeOption'].'&sch_word='.$_GET['sch_word'] ;?>" class="prev end"><img src='../../../../../../images/_img/first.png' alt='맨처음'></a>
                <a href="<?php echo ($page <= 2) ? $_SERVER["PHP_SELF"].'?page=1'.'&rangeOption='.$_GET['rangeOption'].'&sch_word='.$_GET['sch_word']: $_SERVER["PHP_SELF"].'?page='.($page-1).'&rangeOption='.$_GET['rangeOption'].'&sch_word='.$_GET['sch_word'] ;?>" class="prev"><img src='../../../../../../images/_img/prev.png' alt='이전으로'></a>
                <?php for ($i = 1; $i <= $total_page ; $i++) {   ?>
                    <a class="<?php echo ($i == $page || ($page == null && $i ==1)) ? 'on' : '#' ?>" href="<?php echo $_SERVER["PHP_SELF"].'?page='.$i.'&rangeOption='.$_GET['rangeOption'].'&sch_word='.$_GET['sch_word'] ;?>"><?=$i?></a>
                <?php  }?>
                <a href="<?= $total_page <= $page?$_SERVER["PHP_SELF"].'?page='.$total_page.'&rangeOption='.$_GET['rangeOption'].'&sch_word='.$_GET['sch_word']:$_SERVER["PHP_SELF"].'?page='.($page+1).'&rangeOption='.$_GET['rangeOption'].'&sch_word='.$_GET['sch_word'];?>" class="next"><img src='../../../../../../images/_img/next.png' alt='다음으로'></a>
                <a href="<?php echo $_SERVER["PHP_SELF"].'?page='.$total_page.'&rangeOption='.$_GET['rangeOption'].'&sch_word='.$_GET['sch_word'] ;?>" class="next end"><img src='../../../../../../images/_img/last.png' alt='맨마지막'></a>
            </p>
	</div>
	<? include "../_inc/footer.php"; ?>
</body>
<script>
	$('#pageCount').on('change', function () {
		$("#frmSubmit").submit();
	})
	</script>
</html>
