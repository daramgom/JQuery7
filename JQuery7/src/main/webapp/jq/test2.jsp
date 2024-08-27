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
		// alert("test2.jsp");
		
		// h2태그의 글자색 변경
		// var data = $('h2'); // h2태그
		// alert(data);
		// console.log(data);
		// $('h2').css('color','blue');
		
		// 선택자 : 전체, 태그선택자, id선택자, class선택자
		$("*").css('color','red'); // jquery에서 "",'' 같음
		$("h4").css('color','orange');
		$("h3").css('color','green'); // 태그명
		$("#t1").css('color','navy'); // #id명 (유일)
		$(".t2").css('color','purple'); // .class명 (중복)
		
		$("input").css('color','black');
		// 아이디 green
		$("#id").css('color','green');
		// 비밀번호 blue
		$(".pw").css('color','blue');
		
		// 속성 탐색 선택자
		$("input[type=text]").css('color','magenta');
		// $("input[type=password]").css('color','cyan');
		$("input[type^=p]").css('color','cyan'); // 시작값
		
		// $("input[type^=t]").val('ITWILL');
		var inputValue = $("input[type^=t]").val();
		alert("입력값 : "+inputValue);
		
	});// jquery 끝
	
	
	$(function(){
		// 테이블의 배경색 변경
		$('table').css('background','orange');
		// $('td').css('background','yellow');
		$('tr:first').css('background','red');
		$('tr:last').css('background','red');
		
		// 홀수행(odd) - red, 짝수행(even) - yellow, 인덱스가 0부터 시작
		$('tr:odd').css('background','red');
		$('tr:even').css('background','yellow');
		
	});// jquery 끝
	
</script>

<style type="text/css">
/* h2 {
	color: blue;
} */

</style>
</head>
<body>
	<h1>test2.jsp</h1>
	
	<h4> 제목1 </h4>
	<h3> 제목2 </h3>
	<h2 id="t1"> 제목3-1 </h2>
	<h2 id="t1"> 제목3-2 </h2>
	<h2 class="t2"> 제목4-1 </h2>
	<h2 class="t2"> 제목4-2 </h2>
	
	<hr>
	아이디 : <input type="text" name="id" autocomplete="off" id="id" value="itwill"> <br>
	비밀번호 : <input type="password" name="pw" class="pw"> <br>
	
	<hr>
	
	<table border="1">
		<tr>
			<td>1</td><td>2</td><td>3</td>
		</tr>
		<tr>
			<td>1</td><td>2</td><td>3</td>
		</tr>
		<tr>
			<td>1</td><td>2</td><td>3</td>
		</tr>
		<tr>
			<td>1</td><td>2</td><td>3</td>
		</tr>
	</table>
	
</body>
</html>