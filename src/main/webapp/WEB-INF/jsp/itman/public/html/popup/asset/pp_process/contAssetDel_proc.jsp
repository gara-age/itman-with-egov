<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" language="java" %>
<?php
	 include "../../../_inc/dbconn.php";

	 /**
	  * 세션 체크
	  */
	 include "../../../_inc/loginTest.php";
	 login_check();

     $IP = $_SERVER['REMOTE_ADDR'];
     echo($IP);

     $GRO_IDX = $_SESSION['group'];
     $MOD_IDX = $_SESSION['userIDX'];
	 $ASS_IDX= $_GET['ass_idx'];

     $delete_asset_SQL = "UPDATE ITM_ASSET SET DEL_YN = 'Y' WHERE ASS_IDX = '{$ASS_IDX}'";
     $delete_asset_query = mysqli_query($dbconn, $delete_asset_SQL);

     $asset_sql = "SELECT * FROM ITM_ASSET WHERE ASS_IDX = $ASS_IDX ";
     $asset_query = mysqli_query($dbconn, $asset_sql);
     $asset_result = mysqli_fetch_array($asset_query);
     $ASSET_IDX = $asset_result['ASS_IDX'];
     $ASSET_NAME = $asset_result['ASS_NAME'];

     echo($ASS_IDX);
     echo($ASSET_NAME);
     $asset_sql2 = "INSERT INTO ITM_ASS_LOG(ASS_IDX, AL_TYPE , AL_CAT, REG_DATE, REG_IDX, REG_IP, ASS_NAME_LOG)
                    VALUES ($ASSET_IDX, '삭제', '자산', now(), '{$MOD_IDX}', '{$IP}' ,'{$ASSET_NAME}')";

     $asset_result = mysqli_query($dbconn, $asset_sql2);

     if(mysqli_affected_rows($dbconn)==0){
         echo "<script>alert('자산 삭제에 실패하였습니다.');history.go(-1);</script>";
     }else{
         echo "<script>alert('자산을 성공적으로 삭제하였습니다.');opener.parent.location.href='/html/ingroup/assetsList.jsp';window.close();</script>";
     }
    
    
    

?>