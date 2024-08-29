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
		
		// ** addClass() : 특정 요소에 클래스명을 설정(추가) **
		
		// h2 태그에 각각 알맞는 클래스명을 설정
		// $('h2').addClass('high_0');
// 		$('h2').addClass(function(idx,value){
// 			return 'high_'+idx;
// 		});
		
// 		$('h2').each(function(idx,item){
// 			// $('h2').addClass("high_"+idx);
// 			$(this).addClass("high_"+idx);
// 		});
		
		// * this 레퍼런스 : 나 자신을 나타내는 레퍼런스 *
		//				  + 특정동작(이벤트)이 실행되는 요소(객체) *
		// 				   사용자가 페이지에 방문해서 이벤트(동작)을 처리할 때 그 대상 *
		
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
		
		$('input').on("click",function(){
			//alert(" 클릭 이벤트 on() ");
		});
		
		// * 이벤트(event) : 브라우저에서 방문객이 발생시키는 모든 동작 *
		// https://www.w3schools.com/jquery/jquery_events.asp
		
		// ** 마우스 이벤트 **
		// 클릭 이벤트
		
		var status = true; // true : naver -> kakao / false : kakao -> naver
		
		$('img').on("click",function(){
			// * 클릭했을 때 이미지를 변경 *
			// --> 이미지태그의 속성(src) 변경
			
			// var src = $('img').attr('src');
			
			// 네이버 -> 클릭 -> 카카오 -> 클릭 -> 네이버
			if(status) {
			$('img').attr('src','ico_kakao.png');
			status = false;
			} else {
			$('img').attr('src','ico_naver.png');
			status = true;
			}
		});
		
// 		$('img').on("mouseover",function(){
// 			// alert(" mouseover 이벤트 발생 ");
// 			$('img').attr("src",'ico_phone.png');
// 		});
		
// 		$('img').on("mouseout mouseover",function(){ // --> 여러가지 동작으로 하나의 이벤트를 실행할 때 사용
// 			// alert(" mouseout 이벤트 발생 ");
// 			$('img').attr("src",'ico_instargram_r.png');
// 		});
		
		// ** 체이닝 기법 **
		// --> $('img').mouseover().mouseout();
		$('img').mouseover(function(){
			$('img').attr("src",'ico_phone.png');
		}).mouseout(function(){
			$('img').attr("src",'ico_instargram_r.png');
		});
		
		// h2 태그 클릭시 "+" 기호 하나씩 추가
		$('h2').click(function(){
			// $('h2').append('+');
			// 내가 선택한 대상(요소 태그)만 +를 추가
			$(this).append('+');
		});
		
// 		$('h2').on('click',function(){
// 		});
		
		
		// ** 키보드 이벤트 **
		
		$('textarea').on('keyup',function(){
			// alert(" keyup ");
			// 입력된 글자수 가져오기
			// var contents = $('textarea').html(); // --> 기존 태그 자체에 존재하는 값 가져오기에 안나옴
			// var contents = $('textarea').text();
			var contents = $('textarea').val();
			// alert(contents.length);
			
			// id = "txtCnt" 요소(태그)에 숫자를 변경
			$('#txtCnt').html(200 - contents.length);
			
			// 200자 이내 작성시 검정색 글씨로 카운트 숫자 표현
			// 200자 초과 작성시 빨간색 글씨로 카운트 숫자 표현
			if(200 - contents.length < 0) {
				$('#txtCnt').css('color','red');
				$('textarea').css('color','red');
			} else {
				$('#txtCnt').css('color','black');
			}
		});
		
		// form 태그 정보 제어
		// * 아이디, 비밀번호가 하나라도 입력 안되면 정보전송(submit X)
		// https://www.nextree.co.kr/p4327/ --> 정규표현식 설명 사이트
		// https://regexr.com/ --> 정규표현식 만들어주는 사이트
		
		// click / submit --> (일반적으로 submit 제어)
		$('#fr').submit(function(){
			// alert("submit() 실행");
			var id = $("#id").val();
			var pw = $("#pw").val();
			if(id == "" || id.length < 4){
				alert(" 4글자 이상의 아이디를 입력하세요 ");
				$("#id").focus();
				return false;
			}
			
			var reg = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[a-zA-Z]).{8,}$/;
			var tmp = reg.test(pw); // --> 위 정규표현식을 만족하는지 여부(true/false)
			alert(tmp);
			
			if(pw == "" || pw.length < 4) {
				alert(" 4글자 이상의 비밀번호를 입력하세요 ")
				document.getElementById("pw").focus();
				return false;
			}
			
			return true; // submit 이벤트를 수행 X
			// $('#fr').submit(false);
		});
		// $('#fr').on('submit');
		
		
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
	
	<hr>
	
	<img alt="ico_naver.png" src="ico_naver.png">
	
	<hr>
	
	<h1> 글자수 200자 제한 </h1>
	
	<h3 id="txtCnt">200</h3>
	
	<textarea rows="10" cols="20"></textarea>
	
	<hr>
	
	<fieldset>
		<legend>회원가입</legend>
		<form action="result.jsp" id="fr">
			아이디 : <input type="text" name="id" id="id" autocomplete="off"> <br>
			비밀번호 : <input type="password" name="pw" id="pw"> <br>
			<input type="submit" value="회원가입">
		</form>
	</fieldset>
	
	
	
</body>
</html>