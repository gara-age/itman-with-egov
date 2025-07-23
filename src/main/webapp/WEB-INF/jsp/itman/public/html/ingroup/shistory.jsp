<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" language="java" %>
<? $page_num_depth_01 = 10; ?>

<?php
    include "../_inc/dbconn.php";

	/** group 불러오기 */
	session_start();
    $group = $_SESSION['group'];
	$search = $_GET['search'];
	$orderby = $_GET['orderby'];

	/** 페이지네이션  */
	$page_per_result = 10;
	$page = 1;
	if($_GET['page'] !== null){
		$page = $_GET['page'];
	}
    
    /** 검색 */
	if (empty($search)){
		$sql =  "SELECT *,
				(
					SELECT MEM_NAME 
					FROM ITM_MEMBER member 
					WHERE log.REG_IDX = member.MEM_IDX
				) AS MEM_NAME
				FROM ITM_SYS_LOG log 
				WHERE log.GRO_IDX = $group ORDER BY SL_IDX DESC
				";
	}
	else if ($search == 'all') {
	$sql ="SELECT *,
			(
				SELECT MEM_NAME 
				FROM ITM_MEMBER member 
				WHERE log.REG_IDX = member.MEM_IDX
			) AS MEM_NAME
			FROM ITM_SYS_LOG log 
			WHERE  log.GRO_IDX = $group AND (log.SL_CAT LIKE '%$_GET[like]%' OR log.SL_CONT LIKE '%$_GET[like]%' OR log.SL_NOTE LIKE '%$_GET[like]%') ORDER BY log.SL_IDX";
	}
	else if ($search == 'cat') {
		$sql ="SELECT *,
			(
				SELECT MEM_NAME 
				FROM ITM_MEMBER member 
				WHERE log.REG_IDX = member.MEM_IDX
			) AS MEM_NAME
		 	FROM ITM_SYS_LOG log 
			WHERE log.GRO_IDX = $group AND log.SL_CAT LIKE '%$_GET[like]%' ORDER BY log.SL_IDX";
		}
	else if ($search == 'content') {
	$sql ="SELECT *,
		(
			SELECT MEM_NAME 
			FROM ITM_MEMBER member 
			WHERE log.REG_IDX = member.MEM_IDX
		) AS MEM_NAME
	 	FROM ITM_SYS_LOG log 
		WHERE log.GRO_IDX = $group AND log.SL_CONT LIKE '%$_GET[like]%' ORDER BY log.SL_IDX";
	}
	else if ($search == 'note') {
	$sql ="SELECT *,
		(
			SELECT MEM_NAME 
			FROM ITM_MEMBER member 
			WHERE log.REG_IDX = member.MEM_IDX
		) AS MEM_NAME
	 	FROM ITM_SYS_LOG log 
		LEFT JOIN ITM_MEMBER member ON log.REG_IDX = member.MEM_IDX
		WHERE  log.GRO_IDX = $group AND log.SL_NOTE LIKE '%$_GET[like]%' ORDER BY log.SL_IDX";
	}

	/** 정렬 버튼 */
	if ($_GET['orderby'] == "asc") {
		$sql = $sql." ASC";
	}else if($_GET['orderby'] == "desc"){
		$sql = $sql." DESC";
	}
	
	$count = queryCount($sql);
	
	$total_page = ceil($count/$page_per_result);

	if($total_page == 0){
		$total_page = 1;
	}

	$page_start= ($page-1)*$page_per_result;
 
	$sql .= " LIMIT $page_start, $page_per_result ";
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
			<h2>시스템 히스토리</h2>
            <form id="search" method="get" action="shistory.php">
			<p class="list_search">
				<select name="search">
					<option value="all" <?= $search == "all" ? "selected" : '' ;?>>전체</option>
					<option value="cat" <?= $search == "cat" ? "selected" : '' ;?>>분류</option>
					<option value="content" <?= $search == "content" ? "selected" : '' ;?>>내용</option>
					<option value="note" <?= $search == "note" ? "selected" : '' ;?>>비고</option>
				</select>
                <input type="text" name="like"  value="<? echo $_GET['like']; ?>" placeholder="검색어를 입력해주세요.">
				<input type="submit" class="dark_btn" value="검색" style="height:42px; width:56px; background-color: black; color:white;"></input>
			</p>
		</div>

		<div class="num_list">
			<p class="total">총 <span><?=$count?></span> 건의 결과가 있습니다.</p>
			<p class="view">
			<select name ="orderby">
					<option value="desc" <?= $orderby == "desc" ? "selected" : '' ;?>>최신순</option>
					<option value="asc" <?= $orderby == "asc" ? "selected" : '' ;?>>오래된순</option>
				</select>
			</p>
		</div>
		</form>
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
				<?php 
                while($row = (mysqli_fetch_array($query))) { ?>
					<li>
                    <p class="admin"><?= $row['MEM_NAME']?></p>
                    <p class="date"><?= $row['REG_DATE']?></p>
                    <p class="tit"><?=$row['SL_CAT']?></p>
                    <p class="stat02"><?=$row['SL_TYPE']?></p>
                    <p class="change v02"><?= $row['SL_CONT']?></p>
                    <p class="etc v02"><?= $row['SL_NOTE']?></p>
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
