<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" language="java" %>
<?php
    	include "../../../_inc/dbconn.php";

        /**
         * 세션 체크
         */
        include "../../../_inc/loginTest.php";
        login_check();

        $IP = $_SERVER['REMOTE_ADDR'];

        $GRO_IDX = $_SESSION['group'];
        $MOD_IDX = $_SESSION['userIDX'];
        $ASS_IDX = $_POST['ass_idx'];
        $ASS_CAT_IDX = $_POST['ass_cat_idx'];
        $AL_NOTE = $_POST['al_note'];
        $ASS_CAT_NAME_AFTER = $_POST['ass_cat_name'];

        $itm_name_sql = "SELECT * FROM ITM_ASSET ia
                         LEFT JOIN ITM_ASSET_CATEGORY iac ON ia.ASS_CAT_IDX = iac.ASS_CAT_IDX
                         WHERE ia.ASS_IDX = $ASS_IDX";
        $itm_name_query = mysqli_query($dbconn, $itm_name_sql);
        $itm_name_result = mysqli_fetch_array($itm_name_query);

        $ASS_CAT_NAME_BEFORE = $itm_name_result['ASS_CAT_NAME'];

        $ASS_CAT_NAME = $ASS_CAT_NAME_BEFORE.'->'.$ASS_CAT_NAME_AFTER;

        $ASS_NAME = $itm_name_result['ASS_NAME'];
        //수정 
        $itm_cate_SQL = "UPDATE ITM_ASSET
                            SET  ASS_CAT_IDX = '{$ASS_CAT_IDX}', MOD_DATE= now(), MOD_IDX = $MOD_IDX
                            WHERE ASS_IDX = '{$ASS_IDX}'";
        $itm_cate_query = mysqli_query($dbconn, $itm_cate_SQL);
        
        $cate_sql = "SELECT * FROM ITM_ASSET ia
                     LEFT JOIN ITM_ASSET_CATEGORY iac ON ia.ASS_CAT_IDX = iac.ASS_CAT_IDX
                     LEFT JOIN ITM_LOCATION il ON ia.LOC_IDX = il.LOC_IDX
                     WHERE ia.ASS_IDX = $ASS_IDX ";
        $cate_query = mysqli_query($dbconn, $cate_sql);
        $cate_result = mysqli_fetch_array($cate_query);


        $ASS_CAT_CODE = $cate_result['ASS_CAT_CODE'];
        $LOC_CODE = $cate_result['LOC_CODE'];

		// 2. EMP_NUM 조회
		$asset_sql = "SELECT EMP_IDX FROM ITM_ASSET WHERE GRO_IDX = '$GRO_IDX' AND ASS_IDX = '$ASS_IDX'";
		$asset_result = mysqli_query($dbconn, $asset_sql);
		if($asset_result && $row = mysqli_fetch_assoc($asset_result)){
			$EMP_IDX = $row['EMP_IDX'];
		}

		// 1. ASS_CAT_CODE 조회
		$cat_sql = "SELECT ASS_CAT_CODE FROM ITM_ASSET_CATEGORY WHERE GRO_IDX = '$GRO_IDX' AND ASS_CAT_IDX = '$ASS_CAT_IDX'";
		$cat_result = mysqli_query($dbconn, $cat_sql);
		$CAT_CODE = ($cat_result && $row = mysqli_fetch_assoc($cat_result)) ? $row['ASS_CAT_CODE'] : null;
		
		// 2. EMP_NUM 조회
		$emp_sql = "SELECT EMP_NUM,DIV_IDX FROM ITM_EMPLOYE WHERE GRO_IDX = '$GRO_IDX' AND EMP_IDX = '$EMP_IDX'";
		$emp_result = mysqli_query($dbconn, $emp_sql);
		if($emp_result && $row = mysqli_fetch_assoc($emp_result)){
			$EMP_NUM = $row['EMP_NUM'];
			$DIV_IDX = $row['DIV_IDX'];
		}

		// 3. DIV_CODE 조회
		$div_sql = "SELECT DIV_CODE FROM ITM_DIVISION WHERE GRO_IDX = '$GRO_IDX' AND DIV_IDX = '$DIV_IDX'";
		$div_result = mysqli_query($dbconn, $div_sql);
		$DIV_CODE = ($div_result && $row = mysqli_fetch_assoc($div_result)) ? $row['DIV_CODE'] : null;

		// 4. base ULID 구성
		$base_ulid = "$CAT_CODE-$DIV_CODE-$EMP_NUM";

		// 5. 기존 ULID 중 가장 큰 넘버링 +1 구하기
		$ulid_sql = "
			SELECT CONCAT('$base_ulid', '-', LPAD(
				IFNULL(MAX(CAST(SUBSTRING_INDEX(ASS_ULID, '-', -1) AS UNSIGNED)) + 1, 1)
			, 2, '0')) AS next_ulid
			FROM ITM_ASSET
			WHERE ASS_ULID LIKE CONCAT('$base_ulid', '-%')
		";
		$ulid_result = mysqli_query($dbconn, $ulid_sql);
		$ulid = "";

		if ($ulid_result && $row = mysqli_fetch_assoc($ulid_result)) {
			$ulid = $row['next_ulid'];
		}

        $set_ulid_sql = "UPDATE ITM_ASSET
                         SET ASS_ULID = '{$ulid}'
                         WHERE ASS_IDX = '{$ASS_IDX}'";
        $set_ulid_query = mysqli_query($dbconn, $set_ulid_sql);

        if($ASS_CAT_IDX != $itm_name_result['ASS_CAT_IDX']){
            $cate_sql3 = "INSERT INTO ITM_ASS_LOG(ASS_IDX, ASS_NAME_LOG, AL_TYPE , AL_CAT, AL_CONT, REG_DATE, REG_IDX, REG_IP, AL_NOTE)
            VALUES ('{$cate_result['ASS_IDX']}', '{$ASS_NAME}','수정', '자산 분류', '{$ASS_CAT_NAME}',now(), '{$MOD_IDX}', '{$IP}', '{$AL_NOTE}')";
    
            $cate_result = mysqli_query($dbconn, $cate_sql3);
            echo "<script>alert('자산 분류가 성공적으로 수정되었습니다!');opener.parent.location.reload(); window.close();</script>";
        }else{
            echo "<script>alert('동일한 분류를 선택하셨습니다. 다시 선택해주세요!');history.go('-1');</script>";
        }

        

        if (!$itm_cate_query) {
            echo(mysqli_error($dbconn));
        }


  
?>