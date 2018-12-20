<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="addressbook.model.Member" %>
<%@ page import="addressbook.service.WriteMemberService" %>
<%
	request.setCharacterEncoding("utf-8");
%>
    
<jsp:useBean id="member" class="addressbook.model.Member">
	<jsp:setProperty name="member" property="*" />
</jsp:useBean>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원등록화면</title>
</head>
<body>
<h2>회원 등록</h2><br>
<form action="insert_ex.jsp" method="post">
<table border="1">
	<tr>
		<td>아이디</td>
		<td><input type="text" name="id"></td>
	</tr>
	<tr>
		<td>이름</td>
		<td><input type="text" name="name"></td>
	</tr>
	<tr>
		<td>전화번호</td>
		<td><input type="text" name="tel"></td>
	</tr>
	<tr>
		<td colspan="2"><input type="submit" value="등록"></td>
	</tr>
</table>
</form>
</body>
</html>