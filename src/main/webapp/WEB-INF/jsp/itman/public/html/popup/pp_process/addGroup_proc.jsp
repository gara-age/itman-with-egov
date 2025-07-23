<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" language="java" %>

<?php
include "../../_inc/dbconn.php";
include "../../_inc/title.php"; 
include '../../_inc/loginTest.php';
login_check();

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

 function getRealClientIp() {
     $ipaddress = '';
     if ($_SERVER['HTTP_CLIENT_IP']) {
         $ipaddress = $_SERVER['HTTP_CLIENT_IP'];
     } else if($_SERVER['HTTP_X_FORWARDED_FOR']) {
         $ipaddress = $_SERVER['HTTP_X_FORWARDED_FOR'];
     } else if($_SERVER['HTTP_X_FORWARDED']) {
         $ipaddress = $_SERVER['HTTP_X_FORWARDED'];
     } else if($_SERVER['HTTP_FORWARDED_FOR']) {
         $ipaddress = $_SERVER['HTTP_FORWARDED_FOR'];
     } else if($_SERVER['HTTP_FORWARDED']) {
         $ipaddress = $_SERVER['HTTP_FORWARDED'];
     } else if($_SERVER['REMOTE_ADDR']) {
         $ipaddress = $_SERVER['REMOTE_ADDR'];
     } else {
         $ipaddress = '알수없음';
     }
     return $ipaddress;
 }
 
 $groupName = $_POST['gr_name'];
 $memberIDX = $_SESSION['userIDX'];
 $groupNote = $_POST['gr_note'];

 $ip = getRealClientIp();

$sql = "
INSERT INTO ITM_GROUP
(GRO_NAME, GRO_OWNER_IDX, GRO_NOTE, GRO_IMG, REG_DATE, REG_IDX, REG_IP)
VALUES(
    '{$groupName}',
    '{$memberIDX}',
    '{$groupNote}',
    '{$imageFullName}',
    NOW(),
    '{$memberIDX}',
    '{$ip}'
)";

    $GRO_IDX_sql = "SELECT GRO_IDX FROM ITM_GROUP WHERE GRO_OWNER_IDX = '{$memberIDX}' AND DEL_YN = 'N'
    ORDER BY REG_DATE DESC
    LIMIT 1";

$result = mysqli_query($dbconn,$sql);
$GRO_IDX_result = mysqli_query($dbconn,$GRO_IDX_sql);
$row = (mysqli_fetch_array($GRO_IDX_result));
$GRO_IDX =$row['GRO_IDX'];

echo($GRO_IDX);

$RELATION_sql = "
INSERT  INTO ITM_MEM_GRO_RELATION
(MEM_IDX, GRO_IDX)
VALUES(
    '{$memberIDX}',
    '{$GRO_IDX}'
)";

$RELATION_result = mysqli_query($dbconn,$RELATION_sql);

