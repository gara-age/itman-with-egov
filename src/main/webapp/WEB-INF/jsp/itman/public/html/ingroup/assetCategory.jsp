<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" language="java" %>
<? $page_num_depth_01 = 11; ?>

<?php
    include("../_inc/dbconn.php");
	session_start();

    $group = $_SESSION['group'];
	$search = $_GET['search'];

	/** 페이지네이션  */
	 $page_per_result = 10;
	 $page = 1;
	 if($_GET['page'] !== null){
		 $page = $_GET['page'];
	 }
 
	 /** 검색 */
	 $sql = "SELECT * FROM ITM_ASSET_CATEGORY WHERE GRO_IDX = $group AND DEL_YN = 'N'";
 
	 if (empty($search)) {
		 $sql .= " ORDER BY ASS_CAT_IDX DESC";
	 }
	 else if ($search == 'all') {
		 $sql .= " AND (ASS_CAT_NAME LIKE '%$_GET[like]%' OR ASS_CAT_CODE LIKE '%$_GET[like]%') ORDER BY ASS_CAT_IDX DESC";
	 }
	 else if ($search == 'name') {
		 $sql .= " AND ASS_CAT_NAME LIKE '%$_GET[like]%' ORDER BY ASS_CAT_IDX DESC";
	 }
	 else if ($search == 'code') {
		 $sql .= " AND ASS_CAT_CODE LIKE '%$_GET[like]%' ORDER BY ASS_CAT_IDX DESC";
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
			<h2>자산 분류 관리</h2>
			<form action="assetCategory.php">
                <p class="list_search">
                    <select name="search">
						<option value="all" <?= $search == "all" ? "selected" : ''; ?>>전체</option>
						<option value="code" <?= $search == "code" ? "selected" : ''; ?>>코드</option>
						<option value="name" <?= $search == "name" ? "selected" : ''; ?>>자산 분류명</option>
                    </select>
                    <input type="text" name="like"  value="<? echo $_GET['like']; ?>" placeholder="검색어를 입력해주세요.">
					<input type="submit" class="dark_btn" value="검색" style="height:42px; width:56px; background-color: black; color:white;"></input>
				</p>
            </form>
		</div>

		<div class="num_list">
			<p class="total">총 <span><?=$count?></span>건의 결과가 있습니다.</p>
			<a href="assetCategoryExcel.jsp?search=<?= $search ?>&like=<?= $_GET['like'] ?>"
			   style="float: right; background-color: #28a745; color: white; padding: 5px 10px; border-radius: 2px; text-decoration: none; font-weight: bold;">
			   엑셀 다운로드
			</a>
		</div>

        <?=$test?>
		<!-- 글쓰기 버튼-->
		<p class="addContent"><a onclick="window.open('../popup/contWriteAssetCategory.php?idx=<?= $row['ASS_CAT_IDX']; ?>', 'EditPopUp', 'width=500, height=500, status=no,toolbar=no,scrollbars=no')" class="edit">><span></span><span></span><span></span></a></p>
		<div class="Basic">
			<ul class="adminList">
                <li class="tit">
					<p class="num">코드</p>
					<p class="tit">자산 분류명</p>
					<p class="tit">비고</p>
					<p class="editDel">관리</p>
				</li>
                <?php while($row= (mysqli_fetch_array($query))) { ?>
                    <li>
                        <p class="num"><?= $row['ASS_CAT_CODE']; ?></p>
                        <p class="tit"><?= $row['ASS_CAT_NAME']; ?></p>
						<p class="tit"><?= $row['SL_NOTE']; ?></p>
                        <p class="editDel">
							<a onclick="window.open('../popup/contEditAssetCategory.php?idx=<?= $row['ASS_CAT_IDX']; ?>', 'EditPopUp', 'width=500, height=500, status=no,toolbar=no,scrollbars=no')" class="edit">수정</a><a onclick="window.open('../popup/listDelete.php?id=asset_cate_del&target=<?= $row['ASS_CAT_IDX'] ?>', 'EditPopUp', 'width=500, height=500, status=no,toolbar=no,scrollbars=no')" class="del">삭제</a>
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