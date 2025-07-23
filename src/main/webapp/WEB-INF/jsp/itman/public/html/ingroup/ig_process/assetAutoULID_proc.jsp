<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" language="java" %>
<?php
    include("../../_inc/dbconn.php");
	header('Content-Type: application/json; charset=UTF-8');

    // ��û �Ķ����
	$gro_idx     = $_POST['gro_idx'] ?? null;
	$ass_cat_idx = $_POST['ass_cat_idx'] ?? null;
	$emp_idx     = $_POST['emp_idx'] ?? null;

	if (!$gro_idx || !$ass_cat_idx || !$emp_idx) {
		$msg = '�ʼ� �Ķ���� ����';
		$msg = mb_convert_encoding($msg, 'UTF-8', 'euc-kr');
		echo json_encode(['status' => 'error', 'message' => $msg]);
		exit;
	}

	// 1. ASS_CAT_CODE ��ȸ
	$cat_sql = "SELECT ASS_CAT_CODE FROM ITM_ASSET_CATEGORY WHERE GRO_IDX = '$gro_idx' AND ASS_CAT_IDX = '$ass_cat_idx'";
	$cat_result = mysqli_query($dbconn, $cat_sql);
	$cat_code = ($cat_result && $row = mysqli_fetch_assoc($cat_result)) ? $row['ASS_CAT_CODE'] : null;
	
	// 2. EMP_NUM ��ȸ
	$emp_sql = "SELECT EMP_NUM,DIV_IDX FROM ITM_EMPLOYE WHERE GRO_IDX = '$gro_idx' AND EMP_IDX = '$emp_idx'";
	$emp_result = mysqli_query($dbconn, $emp_sql);
	if($emp_result && $row = mysqli_fetch_assoc($emp_result)){
		$emp_num = $row['EMP_NUM'];
		$div_idx = $row['DIV_IDX'];
	}

	// 3. DIV_CODE ��ȸ
	$div_sql = "SELECT DIV_CODE FROM ITM_DIVISION WHERE GRO_IDX = '$gro_idx' AND DIV_IDX = '$div_idx'";
	$div_result = mysqli_query($dbconn, $div_sql);
	$div_code = ($div_result && $row = mysqli_fetch_assoc($div_result)) ? $row['DIV_CODE'] : null;


	// �ʵ尡 ��� ��ȸ�Ǿ����� Ȯ��
	if (!$cat_code || !$div_code || !$emp_num) {
		$msg = '�ڵ� ��ȸ ����';
		$msg = mb_convert_encoding($msg, 'UTF-8', 'euc-kr');
		echo json_encode(['status' => 'error', 'message' => $msg]);
		exit;
	}

	// 4. base ULID ����
	$base_ulid = "$cat_code-$div_code-$emp_num";

	// 5. ���� ULID �� ���� ū �ѹ��� +1 ���ϱ�
	$ulid_sql = "
		SELECT CONCAT('$base_ulid', '-', LPAD(
			IFNULL(MAX(CAST(SUBSTRING_INDEX(ASS_ULID, '-', -1) AS UNSIGNED)) + 1, 1)
		, 2, '0')) AS next_ulid
		FROM ITM_ASSET
		WHERE ASS_ULID LIKE CONCAT('$base_ulid', '-%')
	";
	$ulid_result = mysqli_query($dbconn, $ulid_sql);

	if ($ulid_result && $row = mysqli_fetch_assoc($ulid_result)) {
		echo json_encode(['status' => 'success', 'ulid' => $row['next_ulid']]);
	} else {
		$msg = 'ULID ���� ����';
		$msg = mb_convert_encoding($msg, 'UTF-8', 'euc-kr');
		echo json_encode(['status' => 'error', 'message' => $msg]);
	}
    
?>