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
<script type="text/javascript">
	$(document).ready(function(){
		// alert('test5.jsp');
		// $('h2').css('background','yellow');
		// var colorArr = ['red','orange','yellow','green','blue'];
		
		// addClass() : 특정 요소에 클래스명을 설정
		
		// h2 태그에 각각 알맞는 클래스명을 설정
		// $('h2').addClass('high_0');
// 		$('h2').addClass(function(idx,value){
// 			return 'high_'+idx;
// 		});
		
// 		$('h2').each(function(idx,item){
// 			// $('h2').addClass("high_"+idx);
// 			$(this).addClass("high_"+idx);
// 		});
		
		// this 레퍼런스 : 나 자신을 나타내는 레퍼런스
		//				  + 특정동작(이벤트)이 실행되는 요소(객체)
		// 				   사용자가 페이지에 방문해서 이벤트(동작)을 처리할 때 그 대상
		
		setInterval(function(){
			$('#divH2').prepend($('h2').last());
		},3000);
		
// 		$('input').bind("click",function(){
// 			alert(' jquery 클릭(bind) ');
// 		});
		
		$('input').click(function(){
			// alert(Math.random());
			$('h2').each(function(idx,item){
				// $('h2').addClass("high_"+idx);
				var randomIDX = Math.floor(Math.random()*5);
				$(this).addClass("high_"+randomIDX);
			});
		});
		
		
		
	});// jquery 끝
</script>
<style type="text/css">
	/* 디자인팀 작업 */
	.high_0 {background: red;}
	.high_1 {background: orange;}
	.high_2 {background: yellow;}
	.high_3 {background: green;}
	.high_4 {background: blue;}

</style>

</head>
<body>
	<h1>test5.jsp</h1>
	
	<div id="divH2">
		<h2>head - 0</h2>
		<h2>head - 1</h2>
		<h2>head - 2</h2>
		<h2>head - 3</h2>
		<h2>head - 4</h2>

	</div>
	
	<hr>
	
	<input type="button" value="버튼" onclick="">
	
	
</body>
</html>