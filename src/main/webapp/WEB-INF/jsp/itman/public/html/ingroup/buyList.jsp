<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" language="java" %>
<%--
<? $page_num_depth_01 = 5; ?>

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
	$sql = "SELECT * FROM ITM_SUPPLIER WHERE GRO_IDX = $group AND DEL_YN = 'N'";

	if (empty($search)) {
		$sql .= " ORDER BY SUP_IDX DESC";
	}
	else if ($search == 'all') {
		$sql .= " AND (SUP_NAME LIKE '%$_GET[like]%' OR SUP_BNUM LIKE '%$_GET[like]%' OR SUP_MAIL LIKE '%$_GET[like]%' OR SUP_TEL LIKE '%$_GET[like]%') ORDER BY SUP_IDX DESC";
	}
	else if ($search == 'name') {
		$sql .= " AND SUP_NAME LIKE '%$_GET[like]%' ORDER BY SUP_IDX DESC";
	}
	else if ($search == 'bnum') {
		$sql .= " AND SUP_BNUM LIKE '%$_GET[like]%' ORDER BY SUP_IDX DESC";
	}
	else if ($search == 'mail') {
		$sql .= " AND SUP_MAIL LIKE '%$_GET[like]%' ORDER BY SUP_IDX DESC";
	}
	else if ($search == 'tel') {
		$sql .= " AND SUP_TEL LIKE '%$_GET[like]%' ORDER BY SUP_IDX DESC";
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
--%>

<!doctype html>
<html lang="ko">
 <head>
	 <jsp:include page="/WEB-INF/jsp/itman/_inc/title.jsp" />
	 <jsp:include page="/WEB-INF/jsp/itman/_inc/header.jsp" />
	 <link href="https://webfontworld.github.io/gmarket/GmarketSans.css" rel="stylesheet" />
	 <link rel="stylesheet" href="${pageContext.request.contextPath}/css/_css/default.css" />
 </head>
<body>
	<div id="contents">
		<div class="tit_search">
			<h2>구매처 관리</h2>
			<form action="buyList.php">
                <p class="list_search">
                    <select name="search">
						<option value="all" <?= $search == "all" ? "selected" : ''; ?>>전체</option>
						<option value="name" <?= $search == "name" ? "selected" : ''; ?>>구매처명</option>
						<option value="bnum" <?= $search == "bnum" ? "selected" : ''; ?>>사업자등록번호</option>
						<option value="mail" <?= $search == "mail" ? "selected" : ''; ?>>이메일</option>
						<option value="tel" <?= $search == "tel" ? "selected" : ''; ?>>연락처</option>
                    </select>
					<input type="text" name="like"  value="<? echo $_GET['like']; ?>" placeholder="검색어를 입력해주세요.">
					<input type="submit" class="dark_btn" value="검색" style="height:42px; width:56px; background-color: black; color:white;"></input>
				</p>
            </form>
		</div>
		<div class="num_list">
			<p class="total">총 <span><?=$count?></span>건의 결과가 있습니다.</p>
		</div>

        <?=$test?>
		<!-- 글쓰기 버튼-->
		<p class="addContent"><a onclick="window.open('../popup/contWriteItmSupplier.php?idx=<?= $row['SUP_IDX']; ?>', 'EditPopUp', 'width=500, height=500, status=no,toolbar=no,scrollbars=no')" class="edit">><span></span><span></span><span></span></a></p>
		<div class="Basic">
			<ul class="adminList">
                <li class="tit">
					<p class="num">No</p>
					<p class="tit">구매처명</p>
					<p class="bnum">사업자등록번호</p>
					<p class="mail">이메일</p>
					<p class="tel">연락처</p>
					<p class="editDel">관리</p>
				</li>
                <?php 
				$row_index=0;
				while ($row= (mysqli_fetch_array($query))) {?>
                    <li>
                        <p class="num"><?=($count - ($page - 1) * $page_per_result - $row_index)?></p>
                        <p class="tit"><?= $row['SUP_NAME']; ?></p>
						<p class="bnum"><?= $row['SUP_BNUM']; ?></p>
						<p class="mail"><?= $row['SUP_MAIL']==""?"-":$row['SUP_MAIL']; ?></p>
                        <p class="tel"><?= $row['SUP_TEL']==""?"-":$row['SUP_TEL']; ?></p>
                        <p class="editDel">
							<a onclick="window.open('../popup/contEditItmSupplier.php?idx=<?= $row['SUP_IDX']; ?>', 'EditPopUp', 'width=500, height=500, status=no,toolbar=no,scrollbars=no')" class="edit">수정</a><a onclick="window.open('../popup/listDelete.php?id=buy_del&target=<?= $row['SUP_IDX'] ?>', 'EditPopUp', 'width=500, height=500, status=no,toolbar=no,scrollbars=no')" class="del">삭제</a>
						</p>
                    </li>
				<?php $row_index++;} if($count == 0) { ?> 
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

	<jsp:include page="/WEB-INF/jsp/itman/_inc/footer.jsp" />

</body>
</html>

<%--<?php--%>
<%--	function queryCount($sql){--%>
<%--		include "../_inc/dbconn.php";--%>
<%--		$query_count = mysqli_query($dbconn, $sql);--%>
<%--        $count =mysqli_num_rows($query_count); --%>
<%--		return $count;--%>
<%--	}--%>

<%--?>--%>