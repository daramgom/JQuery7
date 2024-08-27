<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>test1.jsp</h1>

<!-- jquery 반드시 라이브러리 추가 -->
<script src="../js/jquery-3.7.1.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		
		alert(" jquery 실행(1) ");
		
	}); // jquery 기본적 구조 여기까지 작성해야 사용할 수 있음
	
	$(function(){
		
		alert(" jquery 실행(2) ");
		
	}); // jquery 기본적 구조 다른 형태 *일반적으로 이것을 사용함
	
	jQuery(document).ready(function(){
		
		alert(" jquery 실행(3) ");
		
	}); // jquery 기본적 구조 다른형태
	
	jQuery(function(){
		
		alert(" jquery 실행(4) ");
		
	}); // jquery 기본적 구조 다른 형태
	
	
	
// 	function 이름(){
		
// 	}

	alert(" 안녕하세요? JavaScript 실행 "); // 자바스크립트 일반적으로 먼저 실행됨
	
</script>



</body>
</html>