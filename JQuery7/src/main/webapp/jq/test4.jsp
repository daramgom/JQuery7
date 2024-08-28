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
		// alert("test4.jsp");
		
		
		// * 요소의 내용을 수정(가져오기) - html(), text() *
		var hValue = $('h2').html();
		// alert(hValue); // --> head-0 (해당 요소중 첫번째 요소의 값)
		var tValue = $('h2').text();
		// alert(tValue); // --> head-0, head-1, head-2 (해당 요소 모두 요소의 값)
		
		// h2태그에 내용 변경
		// $('h2').html('아이티윌');
		$('h2:last').html('아이티윌');
		$('h2:first').text('부산');
		
		// h2태그에 내용 변경
 		$('h2').html("<h2> 아이티윌 입니다^_^ </h2>");
		// --> 실제 태그를 적용해서 내용을 변경
		
		// $('h2').text("<h2> 아이티윌 입니다^_^ </h2>");
		// --> 실제 태그를 적용X, 내용(문자) 그대로 변경
		
		//" 아이티윌 부산교육센터 " 내용 변경
		// $('h2').html("<h2> 아이티윌 부산교육센터 ^_^ </h2>");
		$('h2').html(function(idx,oldHTML){
			// alert(a+"/"+b);
			// return oldHTML + " 부산교육센터";
			return "<h2> 아이티윌 부산교육센터 </h2>";
		});
		
		
		// * 요소의 내용 추가 - append(), prepend() *
		$('body').append("<h1> 뒤쪽에 추가 append() </h1>");
		$('body').prepend("<h1> 앞쪽에 추가 prepend() </h1>");
		$('h1').append(function(idx,data){
			// alert(idx+"/"+data);
			return " 아이티윌 ";
		});
		
// 		$('div').append(function(idx){
// 			return idx+1;
// 		});
		
		
		// 자바스크립트(+제이쿼리)에서는 
		// []배열, {} 객체를 의미함(JSON)
		
		// ***** 배열 *****
		var contentArr = [
			{ name:"김학생", region:"부산" },
			{ name:"이학생", region:"서울" },
			{ name:"박학생", region:"대구" },
			{ name:"최학생", region:"제주" }
		];
		
		// alert(contentArr);
		// console.log(contentArr);
		
		// 이학생의 지역정보 출력
		// alert("지역정보 : "+contentArr[1].region);
		
		// 배열의 정보를 테이블에 내용을 추가
		$('table').append("<tr><td>"+contentArr[0].name
				+"</td><td>"+contentArr[0].region+"</td></tr>");
		$('table').append("<tr><td>"+contentArr[1].name
				+"</td><td>"+contentArr[1].region+"</td></tr>");
		$('table').append("<tr><td>"+contentArr[2].name
				+"</td><td>"+contentArr[2].region+"</td></tr>");
		$('table').append("<tr><td>"+contentArr[3].name
				+"</td><td>"+contentArr[3].region+"</td></tr>");
		
		for(var i=0;i<contentArr.length;i++) {
			$('table').append("<tr><td>"+contentArr[i].name
					+"</td><td>"+contentArr[i].region+"</td></tr>");
		}
		
		// $.each(array,callback 함수) / $(array).each(callback 함수) 함수
		
		$(contentArr).each(function(idx,item){
			// alert(idx+"/"+item);
			// console.log(item);
			$('table').append("<tr><td>"+item.name
					+"</td><td>"+item.region+"</td></tr>");
		});
		
		$.each(contentArr,function(idx,item){
			$('table').append("<tr><td>"+item.name+
					"</td><td>"+item.region+"</td></tr>");
		})
		
		// div 내용1~5 1~4까지 학생의 정보를 추가
		// 예) 내용1 - ㅇㅇㅇ/지역
// 		$.each(contentArr,function(idx,item){
// 			$('div').append(" - "+item.name+"/"+item.region);
// 		});
		$('div').append(function(idx){
			var item = contentArr[idx];
			return " - "+item.name+"/"+item.region;
		});
		
	});// jquery 끝
	
	$(function(){
// 		setInterval(function(){
// 			console.log('itwill');
// 		},2000);
		$('img').css('width',200);
		$('img').css('height',200);
		
		setInterval(function(){
			$('#divImg').append($('img').first());
		},500);
		
		
	});// jquery 끝
	
	
	
</script>
</head>
<body>
	<h1>test4.jsp</h1>
	
	<h2>head-0</h2>
	<h2>head-1</h2>
	<h2>head-2</h2>
	
	<hr>
	
	<!-- 내용1~5 -->
	<div>내용</div>
	<div>내용</div>
	<div>내용</div>
	<div>내용</div>
	<div>내용</div>
	
	<hr>
	
	<table border="1">
		<tr>
			<th>이름</th>
			<th>지역</th>
		</tr>
	</table>
	
	<hr>
	
	<div id="divImg">
		<img alt="ico_naver.png" src="ico_naver.png">
		<img alt="ico_kakao.png" src="ico_kakao.png">
		<img alt="ico_phone.png" src="ico_phone.png">
	</div>
	
	
	
</body>
</html>