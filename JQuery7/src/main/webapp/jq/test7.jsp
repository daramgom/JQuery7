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
// $(document).ready(function(){
	
// });
$(function(){
	// alert('test7.jsp');
	
	
	// 동기방식 : 서버의 정보와 동일한 형태로 처리되는 방식
	// 			--> 사용자의 요청이 처리가 완료될 때까지 코드실행이 멈춤(대기)
	//			--> 페이지 이동하는 형태(주로 발생)
	
	
	// 비동기방식 (AJAX) : 서버의 정보와 다른 형태로 처리되는 방식
	//					 --> 사용자의 요청이 처리 완료될 때를 기다리지 않고 바로 처리
	// 					 --> 페이지 이동 X (한 화면에서 처리), 정보 불러오기(파일업로드/다운로드, 이메일전송)
	// 					 --> 화면의 전환없이 데이터를 처리
	
	
	// AJAX(Asyncronous JavaScript And XML) : 비동기 방식의 JavaScript, XML
	
	// $.ajax() : 데이터를 서버에 HTTP통신방식(GET/POST)으로 정보 전달(비동기 방식)
	// https://api.jquery.com/category/ajax/
	
	/*
	$.ajax({
		url : "전송 페이지(액션페이지)",
		type : "전송 방식(get(기본),post)",
		data : "전송할 데이터(파라메터)",
		dataType : "요청한 데이터 타입(html(기본값),xml,text,json)",
		success : function(data){ data : 전달받은 정보
			성공시 수행할 동작
		},
		error : function(data){ data : 실패정보
			실패시 수행할 동작	
		},
		complete : function(){
			ajax 동작이 완료시 수행하는 동작
		}
	}); 
	*/
	
	$('body').css('background','orange');
	
	
	// 동기 방식으로 string1.jsp 조회
	// location.href="string1.jsp";
	
	// 비동기 방식으로 string1.jsp 조회
	$.ajax({
		url : "string1.jsp",
		type : "get",
		dataType : "html",
		success : function(data){
			// alert(" 비동기방식으로 string1.jsp 갔다옴 ");
			// alert(data);
			$('body').append(data);
		},
		error : function(data){
			// alert(" 비동기방식 실행에 문제가 있음 ");
			// alert(data); 내용 표시 한계
			console.log(data);
		}
	});
	
	
	// string2.jsp 비동기방식 데이터처리
	// 정보 전달 + 처리된 결과 가져오기
	$.ajax({
		url:"string2.jsp",
		type:"get",
		// data:name="itwill", -> 파라메터이지만 파라메터처럼 전송하면 안됨
		data:{name:"itwill",
			age:25}, // 숫자는 "" 없이 그냥 보낼 수 있지만 받는 쪽에서 int로 사용하려고 할 때 String --> int 변환 필요
		success:function(data){
			alert(" string2.jsp 페이지 다녀옴 ");
			$('body').append("<hr> <h2>정보 전달 + 처리된 결과 가져오기</h2> ");
			$('body').append(data);
		}
	});
	
	
	// XML (eXtensible Markup Language) : 확장 가능한 마크업 언어
	//	  --> HTML형태처럼 태그를 사용해서 데이터를 저장하는 언어
	// 	  --> 다양한 플랫폼에서 사용가능한 타입(복잡한 데이터구조 표현가능)
	
	
	// xml1.jsp or xml2.xml
	$.ajax({
		url:"xml1.jsp", // == url:"xml2.xml",
		type:"get", // 기본값
		success:function(data){
			alert(" xml1.jsp 비동기 방식으로 페이지 다녀옴 ");
			$('body').append(" <hr> <h2>xml 비동기 방식 처리</h2> ")
			// alert(data);
			// console.log(data);
			// $('body').append(data);
			
			// ** find() **
			$(data).find("person").each(function(){
				var name = $(this).find("name").text();
				var gender = $(this).find("gender").text();
				var tel = $(this).find("tel").text();
				// alert(name);
				$('body').append("<hr> 이름 : "+name+" / 성별 : "+gender+" / 나이 : "+tel);
			});
		}
	});
	
	var title;
	var link;
	// var tag;
	// jtbc RSS 서비스정보를 비동기 방식으로 처리
	$.ajax({
		url:"https://fs.jtbc.co.kr/RSS/culture.xml",
		success : function(data){
			// alert(" JTBC 뉴스 정보에 접근 성공 ");
			console.log(data);
			
			// id = news에 기사제목 출력
			$(data).find("item").each(function(){
				title = $(this).find("title").text(); // 전역변수 O
				link = $(this).find("link").text();
				// alert(title);
				tag = "<a href='"+link+"'>"+title+"</a>";
				
				/* 
				var tag = "";
				    tag += "<a href='"+link+"'>"
				    tag += title
				    tag += "</a>"
				*/
				
				// ` ` (백틱) -- 20240830 이후에 설명?
// 				var tag = `
// 					<a href="link"> ${title} </a>
// 				`;
				
				
				$('#news').append(tag+"<hr>");
			});
		}
	});
	// $('#news').append("<a href='"+link+"'>"+title+"</a><hr>"); --> 출력시점시 불러오는 순서에 따라서 데이터가 존재하지 않음
	
});// jquery 끝

</script>
</head>
<body>
	<h1>test7.jsp</h1>
	
	<h1> 비동기방식 (AJAX) </h1>
	
	<hr>
	
	<div id="news"></div>


</body>
</html>