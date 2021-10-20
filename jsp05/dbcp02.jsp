<%@page import="web.jsp05.test.TestDTO"%>
<%@page import="java.util.List"%>
<%@page import="web.jsp05.test.TestDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
	TestDAO dao = new TestDAO();
	List list = dao.selectAll();
	
	for(int i = 0; i < list.size(); i++){
		TestDTO dto = (TestDTO)list.get(i);%>
		
		<h4>id : <%= dto.getId() %> / pw : <%= dto.getPw() %> / age : <%=dto.getAge()%> / reg : <%=dto.getReg() %></h4>
		
	<%}
%>
</head>
<body>




</body>
</html>