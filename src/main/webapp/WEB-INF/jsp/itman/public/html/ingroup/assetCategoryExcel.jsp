<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" language="java" %>
<?php
include("../_inc/dbconn.php");
session_start();

// 파라미터
$group = $_SESSION['group'];
$search = $_GET['search'] ?? '';
$like = $_GET['like'] ?? '';

// 쿼리 구성
$sql = "SELECT * FROM ITM_ASSET_CATEGORY WHERE GRO_IDX = $group AND DEL_YN = 'N'";

if ($search === 'all') {
    $sql .= " AND (ASS_CAT_NAME LIKE '%$like%' OR ASS_CAT_CODE LIKE '%$like%')";
} else if ($search === 'name') {
    $sql .= " AND ASS_CAT_NAME LIKE '%$like%'";
} else if ($search === 'code') {
    $sql .= " AND ASS_CAT_CODE LIKE '%$like%'";
}

$sql .= " ORDER BY ASS_CAT_IDX DESC";
$query = mysqli_query($dbconn, $sql);

// 엑셀 다운로드 헤더
header("Content-Type: application/vnd.ms-excel; charset=utf-8");
header("Content-Disposition: attachment; filename=asset_category_list.xls");
header("Content-Description: PHP Generated Data");

// 엑셀 형식 HTML 출력 시작
echo "<meta charset='utf-8'>";
echo "<table border='1'>";
echo "<thead>
        <tr>
            <th>코드</th>
            <th>자산 분류명</th>
            <th>비고</th>
        </tr>
      </thead><tbody>";

while ($row = mysqli_fetch_assoc($query)) {
    echo "<tr>
            <td>{$row['ASS_CAT_CODE']}</td>
            <td>{$row['ASS_CAT_NAME']}</td>
            <td>{$row['SL_NOTE']}</td>
          </tr>";
}

echo "</tbody></table>";
exit;
