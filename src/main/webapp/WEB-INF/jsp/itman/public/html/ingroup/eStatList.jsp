<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" language="java" %>
<?php $page_num_depth_01 = 8;

    include "../_inc/dbconn.php";

	/** group 불러오기 */
	session_start();
    $group = $_SESSION['group'];
	$search = $_GET['search'];
	$state_count_sql = ""; 

	/** 페이지네이션  */
	$page_per_result = 10;
	$page = 1;
	if($_GET['page'] !== null){
		$page = $_GET['page'];
	}

	/** 검색 */
	$sql = "SELECT *,(SELECT count(*) FROM ITM_EMPLOYE WHERE GRO_IDX = IES.GRO_IDX AND EMP_ST_IDX = IES.EMP_ST_IDX AND DEL_YN = 'N') AS EMP_CNT FROM ITM_EMP_STATE IES WHERE GRO_IDX = $group AND DEL_YN = 'N'";

	if (empty($search)) {
		$sql .= " ORDER BY EMP_ST_IDX DESC";
	}
	else if ($search == 'all') {
		$sql .= " AND (EMP_ST_NAME LIKE '%$_GET[like]%' OR SL_NOTE LIKE '%$_GET[like]%') ORDER BY EMP_ST_IDX DESC";
	}
	else if ($search == 'name') {
		$sql .= " AND EMP_ST_NAME LIKE '%$_GET[like]%' ORDER BY EMP_ST_IDX DESC";
	}
	else if ($search == 'note') {
		$sql .= " AND SL_NOTE LIKE '%$_GET[like]%' ORDER BY EMP_ST_IDX DESC";
	}
	$count = queryCount($sql);
	
	$total_page = ceil($count/$page_per_result);

	if($total_page == 0){
		$total_page = 1;
	}
	
	$page_start= ($page-1)*$page_per_result;

	$sql .= " LIMIT $page_start, $page_per_result ";
	$query = mysqli_query($dbconn, $sql);

	function staToAssetCount($emp_st_idx){	
		$emp_count_sql = "SELECT count(*) FROM ITM_EMPLOYE WHERE GRO_IDX = '{$group}' AND EMP_ST_IDX = '{$emp_st_idx}' AND DEL_YN = 'N' ";
		$emp_count_query = mysqli_query($dbconn, $emp_count_sql);
		$result = mysqli_fetch_array($emp_count_query);
		return $result[0];
	}

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
			<h2>직원 상태 관리</h2>
			<form id="search" method="get" action="eStatList.php">
			<p class="list_search">
				<select name="search">
					<option value="all" <?= $search == "all" ? "selected" : ''; ?>>전체</option>
					<option value="name" <?= $search == "name" ? "selected" : ''; ?>>상태이름</option>
					<option value="note" <?= $search == "note" ? "selected" : ''; ?>>비고</option>
                </select>
                    <input type="text" name="like"  value="<? echo $_GET['like']; ?>" placeholder="검색어를 입력해주세요.">
					<input type="submit" class="dark_btn" value="검색" style="height:42px; width:56px; background-color: black; color:white;"></input>
			</p>
		</div>
</form>

		<div class="num_list">
			<p class="total">총 <span><?=$count?></span>건의 결과가 있습니다.</p>
		</div>

		<!-- 글쓰기 버튼-->
		<p class="addContent"><a onclick="window.open('../popup/contWriteItmEmpState.php?idx=<?= $row['EMP_ST_IDX']; ?>', 'EditPopUp', 'width=500, height=500, status=no,toolbar=no,scrollbars=no')" class="edit">><span></span><span></span><span></span></a></p>

			<div class="Basic">
			<ul class="adminList">
				<li class="tit">
					<p class="num">No</p>
					<p class="tit">상태 이름</p>
					<p class="num">직원수</p>
					<p class="tit">비고</p>
					<p class="editDel">관리</p>
				</li>

				<?php 
                while($row = (mysqli_fetch_array($query))) { ?>
					<li>
                    <p class="num"><?= $row['EMP_ST_CODE']?></p>
                    <p class="tit"><?= $row['EMP_ST_NAME']?></p>
                    <p class="num"><?=$row['EMP_CNT']?></p>
                    <p class="tit"><?= $row['SL_NOTE']?></p>
					<p class="editDel">
						<a onclick="window.open('../popup/contWriteEmpState.php?idx=<?= $row['EMP_ST_IDX']; ?>', 'EditPopUp', 'width=500, height=500, status=no,toolbar=no,scrollbars=no')" class="edit">수정</a><a onclick="window.open('../popup/contEmpDel.php?id=empsta_del&target=<?= $row['EMP_ST_IDX'] ?>', 'EditPopUp', 'width=500, height=500, status=no,toolbar=no,scrollbars=no')" class="del">삭제</a>
					</p>
				</li>				
                <?php } if($count == 0) { ?> 
                    <div style="text-align:center; margin-top:20px;">
                        일치하는 자료가 없습니다.
                    </div>    
                <?php }?>

			</ul>
		</div>
		<p class="paging">
                <a href="<?php echo $_SERVER["PHP_SELF"].'?page='.'1' ;?>" class="prev end"><img src='../../../../../../images/_img/first.png' alt='맨처음'></a>
                <a href="<?php echo ($page <= 2) ? $_SERVER["PHP_SELF"].'?page=1': $_SERVER["PHP_SELF"].'?page='.($page-1) ;?>" class="prev"><img src='../../../../../../images/_img/prev.png' alt='이전으로'></a>
                <?php for ($i = 1; $i <= $total_page ; $i++) {   ?>
                    <a class="<?php echo ($i == $page || ($page == null && $i ==1)) ? 'on' : '#' ?>" href="<?php echo $_SERVER["PHP_SELF"].'?page='.$i ;?>"><?=$i?></a>
                <?php  }?>
                <a href="<?= $total_page <= $page?$_SERVER["PHP_SELF"].'?page='.$total_page:$_SERVER["PHP_SELF"].'?page='.($page+1);?>" class="next"><img src='../../../../../../images/_img/next.png' alt='다음으로'></a>
                <a href="<?php echo $_SERVER["PHP_SELF"].'?page='.$total_page ;?>" class="next end"><img src='../../../../../../images/_img/last.png' alt='맨마지막'></a>
            </p>
	</div>
		
	<? include "../_inc/footer.php"; ?>
</body>
</html>

<?php
	function queryCount($sql){
		include "../_inc/dbconn.php";
		$query_count = mysqli_query($dbconn, $sql);
        $count =mysqli_num_rows($query_count); 
		return $count;
	}

?>