if($result) {
    $IP = $_SERVER['REMOTE_ADDR'];

//    $itm_asset_SQL = "INSERT INTO ITM_ASSET
//                   (GRO_IDX, ASS_ULID, ASS_NAME, ASS_CAT_IDX, STA_IDX, LOC_IDX, EMP_IDX, SUP_IDX, BUY_DATE, PRICE, REG_DATE, REG_IDX,DEL_YN)
//                    VALUES($GRO_IDX, 'PC-001-0001', '자산 이름1', 1, 1, 1, 1, 1, '2023-01-01', '150,000', now(), $memberIDX, 'N')";
//    $itm_asset_query = mysqli_query($dbconn, $itm_asset_SQL);

//    $itm_asset_SQL = "INSERT INTO ITM_ASSET
//                    (GRO_IDX, ASS_ULID, ASS_NAME, ASS_CAT_IDX, STA_IDX, LOC_IDX, EMP_IDX, SUP_IDX, BUY_DATE, PRICE, REG_DATE, REG_IDX,DEL_YN)
//                    VALUES($GRO_IDX, 'PC-001-0002', '자산 이름2', 1, 1, 1, 1, 1, '2023-01-01', '160,000', now(), $memberIDX, 'N')";
//    $itm_asset_query = mysqli_query($dbconn, $itm_asset_SQL);

//    $itm_asset_SQL = "INSERT INTO ITM_ASSET
//                    (GRO_IDX, ASS_ULID, ASS_NAME, ASS_CAT_IDX, STA_IDX, LOC_IDX, EMP_IDX, SUP_IDX, BUY_DATE, PRICE, REG_DATE, REG_IDX,DEL_YN)
//                    VALUES($GRO_IDX, 'PC-001-0003', '자산 이름3', 1, 1, 1, 1, 1, '2023-01-01', '160,000', now(), $memberIDX, 'N')";
//    $itm_asset_query = mysqli_query($dbconn, $itm_asset_SQL);

//    $FIND_ASSET_SQL = "SELECT * FROM ITM_ASSET WHERE GRO_IDX = $GRO_IDX ORDER BY ASS_IDX DESC LIMIT 1";
//    $FIND_ASSET_QUERY = mysqli_query($dbconn, $FIND_ASSET_SQL);
//    $FIND_ASSET_RESULT = mysqli_fetch_array($FIND_ASSET_QUERY);
//    $ASSET = $FIND_ASSET_RESULT['ASS_IDX'];

//    $itm_asset_cate_SQL = "INSERT INTO ITM_ASSET_CATEGORY
//                        (GRO_IDX, ASS_CAT_CODE, ASS_CAT_NAME, REG_DATE, REG_IDX, DEL_YN)
//                        VALUES($GRO_IDX, 'PC', 'PC', now(), $memberIDX, 'N')";
//    $itm_asset_cate_query = mysqli_query($dbconn, $itm_asset_cate_SQL);

//    $itm_asset_cate_SQL = "INSERT INTO ITM_ASSET_CATEGORY
//                        (GRO_IDX, ASS_CAT_CODE, ASS_CAT_NAME, REG_DATE, REG_IDX, DEL_YN)
//                        VALUES($GRO_IDX, 'NOTE', '노트북', now(), $memberIDX, 'N')";
//    $itm_asset_cate_query = mysqli_query($dbconn, $itm_asset_cate_SQL);

//    $itm_asset_cate_SQL = "INSERT INTO ITM_ASSET_CATEGORY
//                        (GRO_IDX, ASS_CAT_CODE, ASS_CAT_NAME, REG_DATE, REG_IDX, DEL_YN)
//                        VALUES($GRO_IDX, 'COM', '컴퓨터', now(), $memberIDX, 'N')";
//    $itm_asset_cate_query = mysqli_query($dbconn, $itm_asset_cate_SQL);

//    $itm_ass_log_SQL = "INSERT INTO ITMAN.ITM_ASS_LOG
//                        (ASS_IDX, AL_TYPE, AL_CAT, AL_CONT, AL_NOTE, REG_DATE, REG_IDX, REG_IP, ASS_NAME_LOG)
//                        VALUES($ASSET, '생성', '자산', '303호', '새로 구매', now(), $memberIDX, '111.111.111.1', '컴퓨터1')";
//    $itm_ass_log_query = mysqli_query($dbconn, $itm_ass_log_SQL);

//    $itm_ass_log_SQL = "INSERT INTO ITMAN.ITM_ASS_LOG
//                        (ASS_IDX, AL_TYPE, AL_CAT, AL_CONT, AL_NOTE, REG_DATE, REG_IDX, REG_IP, ASS_NAME_LOG)
//                        VALUES($ASSET, '수정', '사용직원', '분실->', '분실로 인해 사용불가', now(), $memberIDX, '111.111.111.1', '컴퓨터2')";
//    $itm_ass_log_query = mysqli_query($dbconn, $itm_ass_log_SQL);

//    $itm_ass_log_SQL = "INSERT INTO ITMAN.ITM_ASS_LOG
//                        (ASS_IDX, AL_TYPE, AL_CAT, AL_CONT, AL_NOTE, REG_DATE, REG_IDX, REG_IP, ASS_NAME_LOG)
//                        VALUES($ASSET, '삭제', '위치', '101호 -> 102호', '퇴사에 의한 자산 수거', now(), $memberIDX, '111.111.111.1', '컴퓨터3')";
//    $itm_ass_log_query = mysqli_query($dbconn, $itm_ass_log_SQL);
    
//    $itm_division_SQL = "INSERT INTO ITMAN.ITM_DIVISION
//                        (GRO_IDX, DIV_CODE, DIV_NAME, DIV_LOC, REG_DATE, REG_IDX, DEL_YN, DIV_YN)
//                        VALUES($GRO_IDX, '001', '경영관리팀', '경영관리팀', now(), $memberIDX, 'N', '사용')";
//    $itm_division_query = mysqli_query($dbconn, $itm_division_SQL);

//    $itm_division_SQL = "INSERT INTO ITMAN.ITM_DIVISION
//                        (GRO_IDX, DIV_CODE, DIV_NAME, DIV_LOC, REG_DATE, REG_IDX, DEL_YN, DIV_YN)
//                        VALUES($GRO_IDX, '002', '디자인팀', '디자인팀', now(), $memberIDX, 'N', '사용안함')";
//    $itm_division_query = mysqli_query($dbconn, $itm_division_SQL);
    
//    $itm_employe_SQL = "INSERT INTO ITM_EMPLOYE
//                        (GRO_IDX, EMP_NUM, EMP_NAME, EMP_MAIL, EMP_TEL, DIV_IDX, POS_IDX, EMP_ST_IDX, REG_DATE, REG_IDX, DEL_YN)
//                        VALUES($GRO_IDX, '0000001', '박부장', 'openit@test.com', '010-1234-5678', 1, 1, 1, now(), $memberIDX, 'N')";
//    $itm_employe_query = mysqli_query($dbconn, $itm_employe_SQL);

//    $itm_employe_SQL = "INSERT INTO ITM_EMPLOYE
//                        (GRO_IDX, EMP_NUM, EMP_NAME, EMP_MAIL, EMP_TEL, DIV_IDX, POS_IDX, EMP_ST_IDX, REG_DATE, REG_IDX, DEL_YN)
//                        VALUES($GRO_IDX, '0000002', '정부장', 'open@test.com', '010-1234-5578', 1, 1, 1, now(), $memberIDX, 'N')";
//    $itm_employe_query = mysqli_query($dbconn, $itm_employe_SQL);

//    $itm_employe_SQL = "INSERT INTO ITM_EMPLOYE
//                        (GRO_IDX, EMP_NUM, EMP_NAME, EMP_MAIL, EMP_TEL, DIV_IDX, POS_IDX, EMP_ST_IDX, REG_DATE, REG_IDX, DEL_YN)
//                        VALUES($GRO_IDX, '0000003', '김부장', 'openitit@test.com', '010-1234-9876', 1, 1, 1, now(), $memberIDX, 'N')";
//    $itm_employe_query = mysqli_query($dbconn, $itm_employe_SQL);

//    $itm_emp_state_SQL = "INSERT INTO ITMAN.ITM_EMP_STATE
//                        ( GRO_IDX, EMP_ST_CODE, EMP_ST_NAME, EMP_ST_YN, REG_DATE, REG_IDX, MOD_DATE, MOD_IDX, DEL_YN, DEL_IDX, DEL_DATE, SL_NOTE)
//                        VALUES( $GRO_IDX, '001', '정상', 'Y', '2022-11-09 14:23:26.000', 1, NULL, NULL, 'N', NULL, NULL, '')";
//    $itm_emp_state_query = mysqli_query($dbconn, $itm_emp_state_SQL);

//    $itm_emp_state_SQL = "INSERT INTO ITMAN.ITM_EMP_STATE
//                        ( GRO_IDX, EMP_ST_CODE, EMP_ST_NAME, EMP_ST_YN, REG_DATE, REG_IDX, MOD_DATE, MOD_IDX, DEL_YN, DEL_IDX, DEL_DATE, SL_NOTE)
//                        VALUES( $GRO_IDX, '002', '퇴사', 'Y', '2022-12-11 12:00:26.000', 1, NULL, NULL, 'N', NULL, NULL, '퇴사')";
//    $itm_emp_state_query = mysqli_query($dbconn, $itm_emp_state_SQL);

//    $itm_emp_state_SQL = "INSERT INTO ITMAN.ITM_EMP_STATE
//                        ( GRO_IDX, EMP_ST_CODE, EMP_ST_NAME, EMP_ST_YN, REG_DATE, REG_IDX, MOD_DATE, MOD_IDX, DEL_YN, DEL_IDX, DEL_DATE, SL_NOTE)
//                        VALUES( $GRO_IDX, '003', '육아휴직', 'Y', '2023-01-09 15:17:00.000', 1, NULL, NULL, 'N', NULL, NULL, '출산 후 자녀의 양육을 위한 일정기간의 휴직상태')";
//    $itm_emp_state_query = mysqli_query($dbconn, $itm_emp_state_SQL);

//    $itm_hardware_SQL = "INSERT INTO ITMAN.ITM_HARDWARE
//                        (ASS_IDX, OS, CPU, BASEBOARD, MEMORY, DISK, GRAPHICS, UUID)
//                        VALUES( $ASSET, 'Microsoft Windows 10 Pro 10.0.19043', 'AMD Ryzen 7 3700X 8-Core Processor 3.6', 'Gigabyte Technology Co., Ltd. B450M DS3H V2 x.x', //'Samsung DDR4 32GB M378A4G43MB1-CTDSamsung DDR4 32GB M378A4G43MB1-CTD', 'CT1000P1SSD8 931.51GB', 'NVIDIA GeForce GTX 1050 Ti', 'hw: 03c00218-044d-05b8-d806-dd0700080009os: //dee6e40d-6ef3-4366-84e3-6335ee42f39c')";
//    $itm_hardware_query = mysqli_query($dbconn, $itm_hardware_SQL);
    
//    $itm_hardware_SQL = "INSERT INTO ITMAN.ITM_HARDWARE
//                        ( ASS_IDX, OS, CPU, BASEBOARD, MEMORY, DISK, GRAPHICS, UUID)
//                        VALUES( $ASSET, 'Windows 10 Home 19044', 'Intel(R) Core(TM) i5-10300H CPU @ 2.50GHz', 'ASUSTeK COMPUTER INC. UX535LI 1.0', '0000 DDR4   8GB 0000 DDR4   //8GB ', 'NVMeKINGSTONOM8PCP3512F-AB 512GB', 'Intel(R) UHD Graphics NVIDIA GeForce GTX 1650 Ti with Max-Q Design ', '9344C80C-9338-704E-9DDD-59B5A7E4735F  ')";
//    $itm_hardware_query = mysqli_query($dbconn, $itm_hardware_SQL);

//    $itm_location_SQL = "INSERT INTO ITMAN.ITM_LOCATION
//                        ( GRO_IDX, LOC_CODE, LOC_NAME, REG_DATE, REG_IDX, DEL_YN, SL_NOTE)
//                        VALUES($GRO_IDX, '001', '303호', '2022-11-09 14:39:44.000', $memberIDX, 'N', NULL)";
//    $itm_location_query = mysqli_query($dbconn, $itm_location_SQL);

 //   $itm_location_SQL = "INSERT INTO ITMAN.ITM_LOCATION
  //                      ( GRO_IDX, LOC_CODE, LOC_NAME, REG_DATE, REG_IDX, DEL_YN, SL_NOTE)
  //                      VALUES($GRO_IDX, '002', '101호', '2022-12-11 13:00:22.000', $memberIDX, 'N', NULL)";
 //   $itm_location_query = mysqli_query($dbconn, $itm_location_SQL);

 //   $itm_location_SQL = "INSERT INTO ITMAN.ITM_LOCATION
  //                      ( GRO_IDX, LOC_CODE, LOC_NAME, REG_DATE, REG_IDX, DEL_YN, SL_NOTE)
  //                      VALUES($GRO_IDX, '003', '505호', '2023-01-04 16:56:23.000', $memberIDX, 'N', NULL)";
  //  $itm_location_query = mysqli_query($dbconn, $itm_location_SQL);

  //  $itm_location_SQL = "INSERT INTO ITMAN.ITM_LOCATION
  //                      ( GRO_IDX, LOC_CODE, LOC_NAME, REG_DATE, REG_IDX, DEL_YN, SL_NOTE)
  //                      VALUES($GRO_IDX, '004', '202호', '2023-01-09 12:06:06.000', $memberIDX, 'N', NULL)";
   // $itm_location_query = mysqli_query($dbconn, $itm_location_SQL);

  //  $itm_position_SQL = "INSERT INTO ITMAN.ITM_POSITION
  //                      (GRO_IDX, POS_CODE, POS_NAME, REG_DATE, REG_IDX, DEL_YN, SL_NOTE)
  //                      VALUES($GRO_IDX, '001', '부장', '2022-10-09 14:32:47.000', $memberIDX, 'N', NULL)";
  //  $itm_position_query = mysqli_query($dbconn, $itm_position_SQL);
    
   // $itm_position_SQL = "INSERT INTO ITMAN.ITM_POSITION
 //                       (GRO_IDX, POS_CODE, POS_NAME, REG_DATE, REG_IDX, DEL_YN, SL_NOTE)
  //                      VALUES($GRO_IDX, '002', '과장', '2022-11-11 13:22:00.000', $memberIDX, 'N', NULL)";
 //   $itm_position_query = mysqli_query($dbconn, $itm_position_SQL);

  //  $itm_position_SQL = "INSERT INTO ITMAN.ITM_POSITION
  //                      (GRO_IDX, POS_CODE, POS_NAME, REG_DATE, REG_IDX, DEL_YN, SL_NOTE)
 //                       VALUES($GRO_IDX, '003', '팀장', '2022-12-03 11:44:38.000', $memberIDX, 'N', NULL)";
 //   $itm_position_query = mysqli_query($dbconn, $itm_position_SQL);

  //  $itm_position_SQL = "INSERT INTO ITMAN.ITM_POSITION
//                        (GRO_IDX, POS_CODE, POS_NAME, REG_DATE, REG_IDX, DEL_YN, SL_NOTE)
//                        VALUES($GRO_IDX, '004', '사원', '2023-01-13 15:23:06.000', $memberIDX, 'N', NULL)";
//    $itm_position_query = mysqli_query($dbconn, $itm_position_SQL);

  //  $itm_software_SQL = "INSERT INTO ITMAN.ITM_SOFTWARE
    //                    ( ASS_IDX, SW_NAME, SW_COM, SW_VER)
      //                  VALUES( $ASSET, 'Microsoft Visual C++ 2022 X64 Minimum Runtime - 14.32.31332', 'Microsoft Corporation', '14.32.31332')";
//    $itm_software_query = mysqli_query($dbconn , $itm_software_SQL);

  //  $itm_software_SQL = "INSERT INTO ITMAN.ITM_SOFTWARE
    //                    (ASS_IDX, SW_NAME, SW_COM, SW_VER)
      //                  VALUES( $ASSET, 'MySQL Server 8.0', 'Oracle Corporation', '8.0.30')";
//    $itm_software_query = mysqli_query($dbconn , $itm_software_SQL);

  //  $itm_state_SQL = "INSERT INTO ITMAN.ITM_STATE
    //                (GRO_IDX, STA_CODE, STA_NAME, STA_YN, STA_NOTE, REG_DATE, REG_IDX, DEL_YN)
      //              VALUES($GRO_IDX, '001', '요청중', 'N', '필요로 의해 요청된 자산 상태', '2022-11-09 14:44:22.000', $memberIDX, 'N')";
//    $itm_state_query = mysqli_query($dbconn, $itm_state_SQL); 

//    $itm_state_SQL = "INSERT INTO ITMAN.ITM_STATE
  //                  (GRO_IDX, STA_CODE, STA_NAME, STA_YN, STA_NOTE, REG_DATE, REG_IDX, DEL_YN)
    //                VALUES($GRO_IDX, '002', '고장', 'N', '고장으로 사용 불가', '2022-12-03 11:33:11.000', $memberIDX, 'N')";
//    $itm_state_query = mysqli_query($dbconn, $itm_state_SQL); 

  //  $itm_state_SQL = "INSERT INTO ITMAN.ITM_STATE
    //                (GRO_IDX, STA_CODE, STA_NAME, STA_YN, STA_NOTE, REG_DATE, REG_IDX, DEL_YN)
      //              VALUES($GRO_IDX, '003', '분실', 'N', '분실로 사용 불가', '2022-12-30 13:23:00.000', $memberIDX, 'N')";
//    $itm_state_query = mysqli_query($dbconn, $itm_state_SQL); 

  //  $itm_supplier_SQL = "INSERT INTO ITMAN.ITM_SUPPLIER
    //(GRO_IDX, SUP_CODE, SUP_NAME, SUP_TEL, REG_DATE, REG_IDX, DEL_YN, SUP_MEMO, SUP_BNUM, SUP_MAIL)
//    VALUES($GRO_IDX, '001', '싸요컴퓨터', '02-1234-1234', '2023-01-13 17:24:56.000', $memberIDX, 'N', NULL, '123-45-67890', 'itman@naver.com')";
//    $itm_supplier_query = mysqli_query($dbconn, $itm_supplier_SQL);

  //  $itm_supplier_SQL = "INSERT INTO ITMAN.ITM_SUPPLIER
//    (GRO_IDX, SUP_CODE, SUP_NAME, SUP_TEL, REG_DATE, REG_IDX, DEL_YN, SUP_MEMO, SUP_BNUM, SUP_MAIL)
//    VALUES($GRO_IDX, '002', '좋아요컴퓨터', '02-1234-5678', '2023-01-20 13:21:55.000', $memberIDX, 'N', NULL, '123-45-98765', 'test@naver.com')";
//    $itm_supplier_query = mysqli_query($dbconn, $itm_supplier_SQL);
    
//    $itm_sys_log_SQL = "INSERT INTO ITMAN.ITM_SYS_LOG
//    (SL_TYPE, SL_CAT, SL_CONT, SL_NOTE, REG_DATE, REG_IDX, REG_IP, GRO_IDX)
//    VALUES('삭제', '구매처', '006/컴터아이/043-123-4567', '구매처 파산', '2022-08-31 12:25:45.000', $memberIDX, '111.111.111.1', $GRO_IDX)";
//    $itm_sys_log_query = mysqli_query($dbconn, $itm_sys_log_SQL);

//    $itm_sys_log_SQL = "INSERT INTO ITMAN.ITM_SYS_LOG
//    (SL_TYPE, SL_CAT, SL_CONT, SL_NOTE, REG_DATE, REG_IDX, REG_IP, GRO_IDX)
//    VALUES('생성', '구매처 12', '구매처 12', '새로 구매', '2022-11-31 14:55:40.000', $memberIDX, '111.111.111.1', $GRO_IDX)";
//    $itm_sys_log_query = mysqli_query($dbconn, $itm_sys_log_SQL);

//    $itm_sys_log_SQL = "INSERT INTO ITMAN.ITM_SYS_LOG
//    (SL_TYPE, SL_CAT, SL_CONT, SL_NOTE, REG_DATE, REG_IDX, REG_IP, GRO_IDX)
//   VALUES('수정', '구매처', '78 수정 구매처', '구매처 수정', '2023-01-30 10:45:23.000', $memberIDX, '111.111.111.1', $GRO_IDX)";
//    $itm_sys_log_query = mysqli_query($dbconn, $itm_sys_log_SQL);

//    $sta_idx_SQL = "SELECT * FROM ITM_STATE WHERE GRO_IDX = $GRO_IDX ORDER BY STA_IDX DESC LIMIT 1";
//    $sta_idx_query = mysqli_query($dbconn, $sta_idx_SQL);
//    $sta_idx_result = mysqli_fetch_array($sta_idx_query);
//    $STA_IDX = $sta_idx_result['STA_IDX'];

//    $emp_sta_idx_SQL = "SELECT * FROM ITM_EMP_STATE WHERE GRO_IDX = $GRO_IDX ORDER BY EMP_ST_IDX DESC LIMIT 1";
//    $emp_sta_idx_query = mysqli_query($dbconn, $emp_sta_idx_SQL);
//    $emp_sta_idx_result = mysqli_fetch_array($emp_sta_idx_query);
//    $EMP_ST_IDX = $emp_sta_idx_result['EMP_ST_IDX'];

//    $itm_asset_UPDATE_SQL = "UPDATE ITM_ASSET 
//                                SET STA_IDX = $STA_IDX, SET ITM_EMP_STATE = $EMP_ST_IDX
//                                WHERE ASS_IDX = $ASSET";
//    $itm_asset_UPDATE_query = mysqli_query($dbconn, $itm_asset_UPDATE_SQL);

    echo "<script> alert('그룹이 생성되었습니다.'); self.close(); opener.parent.location.reload();</script>";
}else{
    echo "<script> alert('생성에 실패했습니다. 잠시 후 다시 시도해주세요.'); history.back();</script>";
}






?>