<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="student.Student" %>
<%@ page import="service.RegisterStudentService" %>
<%
	request.setCharacterEncoding("utf-8");
%>
    <jsp:useBean id="student" class="student.Student">
	<jsp:setProperty name="student" property="*" />
</jsp:useBean>

<%
	RegisterStudentService registerService = RegisterStudentService.getInstance();
	registerService.register(student);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
회원 등록 하였습니다.
<a href="main.jsp">[메인으로 가기]</a>

</body>
</html>