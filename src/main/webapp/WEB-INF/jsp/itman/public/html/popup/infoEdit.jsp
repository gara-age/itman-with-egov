<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" language="java" %>

<!doctype html>
<html lang="ko">
 <head>
  <? include "../_inc/title.php"; ?>
 </head>
<body>

	<div id="popup">
		<div class="pop_tit">
			<p class="title">정보 변경</p>
		</div>
		<div class="pop_cont">
			<ul class="contEdit">
				<li>
					<p class="tit">자산명</p> <!-- 자산명, 최초 구매일, 가격(원) 등 인풋폼-->
					<p class="cont"><input type="text" value="표준PC_N20"></p>
				</li>
				<li>
					<p class="tit">분류</p><!-- 분류, 상태, 위치, 구매처 등 셀렉 폼-->
					<p class="cont">
						<select>
							<option>PC</option>
							<option>노트북</option>
							<option>마우스</option>
						</select>
					</p>
				</li>

				<!-- 비고란 -->
				<li>
					<p class="tit">비고</p>
					<p class="cont"><input type="text" /></p>
				</li>
			</ul>
			<p class="pop_btn"><a href="#" class="del">취소</a><a href="#" class="comp">수정</a></p>
		</div>
	</div>

</body>
</html>
