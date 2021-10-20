<%@page import="java.sql.Timestamp"%>
<%@page import="java.sql.Time"%>
<%@page import="java.sql.ResultSet"%>
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
<body>


<%
	//- search.jsp 에서 넘어온 데이터 뽑아서 변수에 담기
	String search = request.getParameter("id"); //꺼내오기


	//DB에 연결하여 존재하고 있는 id중 하나를 선택하여 해당 id의 전체 정보를 출력하자.
	// 드라이버 연결
	Class.forName("oracle.jdbc.driver.OracleDriver");
	// 커넥션 객체
	String user = "glob06", pw = "glob06";
	String url = "jdbc:oracle:thin:@nullmaster.iptime.org:1521:ORCL";
	Connection conn = DriverManager.getConnection(url,user,pw);
	//쿼리문 작성, PreparedStatement 객체
	String sql = "select * from test where id = ?";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, search);//-넘어온 데이터 쿼리문에 적용 변수 입력
	
	//쿼리 실행
	ResultSet rs = pstmt.executeQuery();
	if(rs.next()){/*결과가 존재하면                  만약에 가지고있으면 꺼내라 */
		String id = rs.getString("id");
		String passwd = rs.getString("pw");
		int age = rs.getInt("age");
		Timestamp reg = rs.getTimestamp("reg"); %>
		
		<h3>id : <%= id %></h3>
		<h3>pw : <%= pw %></h3>
		<h3>age : <%= age %></h3>
		<h3>reg : <%= reg %></h3>
		
	
	<%}else{%>
		
		<h3> <%= search %>는 존재하지 않는 id 입니다.</h3>
		
		
		
	<%}

	
	rs.close();
	pstmt.close();
	conn.close();
%>





</body>
</html>