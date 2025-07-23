<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" language="java" %>

<?php
    	include "../_inc/dbconn.php";

        /**
         * 세션 체크
         */
        include "../_inc/loginTest.php";
        login_check();

        $REG_IDX = $_SESSION['userIDX'];
        $GRO_IDX = $_POST['gro_idx'];
        $GRO_NAME = $_POST['gro_name'];
        $GRO_NOTE = $_POST['gr_note'];
    
        $IP = $_SERVER['REMOTE_ADDR'];

        $imageFullName = "";

        if($_FILES['image']['name']){
            $imageFullName = strtolower($_FILES['image']['name']);
            $imageNameSlice = explode(".",$imageFullName);
            $imageName = $imageNameSlice[0];
            $imageType = $imageNameSlice[1];
            $image_ext = array('jpg','jpeg','gif','png');
            if(array_search($imageType,$image_ext) === false){
                errMsg('jpg, jpeg, gif, png 확장자만 가능합니다.');
            }
            
            $dir = "../groupImage/";
            move_uploaded_file($_FILES['image']['tmp_name'],$dir.$imageFullName);
         }


        $itm_group_SQL = "UPDATE ITM_GROUP
                        SET  MOD_IDX = '{$REG_IDX}', GRO_NAME = '{$GRO_NAME}', GRO_NOTE = '{$GRO_NOTE}', GRO_IMG = '{$imageFullName}', MOD_DATE = now(), MOD_IDX = $REG_IDX, MOD_IP = '{$IP}'
                        WHERE GRO_IDX = $GRO_IDX";
        $itm_group_query = mysqli_query($dbconn, $itm_group_SQL);

        if (!$itm_group_query) {
            echo(mysqli_error($dbconn));
        }

        echo "<script>alert('그룹이 성공적으로 수정되었습니다!');opener.parent.location.reload(); window.close();</script>";
        

        

?>