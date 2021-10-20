<%@page import="web.jsp05.test.TestDAO"%>
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
	
	//String id = request.getParameter("id");
	//String pw = request.getParameter("pw");
	//int age = Integer.parseInt(request.getParameter("age")); 생략 하고 대신 dto로
	
	//web.jsp05.test.TestDTO 로 이동
%>
<jsp:useBean id="dto" class = "web.jsp05.test.TestDTO"/>
<jsp:setProperty property="*" name="dto"/>
<%
	TestDAO dao = new TestDAO();	//TestDAO로 이동
	//dao.insert(id,pw,age); 구버전
	dao.insert2(dto);
%>


<body>


	<h2> 가입 </h2>

</body>
</html>