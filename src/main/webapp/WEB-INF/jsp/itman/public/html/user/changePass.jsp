<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" language="java" %>

<?php
	include("../_inc/dbconn.php");
	session_start();



?>
<!doctype html>
<html lang="ko">
 <head>
  <? include "../_inc/title.php"; ?>
 </head>
<body id="group">
	<? include "../_inc/header.php"; ?>
	<div id="contents">
		<div class="mypage_box">
			<h2><a href="mypage.jsp">비밀번호 변경</a></h2>
			<ul class="myinfo pass">
			<form action="changePass_proc.jsp" name="frm" id="frm" method="post">
				<li>
					<p>현재 비밀번호</p>
					<div><input name="beforepw" type="password"/></div>
				</li>
				<li>
					<p>변경 비밀번호</p>
					<div><input id="pw" name="afterpw" type="password"/></div>
				</li>
				<li>
					<p>비밀번호 확인</p>
					<div><input id="comparepw" type="password"/></div>
				</li>
			</ul>

			<p class="pagebtn"><a href="javascript:form_submit();" class="comp">변경</a></p>
		</div>
	</div>
	<? include "../_inc/footer.php"; ?>
</body>
<script>
	function form_submit(){
		$pw = $("#pw").val();
		$comparepw = $("#comparepw").val();

		if($pw !== $comparepw){
			alert("두 비밀번호가 일치하지 않습니다!");
			$("#pw").val("");
			$("#comparepw").val("");
		}else{
			$("#frm").submit();
		}
		
	}
	</script>
</html>

