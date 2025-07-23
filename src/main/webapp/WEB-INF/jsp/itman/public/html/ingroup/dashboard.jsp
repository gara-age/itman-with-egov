<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" language="java" %>
<?php $page_num_depth_01 = 0;

include("../_inc/dbconn.php");

/**  히스토리는 최신순 10개만 뜨게 설정해 놓았습니다. */

/** group 불러오기 */
session_start();
$group = $_SESSION['group'];
$state_count_sql = ""; 

$asset_SQL = "SELECT *,(SELECT count(*) FROM ITM_ASSET WHERE GRO_IDX = '{$group}' AND STA_IDX = '{$sta_idx}') as cnt FROM ITM_ASS_LOG log 
	LEFT JOIN ITM_ASSET asset ON log.ASS_IDX = asset.ASS_IDX
	LEFT JOIN ITM_MEMBER member ON log.REG_IDX = member.MEM_IDX
	WHERE asset.GRO_IDX = $group ORDER BY AL_IDX DESC
	limit 0, 10 ";
$asset_query = mysqli_query($dbconn, $asset_SQL);

$sys_SQL = "SELECT * FROM ITM_SYS_LOG log
	LEFT JOIN ITM_MEMBER member ON log.REG_IDX = member.MEM_IDX
	WHERE log.REG_IDX = $group ORDER BY SL_IDX DESC
	limit 0, 10";
$sys_query = mysqli_query($dbconn, $sys_SQL);

$state_SQL = "SELECT *,(SELECT COUNT(*) FROM ITM_ASSET WHERE GRO_IDX = $group and STA_IDX = ITS.STA_IDX and DEL_YN = 'N') as STA_CNT FROM ITM_STATE ITS WHERE GRO_IDX = $group AND DEL_YN = 'N'";
$sta_query = mysqli_query($dbconn, $state_SQL);

function staToAssetCount($sta_idx){
	$state_count_sql = "SELECT count(*) FROM ITM_ASSET WHERE GRO_IDX = '{$group}' AND STA_IDX = '{$sta_idx}'";
	$state_count_query = mysqli_query($dbconn, $state_count_sql);
	$result = mysqli_fetch_array($state_count_query);
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

	<div id="contents" class="dashboard">
		<div class="overflow">
			<div class="Basic f_r">
				<div class="base_tit">
					<p class="tit">자산 상태표</p>
					<p class="more"><a href="aStatList.php"><img src="../../../../../../images/_img/more.png" alt="더보기" /></a></p>
				</div>
				<ul class="adminList history">
					<li class="tit">
						<p class="admin">상태값</p>
						<p class="date">수량</p>
					</li>
					
					<?php 
						while($row = (mysqli_fetch_array($sta_query))){
					?>
					<li>
						<p class="admin"><?=$row['STA_NAME']?></p>
						<p class="date"><?=$row['STA_CNT']?></p>
					</li>
				<?php }; ?>
				</ul>
			</div>

			<div class="Basic f_l">
				<div class="base_tit mt">
					<p class="tit">자산 히스토리</p>
					<p class="more"><a href="ahistory.php"><img src="../../../../../../images/_img/more.png" alt="더보기" /></a></p>
				</div>
				<ul class="adminList history">
					<li class="tit">
						<p class="admin">처리자</p>
						<p class="date">일시</p>
						<p class="tit">자산명</p>
						<p class="stat02">활동 구분</p>
						<p class="type">분류</p>
						<p class="change">내용</p>
					</li>
					
					<?php 
						while($row = (mysqli_fetch_array($asset_query))){
					?>
					<li>
						<p class="admin"><?=$row['MEM_NAME']?></p>
						<p class="date"><?=$row['REG_DATE']?></p>
						<p class="tit"><?=$row['ASS_NAME']?></p>
						<p class="stat02"><?=$row['AL_TYPE']?></p>
						<div class="typeChange">
							<p class="type"><?=$row['AL_CAT']?></p>
							<p class="change"><?=$row['AL_CONT']?></p>
						</div>
					</li>
					<?php }; ?>
				</ul>
			</div>
		</div>
		<!-- <div class="overflow mt">
			<div class="Basic f_l">
				<div class="base_tit">
					<p class="tit">시스템 히스토리</p>
					<p class="more"><a href="shistory.jsp"><img src="../_img/more.png" alt="더보기" /></a></p>
				</div>
				<ul class="adminList history">
					<li class="tit">
						<p class="admin">처리자</p>
						<p class="date">일시</p>
						<p class="tit">분류</p>
						<p class="stat02">활동 구분</p>
						<p class="change">내용</p>
					</li>
					<?php 
						while($row = (mysqli_fetch_array($sys_query))){
					?>
					<li>
						<p class="admin"><?=$row['MEM_NAME']?></p>
						<p class="date"><?= $row['REG_DATE']?></p>
						<p class="tit"><?=$row['SL_CAT']?></p>
						<p class="stat02"><?=$row['SL_TYPE']?></p>
						<p class="change"><?= $row['SL_CONT']?></p>
					</li>
					<?php }; ?>
				</ul>
			</div>
		</div> -->
	</div>

	<? include "../_inc/footer.php"; ?>

	<!-- 자산 상태표 차트 -->
	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);
    </script>
</body>
</html>
