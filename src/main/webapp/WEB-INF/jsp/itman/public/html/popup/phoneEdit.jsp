<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" language="java" %>

<!doctype html>
<html lang="ko">
 <head>
  <? 
  include('../_inc/dbconn.php');
  include "../_inc/title.php"; 
  include '../_inc/loginTest.php';
  session_start();
  login_check();

  $userIdx = $_SESSION['userIDX'];

  $sql = "SELECT * FROM ITM_MEMBER WHERE MEM_IDX ='{$userIdx}'";
  $query = mysqli_query($dbconn, $sql);
  $result = mysqli_fetch_array($query);
  
  $tel1 = substr($result['MEM_TEL'], 3, 4);
  $tel2 = substr($result['MEM_TEL'], 6, 4);
 ?>
 </head>
<body>

	<div id="popup">
		<div class="pop_tit">
			<p class="title">정보 변경</p>
		</div>
		<div class="pop_cont">
			<ul class="contEdit">

		    <div class="user_box join">
            <ul class="mem">
            <form action="pp_process/phoneEdit_proc.jsp" name="frm" id="frm" method="post">
                <li>
					<p>휴대폰</p>
					<div class="tel">
						<p class="full">
							<select id="userphone1" name="userphone1">
								<option>010</option>
								<option>011</option>
								<option>012</option>
							</select><span>-</span><input type="tel" id="userphone2" name="userphone2" value="<?=$tel1?>"><span>-</span><input type="tel" id="userphone3" name="userphone3" value="<?=$tel2?>">
						<!-- </p><a href="#">중복<br/>확인</a> -->
					</div>
				</li>
                </form>
			</ul></ul>
			<p class="pop_btn"><a href="javascript:self.close();" class="del">취소</a><a href="javascript:submit();" class="comp">수정</a></p>
		</div></div>
	</div>

</body>
<script>
    function submit(){

    // userphone2값이 비어있으면 실행.
    if($("#userphone2").val().trim() == ""){
        alert('휴대폰 번호를 입력해주세요.');
        $("#userphone2").focus();
        return false;
    }
	// userphone3값이 비어있으면 실행.
	if($("#userphone3").val().trim() == ""){
		alert('휴대폰 번호를 입력해주세요.');
		$("#userphone3").focus();
	return false;
    }
	// userphone2값이 4이상이면 실행.
	if($("#userphone2").val().trim().length > 4){
		alert("휴대폰 형식을 확인해주세요.");
		$("#userphone2").focus();
		return false;
	}
	// userphone3값이 4이상이면 실행.
	if($("#userphone3").val().trim().length > 4){
		alert("휴대폰 형식을 확인해주세요.");
		$("#userphone3").focus();
		return false;
	}

        frm.submit();
    }
</script>
</html>
