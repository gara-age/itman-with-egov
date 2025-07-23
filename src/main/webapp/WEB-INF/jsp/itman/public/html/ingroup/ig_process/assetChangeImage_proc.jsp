<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" language="java" %>

<?php
   include("../../_inc/dbconn.php");

    $ASS_IDX = $_POST['ass_idx'];

    if($_FILES['fileObj']['size']> 0){
        $image_ext = array('jpg', 'jpeg', 'gif', 'png');
		$imageFullName = strtolower($_FILES['fileObj']['name']);
		$imageNameSlice = explode(".", $imageFullName);
		$imageType = end($imageNameSlice); // Ȯ���ڸ� ����
		if (!in_array($imageType, $image_ext)) {
			echo "<script>alert('jpg, jpeg, gif, png Ȯ���ڸ� �����մϴ�.'); history.back();</script>";
			exit;
		}
		$newFileName = 'asset_' . date('Ymd_His') . '_' . uniqid() . '.' . $imageType;
		$dir = "../../upload/assetImg/";
		$uploadPath = $dir . $newFileName;
		
		move_uploaded_file($_FILES['fileObj']['tmp_name'], $uploadPath);

        if(array_search($imageType, $image_ext) === false){
            echo("-1");
        }else{
            $return = $newFileName;
            echo($return);

            $sql = "UPDATE ITM_ASSET
                    SET IMAGE = '$newFileName' 
                    WHERE ASS_IDX = '{$ASS_IDX}'
                    ";
            $query = mysqli_query($dbconn, $sql);
        }
        
    }else{
        echo(0);
    }
    
    
?>