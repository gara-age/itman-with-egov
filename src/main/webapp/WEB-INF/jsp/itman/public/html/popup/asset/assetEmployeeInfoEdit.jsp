<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" language="java" %>
<?php
	include "../../_inc/dbconn.php";

	/**
	 * 세션 체크
	 */
	include "../../_inc/loginTest.php";
	login_check();

	$GROUP = $_SESSION['group'];
	$ASS_IDX = $_GET['ass_idx'];

	$schWord = "";

	if($_POST['sch_word']){
		$schWord = $_POST['sch_word'];
	}
	//echo($schWord);

	/**
     * pagination
     * 한페이지당 10개씩 출력
     */
    $page_per_result = 5;
    $page = 1;

    if($_POST['page']){
        $page = $_POST['page'];
    }

	$sql = "SELECT * FROM ITM_EMPLOYE ie
			LEFT JOIN ITM_DIVISION id ON ie.DIV_IDX = id.DIV_IDX
			LEFT JOIN ITM_POSITION ip ON ie.POS_IDX = ip.POS_IDX
			WHERE ie.GRO_IDX = $GROUP AND ie.DEL_YN = 'N'";
	
	if($schWord != ""){
			$sql .= "AND (ie.EMP_NAME LIKE '%{$schWord}%' OR ie.EMP_NUM LIKE '%{$schWord}%' OR id.DIV_NAME LIKE '%{$schWord}%') ";
	}

	$query_count = mysqli_query($dbconn, $sql);
	$count = mysqli_num_rows($query_count);
	$total_page = ceil($count/$page_per_result);
	if($total_page == 0){
		$total_page = 1;
	}

    $page_start= ($page-1)*$page_per_result;

    $sql .= " ORDER BY ie.GRO_IDX DESC LIMIT $page_start, $page_per_result";
    $query = mysqli_query($dbconn, $sql);

?>

<!doctype html>
<html lang="ko">
 <head>
  <?php include "../../_inc/title.php"; ?>
 </head>
<body>

   <div id="popup">
      <div class="pop_tit">
         <p class="title">직원 찾기</p>
      </div>
      <div class="pop_cont">
         <ul class="contEdit">
            <li>
            <form action="./assetEmployeeInfoEdit.php?ass_idx=<?=$ASS_IDX?>" id="frm" method="post" > 
               <p class="cont">
				  <input type="hidden" id="frm_page" name="page" value="<?=$page?>"/>
                  <input type="text" name="sch_word" value="<?=$schWord?>"  placeholder="직원 이름을 작성해주세요." class="search"><a href="javascript:form_submit();">직원 검색</a>
               </p>
               </form>
            </li>
         </ul>
         <ul class="popList">
<!--             <li class="nocont">검색결과가 없습니다.</li> -->
            <?php
               while($row = (mysqli_fetch_array($query))) {
            ?>
            <li><a href="javascript:onClick(<?=$row['EMP_IDX'];?>);"><span class="tit" id = <?="emp_name".$row['EMP_IDX']?>><?= $row['EMP_NAME']?></span>
            <span class="sub" id = "<?=$row['POS_IDX'];?>"> <?=$row['DIV_NAME']?> / <?=$row['POS_NAME']?> / <?= $row['EMP_MAIL']?></spen></span>
            </a></li>
            <input type="hidden" id="<?=$row['EMP_IDX'];?>" value="<?=$row['EMP_IDX'];?>"/>
            <?php };?>
         </ul>
		 <p class="paging">
                <a href="javascript:form_page_submit(1)" class="prev end"><img src='../../../../../../../images/_img/first.png' alt='맨처음'></a>
                <a href="<?php echo ($page <= 2) ? "javascript:form_page_submit(1)": "javascript:form_page_submit(".($page-1).")"?>" class="prev"><img src='../../../../../../../images/_img/prev.png' alt='이전으로'></a>
                <?php for ($i = 1; $i <= $total_page ; $i++) {   ?>
                    <a class="<?php echo ($i == $page || ($page == null && $i ==1)) ? 'on' : '#' ?>" href="javascript:form_page_submit(<?=$i?>)"><?=$i?></a>
                <?php  }?>
                <a href="<?= $total_page <= $page?"javascript:form_page_submit(".$total_page.")":"javascript:form_page_submit(".($page+1).")"?>" class="next"><img src='../../../../../../../images/_img/next.png' alt='다음으로'></a>
                <a href="javascript:form_page_submit(<?=$total_page;?>)" class="next end"><img src='../../../../../../../images/_img/last.png' alt='맨마지막'></a>
            </p>

         <p class="pop_btn"><a href="javascript:window.close();" class="del">취소</a></p>
      </div>
   </div>
   <form action="pp_process/assetEmployeeInfoEdit_proc.jsp" id="form_proc" method="post" >
		<input type="hidden" name="ass_idx" value="<?=$ASS_IDX?>" />
		<input type="hidden" id="emp_idx" name="emp_idx" value="" />
      <input type="hidden" id="emp_name" name="emp_name" value="" />
   </form>
</body>
<script>
    function form_submit(){
        $("#frm").submit();
    }

	function form_page_submit(page){
		$("#frm_page").attr("value", page);
        $("#frm").submit();
    }
	function onClick(idx) {
		$("#emp_idx").val(idx);
      $emp_name = $("#emp_name"+idx).text();
		$("#emp_name").val($emp_name);
		$("#form_proc").submit();
	  }
</script>
</html>