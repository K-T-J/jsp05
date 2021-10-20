<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
	request.setCharacterEncoding("UTF-8");
%>

<jsp:useBean id ="vo" class = "web.jsp05.test.SignupVO"/>
<jsp:setProperty property="*" name="vo"/>

<%
	//DB 연결해서 vo안에 있는 내용을 insert 하기
	//#1.
	Class.forName("oracle.jdbc.driver.OracleDriver");

	String user ="glob06", pw = "glob06";
	String url = "jdbc:oracle:thin:@nullmaster.iptime.org:1521:ORCL";
	Connection conn = DriverManager.getConnection(url,user,pw);
	
	String sql = "insert into signup values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,sysdate)";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	
	//쿼리문에 테이블명뒤 컬럼명생략 했기때문에 DB 테이블상 컬럼순서대로 데이터 추가하기.
	pstmt.setString(1, vo.getId());
	pstmt.setString(2, vo.getPw());
	pstmt.setString(3, vo.getName());
	pstmt.setString(4, vo.getEmail());
	pstmt.setString(5, vo.getGender());
	pstmt.setString(6, vo.getMusic());
	pstmt.setString(7, vo.getSports());
	pstmt.setString(8, vo.getTravel());
	pstmt.setString(9, vo.getMovies());
	pstmt.setString(10, vo.getBirthYY());
	pstmt.setString(11, vo.getBirthMM());
	pstmt.setString(12, vo.getBirthDD());
	pstmt.setString(13, vo.getJob());
	pstmt.setString(14, vo.getBio());
	
	
	int result = pstmt.executeUpdate();
	
	
	pstmt.close();
	conn.close();
	
%>
<body>

	<%
		if(result == 1){ %>
			
			<h2> <%=vo.getId() %>님, 회원 정보 저장 완료! </h2>
			
		<% }else{ %>
			
			<h2> 저장실패... 다시 시도해주세요.</h2>
			
		<%}
	%>






</body>
</html>