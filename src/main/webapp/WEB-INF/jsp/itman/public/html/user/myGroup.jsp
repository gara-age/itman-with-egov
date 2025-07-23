<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" language="java" %>

<!doctype html>
<html lang="ko">
 <head>
  <? 
  include "../_inc/title.php"; 
  session_start();

  $group = $_SESSION['group'];
  ?>
 </head>
<body id="mypage">
	<? 
    include "../_inc/header.php"; 
    include "../_inc/dbconn.php";
    $sql = "SELECT * FROM ITM_GROUP WHERE GRO_OWNER_IDX = {$_SESSION['userIDX']} AND DEL_YN = 'N'";
    $result = mysqli_query($dbconn, $sql);
    ?>
	<div id="contents">
		<div class="mypage_box">
			<h2><a href="mypage.jsp">그룹관리</a></h2>
			<ul class="groupEdit">
				<li><a onclick="window.open('../popup/addGroup.php', '그룹생성팝업', 'width=500, height=345')" href="#none" class="addBox">그룹생성하기</a></li>

            <?php while($row = (mysqli_fetch_array($result))){?>
				<li>
					<p class="name"><? echo $row['GRO_NAME'];?></p>
					<p class="btn">
                        <a onclick="window.open('../user/groupWrite.php?idx=<?= $row['GRO_IDX']; ?>', 'EditPopUp', 'width=500, height=500, status=no,toolbar=no,scrollbars=no')" class="edit">수정</a>
                        <a onclick="window.open('../user/groupDel.php?id=gro_del&target=<?= $row['GRO_IDX'] ?>', 'EditPopUp', 'width=500, height=500, status=no,toolbar=no,scrollbars=no')" class="del">삭제</a>
                    </p>
				</li>
            <?php }?>
			</ul>
		</div>
	</div>
	<? include "../_inc/footer.php"; ?>

    <!-- <form method=post action="certPass.php" name="frm">
        <input type="hidden" name="username" value=<?=$username;?>>
        <input type="hidden" name="useremail" value=<?=$useremail;?>>
        <input type="hidden" name="userpw" value=<?=$userpw;?>>
        <input type="hidden" name="userphone" value=<?=$userphone;?>>
        <input type="hidden" name="rand_num" value=<?=$rand_num;?>>
        <input type="hidden" name="mode" value=<?=$mode;?>>
    </form> -->
</body>
<script language="javascript">

//document.frm.submit();
</script>
</html>


