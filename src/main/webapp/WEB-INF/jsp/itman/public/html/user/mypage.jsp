<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" language="java" %>

<!doctype html>
<html lang="ko">
 <head>
  <? 
  include "../_inc/title.php"; 
  ?>
 </head>
<body id="mypage">
	<? 
        include "../_inc/header.php"; 
        include "../_inc/dbconn.php"; 
        $sql = "SELECT * FROM ITM_MEMBER WHERE MEM_IDX={$_SESSION['userIDX']} AND DEL_YN = 'N'";
        $result = mysqli_query($dbconn, $sql);
        $row = mysqli_fetch_array($result);

        function add_hyphen($tel){
            $tel = preg_replace("/([0-9]{3})([0-9]{3,4})([0-9]{4})$/","\\1-\\2-\\3" ,$tel);
            return $tel;
            }

        $tel = add_hyphen($row['MEM_TEL']);
    ?>
	<div id="contents">
		<div class="mypage_box">
			<h2>마이페이지</h2>
			<ul class="myinfo">
				<li>
					<p>이름</p>
					<div><? echo $row['MEM_NAME'];?></div>
				</li>
				<li>
					<p>이메일</p>
					<div><? echo $row['MEM_MAIL'];?></div>
				</li>
				<li>
					<p>휴대폰 번호</p>
					<div><? echo $tel;?> <a onclick="window.open('../popup/phoneEdit.php', '수정팝업', 'width=500, height=335')" href="#none">수정</a></div>
				</li>
				<li>
					<p>비밀번호</p>
					<div class="full"><a href="changePass.php">변경</a></div>
				</li>
			</ul>
			
			<h3>계정관리</h3>
			<ul class="boxlist">
				<li><a href="myGroup.php">그룹관리</a></li>
				<li><a href="privacy.jsp">서비스 이용약관</a></li>
				<li><a href="accDel.php">계정탈퇴</a></li>
			</ul>
		</div>
	</div>
	<? include "../_inc/footer.php"; ?>
</body>
</html>

