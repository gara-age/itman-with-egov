$(function(){ 
	
	// 메뉴명 연동  
	var tmn = $('.tmn ul.list li a.on').html();
	$('.tmn .m_tit').html(tmn);

	$('.tmn ul.list .depth a.on').parent().prev().addClass('on');
	
	// 대메뉴
	$('.tmn .m_tit').click(function(){
		if($(this).next().is(':visible')){
			$(this).next().removeClass('open');
		}else{
			$('.hr_btn').next().removeClass('open');
			$(this).next().addClass('open');
		}

		$('.ham a').removeClass('on');
		$('.smn').removeClass('open');
	})
	
	// 멤버십 메뉴 
	$('.hr_btn').click(function(){
		$(this).next().toggleClass('open');
		$('.tmn .m_tit').next().removeClass('open');

		$('.ham a').removeClass('on');
		$('.smn').removeClass('open');
	})

	// 사이드 메뉴 
	$('.ham a').click(function(){
		if($(this).hasClass('on')){
			$(this).removeClass('on');
			$('.smn').removeClass('open');
			$('body').removeClass('_ov')
		}else{
			$(this).addClass('on');
			$('.smn').addClass('open');
			$('body').addClass('_ov')
		}
		$('.tmn .m_tit').next().removeClass('open');
		$('.hr_btn').next().removeClass('open');
	})

	$('.smn_list p a').click(function(){
		$('.smn_list p a').not($(this)).removeClass('on');
		$(this).toggleClass('on');

		$('.smn_list li ul').not($(this).parent().next()).slideUp();
		$(this).parent().next().slideToggle();

	})


	var fileTarget = $('.filebox .upload-hidden');

	fileTarget.on('change', function(){  // 값이 변경되면
		if(window.FileReader){  // modern browser
		  var filename = $(this)[0].files[0].name;
		} 
		else {  // old IE
		  var filename = $(this).val().split('/').pop().split('\\').pop();  // 파일명만 추출
		}
		
		// 추출한 파일명 삽입
		$(this).siblings('.upload-name').val(filename);
	 });
	
})



