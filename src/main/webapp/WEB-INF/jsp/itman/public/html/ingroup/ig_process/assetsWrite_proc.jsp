<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" language="java" %>
<?php
	include "../../_inc/dbconn.php";

    /** 세션 체크 */
    include "../../_inc/loginTest.php";
    login_check();

    if($_FILES['file']['name']){
        $image_ext = array('jpg', 'jpeg', 'gif', 'png');
		$imageFullName = strtolower($_FILES['file']['name']);
		$imageNameSlice = explode(".", $imageFullName);
		$imageType = end($imageNameSlice); // 확장자만 추출
		if (!in_array($imageType, $image_ext)) {
			echo "<script>alert('jpg, jpeg, gif, png 확장자만 가능합니다.'); history.back();</script>";
			exit;
		}
		$newFileName = 'asset_' . date('Ymd_His') . '_' . uniqid() . '.' . $imageType;
		$dir = "../../upload/assetImg/";
		$uploadPath = $dir . $newFileName;
        move_uploaded_file($_FILES['file']['tmp_name'], $uploadPath);

    }


    $reg_idx =  $_SESSION['userIDX'];
    $group = $_SESSION['group'];
    $ulid = $_POST['ULID'];
    $FILE_NAME = $_POST['file_name'];
    $ass_name = $_POST['ass_name'];
    $ass_cat_idx = $_POST['ass_cat_idx'];
    $state = $_POST['state'];
    $location= $_POST['loc_idx'];
    $emp_idx = $_POST['emp_idx'];
    $sup_idx = $_POST['sup_idx'];
    $buy_date = $_POST['buy_date'];
    $price = $_POST['price'];
    
    $FILE_NAME = strtolower($FILE_NAME);

    //자산 일련번호 코드 중복이 되는지 체크 
    $check_ASSET_CODE_SQL = "SELECT * FROM ITM_ASSET WHERE ASS_ULID = $ulid AND GRO_IDX = $group";
    $check_ASSET_CODE_query = mysqli_query($dbconn, $check_ASSET_CODE_SQL);
    $check_ASSET_CODE_result =mysqli_num_rows($check_ASSET_CODE_query);
    
    if(!$check_ASSET_CODE_result == 0 ) {
        echo "<script>alert('자산 일련번호가 중복입니다. 다시 입력해 주세요.');history.go(-1);</script>";
        die();
    }else {

    $sql = "INSERT INTO ITM_ASSET(GRO_IDX, ASS_ULID, ASS_NAME, ASS_CAT_IDX, STA_IDX, LOC_IDX, EMP_IDX, SUP_IDX, BUY_DATE, PRICE , REG_DATE, REG_IDX, `IMAGE`, MOD_DATE)
            VALUES ( $group, '{$ulid}', '{$ass_name}', '{$ass_cat_idx}', '{$state}', '{$location}', '{$emp_idx}', '{$sup_idx}', '{$buy_date}', '{$price}', now(), '{$reg_idx}', '{$newFileName}', now())";

    $result = mysqli_query($dbconn, $sql);

    $asset_sql = "SELECT * FROM ITM_ASSET WHERE ASS_ULID = '{$ulid}'";
    echo($asset_sql);
    $asset_query = mysqli_query($dbconn, $asset_sql);
    $asset_result = mysqli_fetch_array($asset_query);
    $ASSET_IDX = $asset_result['ASS_IDX'];
    $ASSET_NAME = $asset_result['ASS_NAME'];

    $asset_sql2 = "INSERT INTO ITM_ASS_LOG(ASS_IDX, ASS_NAME_LOG, AL_TYPE , AL_CAT, REG_DATE, REG_IDX)
                    VALUES ($ASSET_IDX, '{$ASSET_NAME}','생성' , '자산', now(), '{$reg_idx}')";
echo($asset_sql2);
    $asset_result = mysqli_query($dbconn, $asset_sql2);

    if($asset_query === false) {
        $error = mysqli_error($dbconn);
        echo('<script>alert("'.$error.'");history.go(-1);</script>');
    }else{
        echo "<script>alert('자산 등록이 성공적으로 저장되었습니다!');opener.parent.location.reload();window.close();</script>";
    }
    ini_set('display_errors', '0');
     }

    ?>
    <?php
     header("Location: ../assetsList.php");
?>
    

