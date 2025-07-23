<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" language="java" %>
<?php
// itman_return.php
include "../_inc/dbconn.php";
// ��� ����: JSON ���� ���� ����
header('Content-Type: application/json');
header('Content-Type: text/html; charset=euc-kr');
// ��û ����(body)���� JSON ������ ��������
$inputJSON = file_get_contents('php://input');

// JSON ���ڵ�
$data = json_decode($inputJSON, true);

// JSON ������ �ޱ�
$inputJSON = file_get_contents('php://input');
$data = json_decode($inputJSON, true);

$GRO_IDX    = $data['gro_idx'] ?? null;
$EMAIL      = $data['email'] ?? null;
$UUID       = $data['pc-id'] ?? null;
$OS         = $data['os'] ?? '';
$CPU        = $data['cpu'] ?? '';
$GRAPHICS   = $data['gpu'] ?? '';
$BASEBOARD  = $data['mainboard'] ?? '';
$MEMORY     = is_array($data['memory']) ? implode("|", $data['memory']) : '';
$DISK       = is_array($data['disk']) ? implode("|", $data['disk']) : '';

if (!$GRO_IDX || !$EMAIL) {
    echo '�ʼ� �Ķ����(gro_idx, email) ����';
    exit;
}

// 1. ITM_EMPLOYE���� emp_idx ��ȸ
$emp_sql = "SELECT emp_idx,emp_num,div_idx,emp_name FROM ITM_EMPLOYE WHERE gro_idx = '$GRO_IDX' AND emp_mail = '$EMAIL'";
$emp_result = mysqli_query($dbconn, $emp_sql);

if (!$emp_result || mysqli_num_rows($emp_result) === 0) {
    echo '��� ������ ã�� �� �����ϴ�.';
    exit;
}
$emp_row = mysqli_fetch_assoc($emp_result);
$EMP_IDX = $emp_row['emp_idx'];
$EMP_NUM = $emp_row['emp_num'];
$DIV_IDX = $emp_row['div_idx'];
$EMP_NAME = $emp_row['emp_name'];

$div_sql = "SELECT div_code FROM ITM_DIVISION WHERE gro_idx = '$GRO_IDX' AND div_idx = '$DIV_IDX'";
$div_result = mysqli_query($dbconn, $div_sql);
$div_row = mysqli_fetch_assoc($emp_result);
$DIV_CODE = $div_row['div_code'];

$asset_sql = "SELECT ass_idx FROM ITM_ASSET WHERE gro_idx = '$GRO_IDX' AND emp_idx = '$EMP_IDX' AND UUID = '$UUID'";
$asset_result = mysqli_query($dbconn, $asset_sql);

if ($asset_result && mysqli_num_rows($asset_result) > 0) {
    $row = mysqli_fetch_assoc($asset_result);
    $ASS_IDX = $row['ass_idx'];
    $update_sql = "UPDATE ITM_ASSET SET MOD_DATE = now(), MOD_IDX = $EMP_IDX WHERE ass_idx = '$ASS_IDX' AND UUID = '$UUID'";
    mysqli_query($dbconn, $update_sql);
    echo 'ITM_ASSET ������Ʈ �Ϸ�\n';
} else {
	$base_ulid = 'PC-'.$DIV_CODE.'-'.$EMP_NUM;
	$query = "
		SELECT CONCAT('$base_ulid', '-', LPAD(
			IFNULL(MAX(CAST(SUBSTRING_INDEX(ASS_ULID, '-', -1) AS UNSIGNED)) + 1, 1)
		, 2, '0')) AS next_ulid
		FROM ITM_ASSET
		WHERE ASS_ULID LIKE CONCAT('$base_ulid', '-%')
	";
	$result = mysqli_query($dbconn, $query);

	if ($result && $row = mysqli_fetch_assoc($result)) {
		$next_ulid = $row['next_ulid'];
	} 

    $itm_asset_SQL = "INSERT INTO ITM_ASSET 
        (GRO_IDX, ASS_ULID, ASS_NAME, ASS_CAT_IDX, STA_IDX, LOC_IDX, EMP_IDX, SUP_IDX, BUY_DATE, PRICE, REG_DATE, REG_IDX, DEL_YN,UUID) 
        VALUES (
            '$GRO_IDX',
            '$next_ulid',
            CONCAT('$EMP_NAME','_PC'),
            1,
			1,
			1,
            '$EMP_IDX',
            1,
            now(),
            '0',
            now(),
            '$EMP_IDX',
            'N',
			'$UUID'
        )";

    $insert_result = mysqli_query($dbconn, $itm_asset_SQL);

    if ($insert_result) {
        $ASS_IDX = mysqli_insert_id($dbconn);
        echo 'ITM_ASSET ��� �Ϸ�\n';
    } else {
        echo '\nITM_ASSET INSERT ����'.mysqli_error($dbconn);
		exit;
    }
}

$check_sql = "SELECT hw_idx FROM ITMAN.ITM_HARDWARE WHERE ASS_IDX = '$ASS_IDX'";
$check_result = mysqli_query($dbconn, $check_sql);

if ($check_result && mysqli_num_rows($check_result) > 0) {
    $update_sql = "
        UPDATE ITMAN.ITM_HARDWARE
        SET
            OS = '$OS',
            CPU = '$CPU',
            BASEBOARD = '$BASEBOARD',
            MEMORY = '$MEMORY',
            DISK = '$DISK',
            GRAPHICS = '$GRAPHICS',
            UUID = '$UUID'
        WHERE ASS_IDX = '$ASS_IDX'
    ";

    $hw_result = mysqli_query($dbconn, $update_sql);
} else {
    $insert_sql = "
        INSERT INTO ITMAN.ITM_HARDWARE
        (ASS_IDX, OS, CPU, BASEBOARD, MEMORY, DISK, GRAPHICS, UUID)
        VALUES (
            '$ASS_IDX',
            '$OS',
            '$CPU',
            '$BASEBOARD',
            '$MEMORY',
            '$DISK',
            '$GRAPHICS',
            '$UUID'
        )";
    $hw_result = mysqli_query($dbconn, $insert_sql);
}

if ($hw_result) {
    echo '\nITM_HARDWARE ��� �Ϸ�';
} else {
    echo '\n�ϵ���� ��� ���� '.'error : '. mysqli_error($dbconn);
	exit;
}

?>