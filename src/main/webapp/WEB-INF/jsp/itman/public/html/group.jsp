<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" language="java" %>

<?php
    include("_inc/dbconn.php");
    session_start();
    $group = $_SESSION['group'];
    $sql = "SELECT * FROM ITM_GROUP WHERE GRO_OWNER_IDX = '".$_SESSION['userIDX']."' AND DEL_YN = 'N'";
    $result = mysqli_query($dbconn, $sql);
?>

<!doctype html>
<html lang="ko">
 <head>
     <jsp:include page="../../../_inc/header.jsp"/>
  <script>
	window.onload = function(){
		var width_size = window.innerWidth;

		if (width_size < 821) {
			$('.ham a').removeClass('on');
			$('.smn').removeClass('open');
		}else{
			$('.ham a').addClass('on');
			$('.smn').addClass('open');
			$(function(){ 
				$('.groupBox').masonry({
					itemSelector: '.groupItem',
					horizontalOrder: true
				});
			})		
		}
	}

  </script>

 </head>
<body id="group">
<%--	<? include "_inc/header.php"; ?>--%>
    <jsp:include page="../../../_inc/header.jsp"/>
	<div id="contents">
		

<!-- 새로생성될때 div class="Box"에 랜덤으로 [c01, c02, c03]클래스 중 하나가 붙게해주세요(컬러) / addBox 제외 -->

<div class="groupBox">
	<div class="groupItem">
		<a onclick="window.open('popup/addGroup.php', '그룹생성팝업', 'width=500, height=400')" href="#" class="addBox">그룹 생성하기</a>
	</div>
    <?php while($row = (mysqli_fetch_array($result))) { 
        $ASSET = "SELECT * FROM ITM_ASSET WHERE GRO_IDX={$row['GRO_IDX']} AND DEL_YN = 'N'";
        $ASSET_result = mysqli_query($dbconn, $ASSET);
        $acount = mysqli_num_rows($ASSET_result);    
        $EMPLO = "SELECT * FROM ITM_EMPLOYE WHERE GRO_IDX={$row['GRO_IDX']} AND DEL_YN = 'N'";
        $EMPLO_result = mysqli_query($dbconn, $EMPLO);
        $ecount = mysqli_num_rows($EMPLO_result);    
    ?>
        <div class="groupItem">
            <div class="Box c01">
                <p class="name"><a href="group_proc.jsp?id=0&group=<?= $row['GRO_IDX']; ?>"><?= $row['GRO_NAME']; ?></a></p>
                    <p class="going">
                    <a href="group_proc.jsp?id=1&group=<?= $row['GRO_IDX']; ?>">자산<span><?= $acount; ?></span></a>
                    <a href="group_proc.jsp?id=2&group=<?= $row['GRO_IDX']; ?>">직원<span><?= $ecount; ?></span></a>
                </p>
            </div>
        </div>
    <?php }; ?>
    

    
</div>




	</div>
<jsp:include page="../../../_inc/footer.jsp"/></body>
</html>

