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
	
	// $(document).ready(function(){}
	$(function(){
		// alert("test8.jsp");
		
		// ajax()의 대표적인 리턴타입 : HTML, XML, JSON

		// JSON 데이터 타입
		// JSON(JavaScript Object Notation) : 자바스크립트 객체 표현식
		//		 	--> 개방형 표준 데이터 포멧의 일부(예: xml, csv, ...)

		//	장점
		//	  1) 단순 텍스트형태, 속성-값 쌍으로 구성 --> "속성":값
		//	  2) 데이터 크기가 작음 --> 전송속도 빠름
		//	  3) 특정 언어, 플랫폼에 독립적
		//	  4) 대부분의 언어, 플랫폼, 브라우저에는 JSON파서가 포함되어있음

		//  단점
		//	  1) 문법에 예민함 ("" '' . , <-- 문법체크 필요)
		//	  2) 자바스크립트 기반이기 때문에 JS코드가 포함될 수 있음(취약점)

		// JSON 문법
		// - 데이터 표현
		//    "속성(key)" : 값(value)
		// - 객체 표현
		//    { "속성(key)" : 값(value), "속성(key)" : 값(value) }

		/*
			{ 
			"속성(key)" : 값(value),
			"속성(key)" : 값(value),
			...
			}
		*/

		// - 배열 표현 --> [ ]
		//    ["속성(key)" : 값(value), { "속성(key)" : 값(value)}, [ ], ... ]

		// * 속성은 ""으로 묶어서 선언, 값은 타입에 따라서 변경 *

		// ** JSON 타입의 자료형 **
		// - 정수 : 단순한 숫자표현가능 (2,8,16진수는 표현X)
		// - 실수 : 소수점이하 자리수를 포함하는 숫자 표현
		//  		(고정소수점 1.001 , 부동소수점 2.5e-5)
		// - 논리형 boolean : true, false
		// - Null
		// - 문자열 : String 타입데이터 저장 --> ""를 사용해서 저장한 타입(0개 이상의 유니코드)
		// - 배열

		// * 날짜 정보(Date)타입 지원 X * --> 문자형태("2024-09-04"), 숫자형태(20240904)
		
		
		// 비동기방식 ajax() 사용해서 JSON데이터 타입정보 가져오기
		$.ajax({
			url:"json1.jsp",
			dataType:"json",
			success:function(data){
				// alert("json1.jsp 페이지를 다녀옴");
				// alert(data);
				console.log(data);
				// $('body').append(data);
				$('body').append(data.name+"<hr>");
				$('body').append(data.age+"<hr>");
				$('body').append(data.gender+"<hr>");
			}
		});
		
		// ** $.getJSON **
		/*
		$.getJSON("주소",function(){
			// 성공시 처리 동작
		});
		*/
		
		$.getJSON("json2.json",function(object){
			// alert("getJSON 사용하여 데이터 가져옴");
			
			// $('body').append("\n"+object.name);
			console.log(object); // {"name":"ITWILL","age":20,"gender":"M"}
			$(object).each(function(key,value) {
				// $('body').append(key+" : "+value+"<hr>"); // 객체{}가 하나
				$('body').append(key+" : "+value.name+"<hr>");
			});
		});
		
		
		// 비동기 방식으로 json3.json 데이터를 가져와서
		// resultDiv 공간에 정보 출력
 		// $.getJSON("json3.json",function(){});
		$.ajax({
			url:"json3.json",
			success:function(data){
				// $.each(data,function(){});
				$(data).each(function(idx,value){
					// console.log(value);
					$("#resultDiv").append(idx+" / "+value.name+" , "+value.age+" , "+value.gender+"<hr>");
					$('#resultTable').append("<tr><td>"+value.name+"</td><td>"+value.age+"</td><td>"+value.gender+"</td></tr>")
				});
			}
		});
		
		
		// 비동기방식으로 DB에 저장된 정보를 가져와서 표에 출력
		$.ajax({
			url:"list.jsp",
			success : function(data){
				// alert(data);
				// $('body').append(data);
				// #dbMember 테이블에 요소 추가
				$(data).each(function(idx,value){
					$('#dbMember').append("<tr><td>"+value.id+"</td><td>"+value.pw+"</td><td>"+value.email+"</td></tr>")
				})
			}
			
		})
		
		
	});// jquery 끝

</script>
</head>
<body>
	<h1>test8.jsp</h1>
	
	<div id="resultDiv"></div>
	
	<table border="1" id="resultTable">
		<tr>
			<td>id</td>
			<td>pw</td>
			<td>email</td>
		</tr>
		
	</table>
	
	<table border="1" id="dbMember">
		<tr>
			<td>아이디</td>
			<td>비밀번호</td>
			<td>이메일</td>
		</tr>
		
	</table>
	
	
	
</body>
</html>