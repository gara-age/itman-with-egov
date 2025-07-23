<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" language="java" %>

<?php
  include "../_inc/dbconn.php";

//데이터 ajax리턴할 변수
$num  =0;
$num1 =1;
$umn2 =2;

$id = mysqli_real_escape_string($dbconn, $_POST['id']);         //php escape는 mysql injection 을 맞기 위해 설정 해놓은거 안하고 post값만 받아도 됌

$sql="select MEM_MAIL from ITM_MEMBER where MEM_MAIL='".$_POST['id']."'";
$row=mysqli_query($dbconn,$sql);      //row 값을 저장 하고
$total = mysqli_num_rows($row);     //mysqli_num_rows 함수는 리절트 셋(result set)의 총 레코드 수를 반환합니다 총 레코드 수를 계산해서 아이디 중복체크

if($total>0){                       //total이 0보다 크면 레코드 안에 id입력값이 존재 하기 때문에 아이디는 중복이 된다
echo $num1 =1;                  //client ->server -> client 받아온 결과로 판단하기 위해 num변수를 만들어서 보내줌
//echo"아이디중복입니다 다시 입력해주세요";
}else if(!preg_match("/^[A-Za-z0-9\.\-]+@[A-Za-z0-9\.\-]+\.[A-Za-z0-9\.\-]+$/",$id)){    //preg 정규식 체크를 하기 위한 php 함수
echo $umn2 =2;
//echo "아이디는 영문자or숫자로 6자리 이상 입력";
}else if((preg_match("/^[A-Za-z0-9\.\-]+@[A-Za-z0-9\.\-]+\.[A-Za-z0-9\.\-]+$/",$id))){
echo $num  =0;
//echo"사용가능한 아이디입니다";
}
?>