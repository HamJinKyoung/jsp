<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Enumeration" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>출력</title>
</head>
<body>
	<%
		String name = request.getParameter("name");
		String color = request.getParameter("color");
		Object sports = request.getAttribute("sports");
	%>
			<%= name %>이 좋아하는 색깔은  <%= color %>이고 취미는 <%=sports %>입니다.
</body>
</html>