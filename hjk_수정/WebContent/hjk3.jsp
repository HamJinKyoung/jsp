<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>문제 3</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	String name="홍길동";
	String color="빨강";
	request.setAttribute("sports", "축구");
%>
<jsp:forward page="result.jsp">
	<jsp:param value="<%=name %>" name="name"/>
	<jsp:param value="<%=color %>" name="color"/>
</jsp:forward>
</body>
</html>