<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" language="java" %>

<!doctype html>
<html lang="ko">
<!-- 회원가입 프로세스
    join01 - join02 - send_email_proc - certPass - join_proc - join03 
-->
<head>
  <?php include "../_inc/dbconn.php"; ?>
  <?php include "../_inc/title.php"; ?>
</head>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script language="javascript">
$(document).ready(function(e){
$(".fadeInfirst").on("keyup",function(){
var self =$(this);             
var id;
var zero = 0;
var one = 1;
var two = 2;

let tagArea = document.getElementById('idcheck');
let new_liTag = document.createElement('span');

if(self.attr("id")==="id"){  
    id=self.val();           
}
$.post(              
      "idCheck.php",
{id : id},             
function(data){
    if(data==zero){
        $('#idcheck').text('');
        new_liTag.setAttribute('class', 'true');
        new_liTag.innerHTML="사용가능한 이메일입니다";
        tagArea.appendChild(new_liTag);
    }else if(data==one){
        $('#idcheck').text('');
        new_liTag.setAttribute('class', 'false');
        new_liTag.innerHTML="이미 존재하는 이메일입니다.";
        tagArea.appendChild(new_liTag);
    }else if(data==two){
    $('#idcheck').text('');
        new_liTag.setAttribute('class', 'false');
        new_liTag.innerHTML="이메일 형식에 맞게 입력해주세요.";
        tagArea.appendChild(new_liTag);
    }
 }
 );//post
});//on
}); //document
</script>

<body>
	<div id="contents">
		<div class="user_box join">
			<p class="tit"><a href="../index.php"><img src="../../../../../../images/_img/itman_logo.png" alt="아이티맨" /></a></p>
			<ul class="step">
				<li class="comp"><span>1</span></li>
				<li class="on"><span>2</span>가입 정보 입력 및 인증</li>
				<li><span>3</span></li>
			</ul>
            <form action="send_email_proc.jsp" name="frm" id="frm" method="post">
			<ul class="mem">
				<li>
					<p>사용자 이름</p>
					<div><input type="text" id="username" name="username" placeholder="홍길동"></div>
				</li>
                <li>
					<p>이메일</p>
					<div><!-- <div class="in_btn"> -->
                    <input type="text"  class="fadeInfirst"  name="useremail" id="id" placeholder="exmple@exmple.com" required>
                    <div id="idcheck"></div>
					</div>
				</li>
				<li>
					<p>비밀번호</p>
					<div><input type="password" id="userpw" name="userpw"></div>
				</li>
				<li>
					<p>비밀번호 확인</p>
					<div>
						<input type="password" id="userpw_ch" name="userpw_ch">
					</div>
				</li>
				<li>
					<p>휴대폰</p>
					<div class="tel">
						<p class="full">
							<select id="userphone1" name="userphone1">
								<option>010</option>
								<option>011</option>
								<option>012</option>
							</select><span>-</span><input type="tel" id="userphone2" name="userphone2"><span>-</span><input type="tel" id="userphone3" name="userphone3">
						<!-- </p><a href="#">중복<br/>확인</a> -->
					</div>
				</li>
			</ul>
            <input type="hidden" name="mode" value="회원가입">
			<p class="user_btn"><a href="javascript:fn_submit();">다음</a></p>
		</div>
        </form>
        
        <?php
        $sql = "SELECT MEM_NAME FROM ITM_MEMBER WHERE DEL_YN ='N'";
        $result = mysqli_query($dbconn, $sql);
        ?>
	</div>
	<? include "../_inc/footer.php"; ?>
</body>


<script language="javascript">

function fn_submit(){

	//이름
	if($("#username").val().trim() == ""){
		alert("이름을 입력해주세요.");
		$("#username").focus();
		return false;
	}
    const expNameText = /[가-힣]+$/;
	if(!expNameText.test($("#username").val())){
		alert('이름을 한글로 입력해주세요.');
		$("#username").focus();
		return false;
	}

	// 이메일
	if($("#id").val().trim() == ""){
		alert("이메일을 입력해주세요.");
		$("#id").focus();
		return false;
	}
	// 이메일 형식 정규식
    const expEmailText = /^[A-Za-z0-9\.\-]+@[A-Za-z0-9\.\-]+\.[A-Za-z0-9\.\-]+$/;
    // 이메일이 정규식에 부합한지 체크
	if(!expEmailText.test($("#id").val())){
		alert('이메일 형식에 맞게 입력해주세요.');
		return false;
	}

    // userpw값이 비어있으면 실행.
	if($("#userpw").val().trim() == ""){
		alert("비밀번호를 입력해주세요.");
		$("#userpw").focus();
		return false;
	}
    // userpw_ch값이 비어있으면 실행.
	if($("#userpw_ch").val().trim() == ""){
		alert("비밀번호를 입력해주세요.");
		$("#userpw_ch").focus();
		return false;
	}
    // userpw값이 6자 이상 20자 이하를 벗어나면 실행.
	if($("#userpw").val().trim().length < 6 || $("#userpw").val().trim().length > 20){
		alert("비밀번호는 6자 이상 20자 이하로 입력해주세요.");
		$("#userpw").focus();
		return false;
	}
	// userpw값과 userpw_ch값이 다르면 실행.
    if($("#userpw").val().trim() != $("#userpw_ch").val().trim()) {
        alert('비밀번호가 다릅니다. 다시 입력해주세요.');
        $("#userpw").focus();
        return false;
    }

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
