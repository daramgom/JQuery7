<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
	
	<%
		// list.jsp 페이지 실행 -> DB에서 정보가져오기
		//     -> JSON -> 화면에 출력
		
	// 1) DB 연결 - 정보 가져오기
	// DB 연결 정보
	final String DRIVER_NAME="com.mysql.cj.jdbc.Driver";
	final String DB_URL="jdbc:mysql://localhost:3306/jspdb";
	final String DB_ID="root";
	final String DB_PW="1234";
	
	// 1. 드라이버 로드
	Class.forName(DRIVER_NAME);
	System.out.println("드라이버 로드 성공");
	// 2. DB 연결
	Connection con = DriverManager.getConnection(DB_URL,DB_ID,DB_PW);
	System.out.println("DB 연결 성공");
	System.out.println("con : "+con);
	// 3. SQL 구문 작성 & pstmt 객체 생성
	String sql=
	"select * from itwill_member";
	PreparedStatement pstmt = con.prepareStatement(sql);
	// 4. SQL 실행
	ResultSet rs = pstmt.executeQuery();
	
	// 5. 데이터 처리(DB -> JSON)
	// ArrayList memberList = new ArrayList();
	JSONArray memberList = new JSONArray();
	
	while(rs.next()) {
		// rs -> DTO(JSONObject)
		JSONObject dto = new JSONObject();
		
		dto.put("id", rs.getString("id")); // "id":"itwill"
		dto.put("pw", rs.getString("pw"));
		dto.put("email", rs.getString("email"));
		// ...
		
		memberList.add(dto);
		// json 데이터 타입을 출력
		// 스크립틀릿 밖에 주석 넣지 말기
	}
	%>
	<%=memberList %>
	
	
	
	
