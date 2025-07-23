<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" language="java" %>
<?php
	 include "../../../_inc/dbconn.php";

	 /**
	  * 세션 체크
	  */
	 include "../../../_inc/loginTest.php";
	 login_check();
 
	 $EMP_IDX= $_GET['emp_idx'];

    $delete_SQL = "UPDATE ITM_EMPLOYE
                   SET DEL_YN = 'Y'
                   WHERE EMP_IDX = '{$EMP_IDX}'";
    $delete_query = mysqli_query($dbconn, $delete_SQL);
    
    if(mysqli_affected_rows($dbconn)==0){
        echo "<script>alert('직원 삭제에 실패하였습니다.');history.go(-1);</script>";
    }else{
        echo "<script>alert('직원을 성공적으로 삭제하였습니다.');opener.parent.location.href='/html/ingroup/emploList.jsp';window.close();</script>";
    }
    
    
    

?>