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

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원등록화면</title>
</head>
<body>
<h2>회원 등록</h2><br>
<form action="register.jsp" method="post">
<table border="1">
	<tr>
		<td>학번</td>
		<td><input type="text" name="id"></td>
	</tr>
	<tr>
		<td>이름</td>
		<td><input type="text" name="name"></td>
	</tr>
	<tr>
		<td>학과</td>
		<td><input type="text" name="department"></td>
	</tr>
	<tr>
		<td>전화번호</td>
		<td><input type="text" name="phone"></td>
	</tr>
	<tr>
		<td>주소</td>
		<td><input type="text" name="address"></td>
	</tr>
	<tr>
		<td colspan="2"><input type="submit" value="등록"></td>
	</tr>
</table>
</form>
</body>
</html>