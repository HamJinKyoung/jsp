<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Enumeration" %>
<%@ page import="java.util.Map" %>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>실행페이지</title>
</head>
<body>
	연산 결과
		float a = <%= request.getParameter("a") %>
		float b = <%= request.getParameter("b") %>
		
		<%-- <%=request.getParameter("operator") --%>
		
	
</body>
</html>