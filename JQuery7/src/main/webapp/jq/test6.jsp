<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- jquery 반드시 라이브러리 추가 -->
<!-- <script src="../js/jquery-3.7.1.min.js"></script> -->
<!-- jquery 반드시 라이브러리 추가 (CDN : Content Delivery Network) -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>

<!-- ** bxSlider 자바스크립트 파일 링크연동 **  -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bxslider@4.2.17/dist/jquery.bxslider.min.css">
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script> -->
<script src="https://cdn.jsdelivr.net/npm/bxslider@4.2.17/dist/jquery.bxslider.min.js"></script>

<script type="text/javascript">
// 	$(document).ready(function(){
		
// 	});
	$(function(){
		// alert("test6.jsp");
		
		$('h2').css('background','orange');
		$('div').css('background','yellow');
		
		// * 태그 요소에 효과 적용 *
		// https://www.w3schools.com/jquery/jquery_ref_effects.asp
		// $('h2').hide();
		$('h2').on('click mouseover',function(){
			// $('h2').hide();
			// $('h2').toggle();
// 			$(this).next().toggle('slow',function(){
// 				// alert(" toggle 효과 끝 ");
// 				// callback 함수
// 			});
			
			// $(this).next().slideToggle();
			$(this).next().fadeToggle();
			
		});
		
		$('p').on('click',function(){
			$('h2').show();
		});
		
		$('#div1').css("width",50).css("height",50).css("background",'blue');
		
		// #div1 클릭시 마다 가로, 세로 크기를 증가
		
		$('#div1').on('click',function(){
			// 클릭한 시점의 가로, 세로 길이
			var width = $(this).css('width');
			var height = $(this).css('height');
			// 가로,세로길이 증가 (+10)
			// $('#div1').css('width',parseInt(width)+10).css('height',parseInt(height)+10);
			
			$(this).animate({
				'width':parseInt(width) + 10,
				'height':parseInt(height) + 10
			});
			
		});
		
		$(document).ready(function(){
	        $(".slider").bxSlider();
	    });
		
	});// jquery 끝

</script>
</head>
<body>
	<h1>test6.jsp</h1>
	
	<h1> 효과, 애니메이션 </h1>
	
	<h2> 열기,닫기1 </h2>
	<div>
		<h2>제목(열기,닫기1)</h2>
		<p>내용1</p>
	</div>
	
	<h2> 열기,닫기2 </h2>
	<div>
		<h2>제목 (열기,닫기2)</h2>
		<p>내용2</p>
	</div>
	
	<hr>
	
	<div id="div1"></div>
	
	<hr>
	
	<div class="slider">
      <div>I am a slide.</div>
      <div>I am another slide.</div>
    </div>
	
</body>
</html>