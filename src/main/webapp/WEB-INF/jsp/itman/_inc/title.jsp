<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" language="java" %>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">
<meta name="format-detection" content="telephone=no" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/_css/default.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/_css/pc.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/_css/respon.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/_css/bbs.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/_css/comn.css" />

<!-- 파비콘 -->
<link rel="shortcut icon" href="/images/_img/favicon.ico"> <!--추가-->
<link rel="apple-touch-icon" sizes="57x57" href="/images/_img/_favicon/apple-icon-57x57.png">
<link rel="apple-touch-icon" sizes="60x60" href="/images/_img/_favicon/apple-icon-60x60.png">
<link rel="apple-touch-icon" sizes="72x72" href="/images/_img/_favicon/apple-icon-72x72.png">
<link rel="apple-touch-icon" sizes="76x76" href="/images/_img/_favicon/apple-icon-76x76.png">
<link rel="apple-touch-icon" sizes="114x114" href="/images/_img/_favicon/apple-icon-114x114.png">
<link rel="apple-touch-icon" sizes="120x120" href="/images/_img/_favicon/apple-icon-120x120.png">
<link rel="apple-touch-icon" sizes="144x144" href="/images/_img/_favicon/apple-icon-144x144.png">
<link rel="apple-touch-icon" sizes="152x152" href="/images/_img/_favicon/apple-icon-152x152.png">
<link rel="apple-touch-icon" sizes="180x180" href="/images/_img/_favicon/apple-icon-180x180.png">
<link rel="icon" type="image/png" sizes="192x192"  href="/images/_img/_favicon/android-icon-192x192.png">
<link rel="icon" type="image/png" sizes="32x32" href="/images/_img/_favicon/favicon-32x32.png">
<link rel="icon" type="image/png" sizes="96x96" href="/images/_img/_favicon/favicon-96x96.png">
<link rel="icon" type="image/png" sizes="16x16" href="/images/_img/_favicon/favicon-16x16.png">
<link rel="manifest" href="/images/_img/_favicon/manifest.json">
<meta name="msapplication-TileColor" content="#ffffff">
<meta name="msapplication-TileImage" content="/images/_img/_favicon/ms-icon-144x144.png">
<meta name="theme-color" content="#ffffff">
<!-- 파비콘끝 -->
<meta property="og:image" content="/html/_img/ogimage.jpg">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.min.js"></script>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.13.2/themes/smoothness/jquery-ui.css">

<script src="/js/_js/common.js"></script>
<script src="/js/_js/pop_layer.js"></script>
<title>ITMan 아이티맨</title>

<script src="https://unpkg.com/masonry-layout@4/dist/masonry.pkgd.min.js"></script>
<script>
// 그룹박스
	$(function(){ 
		$('.groupBox').masonry({
		itemSelector: '.groupItem',
		horizontalOrder: true
		});
	})
	// 비고란 스크립트
	$(function () {
		"use strict";
		$(".etc_more").click(function () {
			var txt = $($(this).prev()).html();

			$(".more_layer").fadeIn();
			$(".pop_cont").html(txt);
		});

		$(".close, .bg").click(function () {
			$(".more_layer").fadeOut();
		});

	});
</script>
